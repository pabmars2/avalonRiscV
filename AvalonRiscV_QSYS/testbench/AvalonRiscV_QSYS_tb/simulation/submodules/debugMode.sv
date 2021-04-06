module debugMode(CLK, RST, chipselect_debug, write_debug, writedata_debug, read_debug, adress_debug, readdata_debug, debug, enable_ext, enable_pc_ext, tx_flag);

//GENERAL
input CLK, RST;

//AVALON SLAVE connections
input chipselect_debug;
input write_debug;
input [31:0] writedata_debug;
input read_debug;
input [2:0] adress_debug;
output [31:0] readdata_debug;

//CONTROL DEBUG SIGNAL
output debug;
output [3 : 0] enable_ext;
output enable_pc_ext;
output tx_flag;


//Internal connects
wire [31 : 0] reg0_internal, reg1_internal, reg2_internal;
wire [31 : 0] data_internal;
wire we_internal;

enum {IDLE, RECEPT, SEND, DONE} state;

avalon_slave_MM_interface	slave_debug(
	.reset(RST),
   .clock(CLK),
   .chipselect(chipselect_debug),
   .address(adress_debug), 
   .write(write_debug),
   .writedata(writedata_debug),
   .read(read_debug),                                     
   .readdata(readdata_debug), 
   .reg0(reg0_internal), //bits de control
	.reg1(reg1_internal), //address a usar en  instrucciones
	.reg2(reg2_internal), //address a usar en externos
   .data(data_internal), 
   .we(we_internal));	


	
always_ff @(posedge CLK or posedge RST)
begin
	if(RST)
		state <= IDLE;
	else
	begin
		case(state)
			
			IDLE:
				begin
					
				end
			
			RECEPT:
				begin
				
				end
			
			SEND:
				begin
				
				end
			
			DONE:
				begin
				
				end
				
			default:
				begin
				
				end
			
		endcase
		
	end
end	
	
always_comb
begin
	if(RST)
		begin
		
		end
	else
	begin
		case(state)
			
			IDLE:
				begin
				
				end
			
			RECEPT:
				begin
				
				end
			
			SEND:
				begin
				
				end
			
			DONE:
				begin
				
				end
				
			default:
				begin
				
				end
			
		endcase
		
	end	

end

endmodule 