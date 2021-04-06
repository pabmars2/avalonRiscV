module ALU(Op, Zero, sol, Op1, Op2);

input [3:0] Op;
input [31:0] Op1, Op2;

output Zero;
output [31:0] sol;

reg [31:0] res;

assign Zero = (res == 0) ? 1'b1 : 1'b0;
assign sol = res;

always_comb
begin
	case(Op)
		4'b0000 : res = Op1 + Op2;	//	add/addi
		4'b1000 : res = Op1 - Op2; //	sub
		4'b0001 : res = Op1 << Op2; // sll/slli	
		4'b0010 : res = (Op1 < Op2) ? 1 : 0; // slt/slti
		4'b0011 : res = (Op1 < Op2) ? 1 : 0; //sltu
		4'b0100 : res = Op1 ^ Op2;	// xor/xori
		4'b0101 : res = Op1 >> Op2; // srl/srli
		4'b1101 : res = Op1 >> Op2; //sra/srai	
		4'b0110 : res = Op1 | Op2;	// or/ori		
		4'b0111 : res = Op1 & Op2; // and/andi
		4'b1001 : res = (Op1 == Op2) ? 1 : 0; //bne
		4'b1010 : res = (Op1 >= Op2) ? 0 : 1; // bge/bgeu
		4'b1111 : res = Op2; //lui
		default : res = 0;
	endcase
end
endmodule 