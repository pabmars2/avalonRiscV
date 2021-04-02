module ImmGen_tb();

logic signed [31:0] IN, OUT;

ImmGen DUV(
	.IN(IN), 
	.OUT(OUT));

initial
begin
	#10
	IN = 32'hA4000000;
	#10
	IN = 0;
end
endmodule 