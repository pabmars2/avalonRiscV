module regID_EX(CLK, RST_n, clr, Enable, Add1, oAdd1, AddPC, oAddPC, Rs1, Rs2, ImmGen, PC, instr4b, instr5b, rd1, rd2, Brach, PCRead, MemtoReg, ALUOP, MemWrite, ALUSrc, RegWrite, oImmGen, oPC, oinstr4b, oinstr5b, ord1, ord2, oBrach, oPCRead, oMemtoReg, oALUOP, oMemWrite, oALUSrc, oRegWrite, oRs1, oRs2, MemRead, oMemRead);

input CLK, RST_n, clr, Enable;
input [31:0] PC, rd1, rd2, ImmGen, Add1;
input Brach, PCRead, MemtoReg, MemWrite, ALUSrc, RegWrite, AddPC, MemRead;
input [1:0] ALUOP;
input [3:0] instr4b;
input [4:0] instr5b;
input [4:0] Rs1, Rs2;

output  [31:0] oPC, ord1, ord2, oImmGen, oAdd1;
output  oBrach, oPCRead, oMemtoReg, oMemWrite, oALUSrc, oRegWrite, oAddPC, oMemRead;
output  [1:0] oALUOP;
output  [3:0] oinstr4b;
output  [4:0] oinstr5b;
output  [4:0] oRs1, oRs2;


reg [31:0] aPC, ard1, ard2, aImmGen, aAdd1;
reg aBrach, aPCRead, aMemtoReg, aMemWrite, aALUSrc, aRegWrite, aAddPC, aMemRead;
reg [1:0] aALUOP;
reg [3:0] ainstr4b;
reg [4:0] ainstr5b;
reg [4:0] aRs1, aRs2;

assign oPC = aPC; 
assign ord1 = ard1; 
assign ord2 = ard2; 
assign oImmGen = aImmGen; 
assign oBrach = aBrach;
assign oPCRead = aPCRead; 
assign oMemWrite = aMemWrite; 
assign oALUSrc = aALUSrc; 
assign oRegWrite = aRegWrite;
assign oALUOP = aALUOP; 
assign oinstr4b = ainstr4b; 
assign oinstr5b = ainstr5b; 
assign oMemtoReg = aMemtoReg;
assign oAdd1 = aAdd1;
assign oAddPC = aAddPC;
assign oRs1 = aRs1;
assign oRs2 = aRs2;
assign oMemRead = aMemRead;

always_ff @(posedge CLK, negedge RST_n)
begin
	if(!RST_n)
		begin
			aPC <= 0; 
			ard1 <= 0; 
			ard2 <= 0; 
			aImmGen <= 0; 
			aBrach <= 0; 
			aPCRead <= 0; 
			aMemtoReg <= 0; 
			aALUSrc <= 0; 
			aRegWrite <= 0; 
			aALUOP <= 0; 
			ainstr4b <= 0; 
			ainstr5b <= 0;
			aAdd1 <= 0;
			aAddPC <= 0;
			aRs1 <= 0; 
			aRs2 <= 0;
			aMemRead <= 0;
		end
	else	if(clr)
		begin
			aPC <= 0; 
			ard1 <= 0; 
			ard2 <= 0; 
			aImmGen <= 0; 
			aBrach <= 0; 
			aPCRead <= 0; 
			aMemtoReg <= 0; 
			aALUSrc <= 0; 
			aRegWrite <= 0; 
			aALUOP <= 0; 
			ainstr4b <= 0; 
			ainstr5b <= 0; 
			aAdd1 <= 0;
			aAddPC <= 0;
			aRs1 <= 0; 
			aRs2 <= 0;
			aMemRead <= 0;
		end
	else if(Enable)
		begin
			aPC <= PC; 
			ard1 <= rd1; 
			ard2 <= rd2; 
			aImmGen <= ImmGen; 
			aBrach <= Brach; 
			aPCRead <= PCRead; 
			aMemtoReg <= MemtoReg;
			aMemWrite <= MemWrite; 
			aALUSrc <= ALUSrc; 
			aRegWrite <= RegWrite; 
			aALUOP <= ALUOP; 
			ainstr4b <= instr4b; 
			ainstr5b <= instr5b;
			aAdd1 <= Add1;
			aAddPC <= AddPC;
			aRs1 <= Rs1; 
			aRs2 <= Rs2;
			aMemRead <= MemRead;
		end		
end
endmodule 