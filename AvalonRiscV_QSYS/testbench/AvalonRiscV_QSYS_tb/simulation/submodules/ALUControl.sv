module ALUControl(ALUOP, IN, OUT);

input [1 : 0] ALUOP;
input [3 : 0] IN;
output reg [3 : 0] OUT;

always_comb
begin
	case(ALUOP)
		2'b00 : OUT = IN;
		2'b01 : OUT = 4'b1111; //auixiliar auipc y lui
		2'b10 : OUT = 4'b0000;
		2'b11 : 
			begin
				case(IN[2:0])
					3'b010 : OUT = 4'b0010; //blt
					3'b110 : OUT = 4'b0011; //bltu
					3'b000 : OUT = 4'b1000; //beq
					3'b001 : OUT = 4'b1001; //bne
					3'b101 : OUT = 4'b1010; //bge
					3'b111 : OUT = 4'b1010; //bgeu
					default :OUT = 0;
				endcase
			end
		default : OUT = 0;			
	endcase
end
endmodule 