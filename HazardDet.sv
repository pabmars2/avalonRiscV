module HazardDet(CLK, RST_N, enable, EnPC, Instr, ctrMux, RegD, M, N, O, P, en, clr);

input CLK, RST_N;
input enable;
input [31:0] Instr;
input [4:0] RegD;
input M, N, O, P;	// ID/EX.MemRead

output reg [3:0] clr;
output reg ctrMux, EnPC, en;

always_ff @(posedge CLK or negedge RST_N)
begin
	if(!RST_N)
	begin
			clr <= 4'b0000;
			en <= 1'b1;
			EnPC <= 1'b1;
			ctrMux <= 1'b0;
		end
	else
	begin
		if(enable == 1'b1)
		begin
			clr <= ((M && ((RegD == Instr[19:15]) || (RegD == Instr[24:20]))) || N) ? 4'b1000 : 4'b0000;
			en <= ((M && ((RegD == Instr[19:15]) || (RegD == Instr[24:20]))) || N || O || P) ? 1'b0 : 1'b1;
			EnPC <= ((M && ((RegD == Instr[19:15]) || (RegD == Instr[24:20]))) || N || O) ? 1'b0 : 1'b1;
			ctrMux <= ((M && ((RegD == Instr[19:15]) || (RegD == Instr[24:20]))) || N || O || P) ? ((N == 1'b1) ? 1'b0 : 1'b1) : 1'b0;
		end
		else
		begin
			clr <= 4'b0000;
			en <= 1'b1;
			EnPC <= 1'b1;
			ctrMux <= 1'b0;
		end
	end
end
/*
assign clr = ((M && ((RegD == Instr[19:15]) || (RegD == Instr[24:20]))) || N) ? 4'b1000 : 4'b0000;

assign en = ((M && ((RegD == Instr[19:15]) || (RegD == Instr[24:20]))) || N || O || P) ? 1'b0 : 1'b1;
assign EnPC = ((M && ((RegD == Instr[19:15]) || (RegD == Instr[24:20]))) || N || O) ? 1'b0 : 1'b1;
assign ctrMux = ((M && ((RegD == Instr[19:15]) || (RegD == Instr[24:20]))) || N || O || P) ? ((N == 1'b1) ? 1'b0 : 1'b1) : 1'b0;
*/
endmodule 