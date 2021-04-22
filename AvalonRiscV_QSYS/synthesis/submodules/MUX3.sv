module MUX3(in1, in2, in3, ctr, out);

input [31:0] in1, in2, in3;
input [1:0] ctr;

output [31:0] out;

reg [31:0] aout;

assign out = aout;

always_comb
begin
	case(ctr)
		2'b00 : aout = in1;
		2'b01 : aout = in2;
		2'b10 : aout = in3;
		default : aout = 0;
	endcase
end
endmodule 