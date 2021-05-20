module regEX_MEM(CLK, RST_n, clr, Enable, AddPC, oAddPC, RegWrite, MemtoReg, Brach, MemWrite, MemRead, AddSum, Zero, AluRes, Reg2, instr5b, oRegWrite, oMemtoReg, oMemRead, oBrach, oMemWrite, oAddSum, oZero, oAluRes, oReg2, oinstr5b);

input CLK, RST_n, clr, Enable;
input RegWrite, MemtoReg, Brach, MemWrite, MemRead, Zero, AddPC;
input [4:0] instr5b;
input [31:0] AddSum, AluRes, Reg2;

output oRegWrite, oMemtoReg, oBrach, oMemWrite, oMemRead, oZero, oAddPC;
output [4:0] oinstr5b;
output [31:0] oAddSum, oAluRes, oReg2;

reg aRegWrite, aMemtoReg, aBrach, aMemWrite, aMemRead, aZero, aAddPC;
reg [4:0] ainstr5b;
reg [31:0] aAddSum, aAluRes, aReg2;

assign oRegWrite = aRegWrite;
assign oMemtoReg = aMemtoReg;
assign oBrach = aBrach;
assign oMemWrite = aMemWrite;
assign oMemRead = aMemRead;
assign oZero = aZero;
assign oinstr5b = ainstr5b;
assign oAddSum = aAddSum;
assign oAluRes = aAluRes;
assign oReg2 = aReg2;
assign oAddPC = aAddPC;

always_ff @(posedge CLK, negedge RST_n)
begin
	if(!RST_n)
		begin 
			aRegWrite <= 0;
			aMemtoReg <= 0;
			aBrach <= 0;
			aMemWrite <= 0;
			aMemRead = 0;
			aZero <= 0;
			ainstr5b <= 0;
			aAddSum <= 0;
			aAluRes <= 0;
			aReg2 <= 0;
			aAddPC <= 0;
		end
	else if(clr)
		begin 
			aRegWrite <= 0;
			aMemtoReg <= 0;
			aBrach <= 0;
			aMemWrite <= 0;
			aMemRead <= 0;
			aZero <= 0;
			ainstr5b <= 0;
			aAddSum <= 0;
			aAluRes <= 0;
			aReg2 <= 0;
			aAddPC <= 0;
		end
	else if(Enable)	
		begin 
				aRegWrite <= RegWrite;
				aMemtoReg <= MemtoReg;
				aBrach <= Brach;
				aMemWrite <= MemWrite;
				aMemRead <= MemRead;
				aZero <= Zero;
				ainstr5b <= instr5b;
				aAddSum <= AddSum;
				aAluRes <= AluRes;
				aReg2 <= Reg2;
				aAddPC <= AddPC;
		end
end
endmodule  