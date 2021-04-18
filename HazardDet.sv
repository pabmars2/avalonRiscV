module HazardDet(EnPC, Instr, ctrMux, RegD, M, N, O, P, en, clr);

input [31:0] Instr;
input [4:0] RegD;
input M, N, O, P;	// ID/EX.MemRead

output [3:0] clr;
output ctrMux, EnPC, en;

assign clr = ((M && ((RegD == Instr[19:15]) || (RegD == Instr[24:20]))) || N) ? 4'b1000 : 4'b0000;

assign en = ((M && ((RegD == Instr[19:15]) || (RegD == Instr[24:20]))) || N || O || P) ? 1'b0 : 1'b1;
assign EnPC = ((M && ((RegD == Instr[19:15]) || (RegD == Instr[24:20]))) || N || O) ? 1'b0 : 1'b1;
assign ctrMux = ((M && ((RegD == Instr[19:15]) || (RegD == Instr[24:20]))) || N || O || P) ? ((N == 1'b1) ? 1'b0 : 1'b1) : 1'b0;

endmodule 