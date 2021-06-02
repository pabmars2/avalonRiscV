module debugMode(CLK, RST, chipselect_debug, write_debug, writedata_debug, read_debug, 
adress_debug, readdata_debug, debug, enable_ext, enable_pc_ext, tx_flag, address_bridged,
data_bridged, mode, data_internal, doneSending, enableStep, clr_ext, doneInstr, doneExt);

parameter freq = 50000000;

//GENERAL
input CLK, RST;

//AVALON SLAVE connections
input chipselect_debug;
input write_debug;
input [31:0] writedata_debug;
input read_debug;
input [2:0] adress_debug;
output reg [31:0] readdata_debug;

//CONTROL DEBUG SIGNAL
output reg debug;
output reg [3 : 0] enable_ext, clr_ext;
output reg enable_pc_ext;
output reg tx_flag;

output reg [31 : 0] address_bridged;
output reg [31 : 0] data_bridged;
output reg [2 : 0] mode;
input [31 : 0] data_internal;
input doneSending;
input enableStep;
input doneInstr, doneExt;

//Internal connects
wire [31 : 0] reg0_internal, reg1_internal, reg2_internal;
reg we_internal;
reg doneSendingAux = 0;

reg [31 : 0] r_Clock_Count = 0;

assign debug = ~reg0_internal[0]; 
assign data_bridged = reg2_internal;
assign address_bridged = reg1_internal;
assign clr_ext = (reg0_internal[8] == 1'b1) ? 4'b1111 : 4'b0000;

enum {/*INITIAL,*/ IDLE, DEBUG, DONE} state;

assign we_internal = ((((reg0_internal[6:4] == 3'b001) | (reg0_internal[6:4] == 3'b010)) & (doneInstr | doneExt)) | (reg0_internal[6:4] == 3'b110) | (reg0_internal[6:4] == 3'b101)) ? 1'b1 : 1'b0;

avalon_slave_MM_interface	slave_debug(
	.reset(RST),
   .clock(CLK),
   .chipselect(chipselect_debug),
   .address(adress_debug), 
   .write(write_debug),
   .writedata(writedata_debug),
   .read(read_debug),                                     
   .readdata(readdata_debug), 
   .reg0(reg0_internal), //bits de control	[0]nDebug
	.reg1(reg1_internal), //address
	.reg2(reg2_internal), //datos
   .data(data_internal), 
   .we(we_internal));	


	
always_ff @(posedge CLK or posedge RST)
begin
	if(RST)
	begin
		enable_pc_ext = 1'b0;
		enable_ext = 4'b0000;
		mode = 3'b000;
		tx_flag = 1'b0;
		//we_internal = 1'b0;
		
		r_Clock_Count = 0;
		
		state <= IDLE;//INITIAL;
	end
	else
	begin
		case(state)
			
			/*INITIAL:
				begin
					enable_pc_ext = 1'b0;
					enable_ext = 4'b0000;
					mode = 3'b100;
					tx_flag = 1'b0;
					we_internal = 1'b0;
					
					r_Clock_Count = 0;
					doneSendingAux = 1'b0;
					
					case({reg0_internal[0],reg0_internal[1]})
						
						2'b01: state <= INITIAL;
						
						2'b00: state <= DEBUG;
						
						2'b10: state <= IDLE;
						
						default: state <= IDLE;
					
					endcase
 				end*/
			
			IDLE:
				begin
					enable_pc_ext = 1'b1;
					enable_ext = 4'b1111;
					mode = 3'b000;
					tx_flag = 1'b0;
					//we_internal = 1'b0;
					
					r_Clock_Count = 0;
					doneSendingAux = 1'b0;
					
					case({reg0_internal[0],reg0_internal[1]})
						
						//2'b01: state <= INITIAL;
						
						2'b10: state <= DEBUG;
						
						2'b00: state <= IDLE;
						
						default: state <= IDLE;
					
					endcase
				end
			
			DEBUG:
				begin
					if(reg0_internal[2] == 1'b0) //si el micro esta parado podemos leer y escribir
					begin
						r_Clock_Count = 0;
						case(reg0_internal[6:4])
							
							3'b000:	
								begin
									mode = 3'b111;
									tx_flag = 1'b0;
									//we_internal = 1'b0;
									doneSendingAux = 1'b0;
								end
							
							3'b001:	
								begin
									mode = 3'b001;
									
									/*if(doneExt)
										we_internal = 1'b1;
									else
										we_internal = 1'b0;*/
																		
									
									if(doneSending)
										doneSendingAux = 1'b1;
										
									if(doneSendingAux == 1'b1)
										tx_flag = 1'b0;
									else
										tx_flag = 1'b1;
								end
							
							3'b010:	
								begin
									mode = 3'b010;
									
									
									/*if(doneInstr)
										we_internal = 1'b1;
									else
										we_internal = 1'b0;*/
																		
									
									if(doneSending)
										doneSendingAux = 1'b1;
										
									if(doneSendingAux == 1'b1)
										tx_flag = 1'b0;
									else
										tx_flag = 1'b1;
								end
							
							3'b011:	
								begin
									//we_internal = 1'b0;
									mode = 3'b011;
									tx_flag = 1'b0;
									doneSendingAux = 1'b0;
								end
							
							3'b100:	
								begin
									//we_internal = 1'b0;
									mode = 3'b100;
									tx_flag = 1'b0;
									doneSendingAux = 1'b0;
								end
								
							3'b101:	
								begin
									mode = 3'b101;
									//we_internal = 1'b1;
									
									if(doneSending)
										doneSendingAux = 1'b1;
										
									if(doneSendingAux == 1'b1)
										tx_flag = 1'b0;
									else
										tx_flag = 1'b1;
								end
								
							3'b110:	
								begin
									mode = 3'b110;
									//we_internal = 1'b1;
									
									if(doneSending)
										doneSendingAux = 1'b1;
										
									if(doneSendingAux == 1'b1)
										tx_flag = 1'b0;
									else
										tx_flag = 1'b1;
								end	
							
							default:	
								begin
									//we_internal = 1'b0;
									mode = 3'b000;
									tx_flag = 1'b0;
									doneSendingAux = 1'b0;
								end	
							
						endcase
						
						enable_pc_ext = 1'b0;
						enable_ext = 4'b0000;
						
					end
					else
					begin
						mode = 3'b000;
						tx_flag = 1'b0;
						//we_internal = 1'b0;
						doneSendingAux = 1'b0;
						
						if(reg0_internal[3] == 1'b1)	//ejecucion por pasos
							begin
								if (r_Clock_Count == reg0_internal[31 : 24])
								begin
									enable_pc_ext = 1'b0;
									enable_ext = 4'b0000;
								end
								else
								begin
									enable_pc_ext = 1'b1;
									enable_ext = 4'b1111;	
									
									if(enableStep)
										r_Clock_Count = r_Clock_Count + 1;
								end				
							end
							else	//ejecucion continua
							begin
								enable_pc_ext = 1'b1;
								enable_ext = 4'b1111;
								
								r_Clock_Count = 0;
							end
					end
					
					if(reg0_internal[0] == 1'b0)
						state <= DONE;
					else
						state <= DEBUG;					
				end
			
			DONE:
				begin
					enable_pc_ext = 1'b1;
					enable_ext = 4'b1111;
					mode = 3'b000;
					tx_flag = 1'b0;
					//we_internal = 1'b0;
					
					r_Clock_Count = 0;
					doneSendingAux = 1'b0;
					
					case({reg0_internal[0],reg0_internal[1]})
						
						//2'b01: state <= INITIAL;
						
						2'b10: state <= DEBUG;
						
						2'b00: state <= IDLE;
						
						default: state <= IDLE;
					
					endcase
				end
				
			default:
				begin
					enable_pc_ext = 1'b1;
					enable_ext = 4'b1111;
					mode = 3'b000;
					tx_flag = 1'b0;
					
					r_Clock_Count = 0;
					doneSendingAux = 1'b0;
					
					state <= IDLE;//INITIAL;
				end
			
		endcase
		
	end	

end

endmodule 