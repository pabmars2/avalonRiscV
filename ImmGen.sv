module ImmGen (IN, OUT);

input [31 : 0] IN;
output [31 : 0] OUT;

logic [31:0] OUT_a;

assign OUT = OUT_a;

always_comb
begin
	case(IN[6:2])
		5'b00100 : OUT_a = {{20{IN[31]}},IN[31:20]}; //i
		5'b01000 : OUT_a = {{20{IN[31]}},IN[31:25],IN[11:7]}; //s
		5'b11000 : OUT_a = {{20{IN[31]}},IN[7],IN[30:25],IN[11:8],1'b0}; //b
		5'b01101 : OUT_a = {IN[31:12],12'b0}; //lui
		5'b00101 : OUT_a = {{12{IN[31]}},IN[31:12]}; //auipc
		5'b11011 : OUT_a = {{12{IN[31]}},IN[19:12],IN[20],IN[30:21],1'b0}; //jal		
		5'b11001 : OUT_a = {{19{IN[31]}},IN[31:20],1'b0}; //jalr	
		default : OUT_a = 0;
	endcase
end
endmodule 