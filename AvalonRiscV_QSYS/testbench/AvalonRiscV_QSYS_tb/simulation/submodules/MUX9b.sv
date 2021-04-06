module MUX9b(in1, in2, ctr, out);

input [9 : 0] in1, in2;
input ctr;
output [9 : 0] out;

assign out = (ctr == 1) ? in2 : in1;

endmodule 