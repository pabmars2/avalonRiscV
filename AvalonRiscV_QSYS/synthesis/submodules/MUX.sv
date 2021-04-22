module MUX(in1, in2, ctr, out);

input [31 : 0] in1, in2;
input ctr;
output [31 : 0] out;

assign out = (ctr == 1) ? in2 : in1;

endmodule 