module adder(Op1, Op2, Sol);


input [31 : 0] Op1, Op2;
output logic [31 : 0] Sol;

always_comb
begin
	Sol = Op1 + Op2;
end
endmodule 