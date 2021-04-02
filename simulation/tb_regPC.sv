// Testbench simple del Program Counter

`timescale 1us/1ns

module tb_regPC;
	
	logic	clk;
	logic	rst_n;
	logic	[31:0] addr_in;
	logic	[31:0] addr_out;
	

	regPC  pc (
		.CLK(clk),
		.RST_n(rst_n),
		.IN(addr_in),
		.OUT(addr_out));
		
		always
		begin
			clk = 1'b0;
			#10;
			clk =  1'b1;
			#10;
		end
  
	
	initial begin
		
		clk = 1'b0;
		rst_n = 1'b0;
		#20; 
		rst_n = 1'b1;
		
		$display("Introduzco la direccion de la primera instruccion");
		addr_in = 10'h16a;
		@(posedge clk);
		#5;
		assert (addr_out == 10'h16a) else $error("fallo del PC");
		
		$display("Reseteo en mitad de una instruccion");
		addr_in = 10'h10f;
		#10;
		rst_n = 1'b0;
		@(posedge clk);
		#5;
		assert (addr_out == 10'h0) else $error("fallo del PC");
		$stop;
		
	end
endmodule
