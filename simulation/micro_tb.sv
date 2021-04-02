`timescale 1ns/1ps

module micro_tb();

logic iCLK, iRST_N;

top_verif	tpv(
	.CLK(iCLK), 
	.RST_N(iRST_N)
);
	
	
always
begin
	iCLK = 1'b0;
	#50;
	iCLK =1'b1;
	#50;
end

initial 
begin
	iRST_N = 1'b1;
	#1;
	iRST_N = 1'b0;
	#99;
	iRST_N = 1'b1;
end	

endmodule