module interconexLogic(mode, uPAddressExt, uPAddressInstr, debugAddress, dataReadExt, dataReadInstr, uPdataWriteExt, 
uPdataWriteInstr, DEBUGWrite, dataPC, read_Ext, read_Instr, write_Ext, write_Instr, doneExt, doneInstr, startInputInstr, startInputExt,
AddressExt, AddressInstr, uPdataReadExt, uPdataReadInstr, dataReadDebug, dataWriteExt, dataWriteInstr, readExt, readInstr, 
writeExt, writeInstr, startInstr, startExt, chipselect_debug, dataPCNext);

input [2 : 0] mode;
input [31 : 0] uPAddressExt, uPAddressInstr;
input [31 : 0] debugAddress;
input [31 : 0] dataReadExt, dataReadInstr;
input [31 : 0] uPdataWriteExt, uPdataWriteInstr;
input [31 : 0] DEBUGWrite;
input [31 : 0] dataPC, dataPCNext;
input read_Ext, read_Instr, write_Ext, write_Instr;
input doneExt, doneInstr;
input startInputInstr, startInputExt;
input chipselect_debug;

output reg [31 : 0] AddressExt, AddressInstr;
output reg [31 : 0] uPdataReadExt, uPdataReadInstr;
output reg [31 : 0] dataReadDebug;
output reg [31 : 0] dataWriteExt, dataWriteInstr;
output reg readExt, readInstr, writeExt, writeInstr;
output reg startInstr, startExt;

enum {uP, READEXT, READINSTR, WREXT, WRINSTR, READPC, DONE} state;

always_comb
begin
	case(mode)
		3'b000: 
			begin
				AddressExt = uPAddressExt;
				AddressInstr = uPAddressInstr;
				
				uPdataReadExt = dataReadExt;
				uPdataReadInstr = dataReadInstr;
				dataReadDebug = 32'b0;
				
				dataWriteExt = uPdataWriteExt;
				dataWriteInstr = uPdataWriteInstr;
				
				state <= uP;
			end
			
		3'b001:
			begin
				AddressExt = debugAddress;
				AddressInstr = uPAddressInstr;
				
				uPdataReadExt = 32'b0;
				uPdataReadInstr = dataReadInstr;
				dataReadDebug = dataReadExt;
				
				dataWriteExt = uPdataWriteExt;
				dataWriteInstr = uPdataWriteInstr;
				
				if(doneExt == 1'b1)
					state <= DONE;
				else
					state <= READEXT;
			end
		
		3'b010:
			begin
				AddressExt = uPAddressExt;
				AddressInstr = debugAddress;
				
				uPdataReadExt = dataReadExt;
				uPdataReadInstr = 32'b0;
				dataReadDebug = dataReadInstr;
				
				dataWriteExt = uPdataWriteExt;
				dataWriteInstr = uPdataWriteInstr;
				
				if(doneInstr == 1'b1)
					state <= DONE;
				else
					state <= READINSTR;
			end
		
		3'b011:
			begin
				AddressExt = debugAddress;
				AddressInstr = uPAddressInstr;
				
				uPdataReadExt = dataReadExt;
				uPdataReadInstr = dataReadInstr;
				dataReadDebug = 32'b0;
				
				dataWriteExt = DEBUGWrite;
				dataWriteInstr = uPdataWriteInstr;
				
				if(doneExt == 1'b1)
					state <= DONE;
				else
					state <= WREXT;
			end
		
		3'b100:
			begin
				AddressExt = uPAddressExt;
				AddressInstr = debugAddress;
				
				uPdataReadExt = dataReadExt;
				uPdataReadInstr = dataReadInstr;
				dataReadDebug = 32'b0;
				
				dataWriteExt = uPdataWriteExt;
				dataWriteInstr = DEBUGWrite;
				
				if(doneInstr == 1'b1)
					state <= DONE;
				else
					state <= WRINSTR;
			end
		
		3'b101:
			begin
				AddressExt = uPAddressExt;
				AddressInstr = uPAddressInstr;
				
				uPdataReadExt = dataReadExt;
				uPdataReadInstr = dataReadInstr;
				dataReadDebug = dataPC;
				
				dataWriteExt = uPdataWriteExt;
				dataWriteInstr = uPdataWriteInstr;
				
				state <= READPC;
			end
			
		3'b110:
			begin
				AddressExt = uPAddressExt;
				AddressInstr = uPAddressInstr;
				
				uPdataReadExt = dataReadExt;
				uPdataReadInstr = dataReadInstr;
				dataReadDebug = dataPCNext;
				
				dataWriteExt = uPdataWriteExt;
				dataWriteInstr = uPdataWriteInstr;
				
				state <= READPC;
			end	

		default :
			begin
				AddressExt = uPAddressExt;
				AddressInstr = uPAddressInstr;
				
				uPdataReadExt = dataReadExt;
				uPdataReadInstr = dataReadInstr;
				dataReadDebug = 32'b0;
				
				dataWriteExt = uPdataWriteExt;
				dataWriteInstr = uPdataWriteInstr;
				
				state <= uP;
			end
		
	endcase
	
	
	case(state)
	
		uP: 
		begin
			readExt = read_Ext;
			readInstr = read_Instr;
			writeExt = write_Ext;
			writeInstr = write_Instr;
			
			startInstr = startInputInstr; 
			startExt = startInputExt;	
		end
		
		READEXT:
		begin
			readExt = 1'b1;
			readInstr = 1'b0;
			writeExt = 1'b0;
			writeInstr = 1'b0;
			
			if(chipselect_debug)
			begin
				startInstr = 1'b0; 
				startExt = 1'b1;	
			end
			else
			begin
				startInstr = 1'b0; 
				startExt = 1'b0;	
			end
		end
	
		READINSTR:
		begin
			readExt = 1'b0;
			readInstr = 1'b1;
			writeExt = 1'b0;
			writeInstr = 1'b0;
				
			if(chipselect_debug)
			begin
				startInstr = 1'b1; 
				startExt = 1'b0;		
			end
			else
			begin
				startInstr = 1'b0; 
				startExt = 1'b0;	
			end				
		end
		
		WREXT:
		begin
			readExt = 1'b0;
			readInstr = 1'b0;
			writeExt = 1'b1;
			writeInstr = 1'b0;
				
			if(chipselect_debug)
			begin
				startInstr = 1'b0; 
				startExt = 1'b1;	
			end
			else
			begin
				startInstr = 1'b0; 
				startExt = 1'b0;	
			end	
				
		end
		
		WRINSTR:
		begin
			readExt = 1'b0;
			readInstr = 1'b0;
			writeExt = 1'b0;
			writeInstr = 1'b1;
			
			if(chipselect_debug)
			begin
				startInstr = 1'b1; 
				startExt = 1'b0;		
			end
			else
			begin
				startInstr = 1'b0; 
				startExt = 1'b0;	
			end
		
			
		end
		
		READPC:
		begin
			readExt = 1'b0;
			readInstr = 1'b0;
			writeExt = 1'b0;
			writeInstr = 1'b0;
				
			startInstr = 1'b0; 
			startExt = 1'b0;	
		end
		
		DONE:
		begin
			readExt = 1'b0;
			readInstr = 1'b0;
			writeExt = 1'b0;
			writeInstr = 1'b0;
				
			startInstr = 1'b0; 
			startExt = 1'b0;	
		end
		
		default: 
		begin
			readExt = read_Ext;
			readInstr = read_Instr;
			writeExt = write_Ext;
			writeInstr = write_Instr;
				
			startInstr = startInputInstr; 
			startExt = startInputExt;
		end
	
	endcase
end

endmodule 