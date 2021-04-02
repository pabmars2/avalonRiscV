module registers(CLK, RST_N, Rreg1, Rreg2, Wreg, Wdata, RegWrite, Read1, Read2);

input [4:0] Rreg1, Rreg2, Wreg;
input [31:0] Wdata;
input RegWrite, CLK, RST_N;

output [31:0] Read1, Read2;

reg [31:0] regis [31:0];


assign Read1 = regis[Rreg1][31:0];
assign Read2 = regis[Rreg2][31:0];

always_ff @(posedge CLK, negedge RST_N)
begin
	if(!RST_N)
		begin
			integer i;
			for (i=0;i<32;i=i+1)
				regis[i][31:0] = 0;
		end
	else
		if(RegWrite)
			if(Wreg != 0) //protegemos el regsitro 0
				regis[Wreg][31:0] = Wdata;			
end
endmodule 