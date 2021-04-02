// Testbench simple del Multiplexor

`timescale 1us/1ns

module tb_MUX;
	
	logic	[31:0] IN1;
	logic	[31:0] IN2;
	logic	CTR;
	logic	[31:0] OUT;
	
	

	MUX  mux (
		.in1(IN1),
		.in2(IN2),
		.ctr(CTR),
		.out(OUT));
		
  
	
	initial begin
		#2;
		
		$display("Multiplexo una direccion por la primera salida");
		IN1 = 10'h16a;
		IN2 = 10'h10f;
		CTR = 1'b0;
		#2;
		assert (OUT == 10'h16a) else $error("fallo del MUX");
		
		#5;
		
		$display("Multiplexo una direccion por la segunda salida");
		CTR = 1'b1;
		#2;
		assert (OUT == 10'h10f) else $error("fallo del MUX");
		
		#5;
		$stop;
	end
endmodule
