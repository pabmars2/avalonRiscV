module regMEM_WB(CLK, RST_n, clr, Enable, Data, Address, instr5b, MemtoReg, RegWrite, oData, oAddress, oinstr5b, oMemtoReg, oRegWrite);

input CLK, RST_n, clr, Enable;
input [31:0] Data, Address;
input [4:0] instr5b;
input MemtoReg, RegWrite;

output [31:0] oData, oAddress;
output [4:0] 	oinstr5b;
output oMemtoReg, oRegWrite;

reg [31:0] aData, aAddress;
reg [4:0] 	ainstr5b;
reg aMemtoReg, aRegWrite;

assign oData = aData;
assign oAddress = aAddress;
assign oinstr5b = ainstr5b;
assign oMemtoReg = aMemtoReg;
assign oRegWrite = aRegWrite;

always_ff @(posedge CLK, negedge RST_n)
begin
	if(!RST_n)
		begin
			aData <= 0;
			aAddress <= 0;
			ainstr5b <= 0;
			aMemtoReg <= 0; 
			aRegWrite <= 0;
		end
	else if(clr)
		begin
			aData <= 0;
			aAddress <= 0;
			ainstr5b <= 0;
			aMemtoReg <= 0; 
			aRegWrite <= 0;
		end
	else if(Enable)
		begin
			aData <= Data;
			aAddress <= Address;
			ainstr5b <= instr5b;
			aMemtoReg <= MemtoReg; 
			aRegWrite <= RegWrite;
		end		
end
endmodule 