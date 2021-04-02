module tb_control();

logic [1:0] ALUOPo;
logic Bracho, PCReado, MemtoRego, MemWriteo, ALUSrco, RegWriteo;
logic [6:0] INo;

control DUV(
	.IN(INo), 
	.Brach(Bracho), 
	.PCRead(PCReado), 
	.MemtoReg(MemtoRego), 
	.ALUOP(ALUOPo), 
	.MemWrite(MemWriteo), 
	.ALUSrc(ALUSrco), 
	.RegWrite(RegWriteo));

	
	
initial
begin
	
INo = 0;

#10

INo = 7'b 0000011;

#10

$stop;
end	
endmodule 