module top_verif(CLK, RST_N);

parameter N = 1024;
localparam n = $clog2(N);

input CLK, RST_N;

wire [31 : 0] idata, ddata_w, ddata_r;
wire [n-1 : 0] daddr, iaddr;
wire WRam;


memoriaRAM #(.ADDRESS_SIZE(N))	RAM(
	.CLK(CLK), 
	.ADDRESS(daddr), 
	.MEM_WRITE(WRam), 
	.WRITE_DATA(ddata_w), 
	.READ_DATA(ddata_r));
	
memoriaROM	#(.POSICIONES(N)) ROM(
	.INSTRUCTION_ADDRESS(iaddr), 
	.INSTRUCTION(idata));
	
top #(.N(N))	top(
	.CLK(CLK), 
	.RST_N(RST_N), 
	.idata(idata), 
	.ddata_r(ddata_r), 
	.iaddr(iaddr), 
	.daddr(daddr), 
	.ddata_w(ddata_w), 
	.WRam(WRam)); 

endmodule 