module debugMode(CLK, RST, chipselect_debug, write_debug, writedata_debug, read_debug, 
adress_debug, readdata_debug, debug, enable_ext, enable_pc_ext, tx_flag, address_bridged,
data_bridged, mode, data_internal);

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
output reg [3 : 0] enable_ext;
output reg enable_pc_ext;
output reg tx_flag;

output reg [31 : 0] address_bridged;
output reg [31 : 0] data_bridged;
output reg [2 : 0] mode;
input [31 : 0] data_internal;

//Internal connects
wire [31 : 0] reg0_internal, reg1_internal, reg2_internal;
wire we_internal;

assign debug = reg0_internal[0]; 
assign data_bridged = reg2_internal;
assign address_bridged = reg1_internal;

enum {INITIAL, IDLE, DEBUG, DONE} state;

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
		state <= INITIAL;
	else
	begin
		case(state)
			
			INITIAL:
				begin
					if(reg0_internal[0] == 1'b0)
						state <= INITIAL;
					else
						state <= IDLE;
				end
			
			IDLE:
				begin
					if(chipselect_debug == 1'b1 && reg0_internal[0] == 1'b0)
						state <= DEBUG;
					else
						state <= IDLE;
				end
			
			DEBUG:
				begin
					if(reg0_internal[0] == 1'b1)
						state <= DONE;
					else
						state <= DEBUG;
				end
			
			DONE:	state <= IDLE;
				
			default:	state <= INITIAL;
			
		endcase
		
	end
end	
	
always_comb
begin
	if(RST)
	begin
		enable_pc_ext = 1'b0;
		enable_ext = 3'b000;
		mode = 3'b100;
		tx_flag = 1'b0;
	end
	else
	begin
		case(state)
			
			INITIAL:
				begin
					enable_pc_ext = 1'b0;
					enable_ext = 3'b000;
					mode = 3'b100;
					tx_flag = 1'b0;
 				end
			
			IDLE:
				begin
					enable_pc_ext = 1'b1;
					enable_ext = 3'b111;
					mode = 3'b000;
					tx_flag = 1'b0;
				end
			
			DEBUG:
				begin
					if(reg0_internal[1] == 1'b0) //si el micro esta parado podemos leer y escribir
					begin
						case(reg0_internal[5:3])
							
							3'b000:	
								begin
									mode = 3'b000;
									tx_flag = 1'b0;
								end
							
							3'b001:	
								begin
									mode = 3'b001;
									tx_flag = 1'b1;
								end
							
							3'b010:	
								begin
									mode = 3'b010;
									tx_flag = 1'b1;
								end
							
							3'b011:	
								begin
									mode = 3'b011;
									tx_flag = 1'b0;
								end
							
							3'b100:	
								begin
									mode = 3'b100;
									tx_flag = 1'b0;
								end
								
							3'b101:	
								begin
									mode = 3'b101;
									tx_flag = 1'b0;
								end
							
							default:	
								begin
									mode = 3'b000;
									tx_flag = 1'b0;
								end	
							
						endcase
						
						enable_pc_ext = 1'b0;
						enable_ext = 3'b000;
						
					end
					else
					begin
						mode = 3'b000;
						tx_flag = 1'b0;
						if(reg0_internal[0] == 1'b1)	//ejecucion por pasos
							begin
								enable_pc_ext = 1'b1; //CAMBIAR
								enable_ext = 3'b111;	//CAMBIAR						
							end
							else	//ejecucion continua
							begin
								enable_pc_ext = 1'b1;
								enable_ext = 3'b111;
							end
					end
				end
			
			DONE:
				begin
					enable_pc_ext = 1'b1;
					enable_ext = 3'b111;
					mode = 3'b000;
					tx_flag = 1'b0;
				end
				
			default:
				begin
					enable_pc_ext = 1'b1;
					enable_ext = 3'b111;
					mode = 3'b000;
					tx_flag = 1'b0;
				end
			
		endcase
		
	end	

end

endmodule 