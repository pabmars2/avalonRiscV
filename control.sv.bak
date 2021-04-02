module control(IN, Brach, PCRead, MemtoReg, ALUOP, MemWrite, ALUSrc, RegWrite, AddPC, MemRead);

input [6:0] IN;
output reg Brach, PCRead, MemtoReg, MemWrite, ALUSrc, RegWrite, AddPC, MemRead;
output reg [1:0] ALUOP;

always_comb
begin
	case(IN[6:0])
		7'b0000011 : 	//l
			begin
				ALUOP =  2'b10;
				Brach = 1'b0;
				PCRead = 1'b0;//
				MemtoReg = 1'b1;
				MemWrite = 1'b0;
				ALUSrc = 1'b1;
				RegWrite = 1'b1;
				AddPC = 1'b0;//
				MemRead = 1'b1;//
			end
			
		7'b0010011 : 	//i
			begin
				ALUOP =  2'b00;
				Brach = 1'b0;
				PCRead = 1'b0;//
				MemtoReg = 1'b0;
				MemWrite = 1'b0;
				ALUSrc = 1'b1;
				RegWrite = 1'b1;
				AddPC = 1'b0;//
				MemRead = 1'b0;//
			end
		
		7'b0100011 : 	//s
			begin
				ALUOP =  2'b10;
				Brach = 1'b0;
				PCRead = 1'b0;//
				MemtoReg = 1'b0;
				MemWrite = 1'b1;
				ALUSrc = 1'b1;
				RegWrite = 1'b0;
				AddPC = 1'b0;//
				MemRead = 1'b0;//
			end
		
		7'b0110011 : 	//r
			begin
				ALUOP =  2'b00;
				Brach = 1'b0;
				PCRead = 1'b0;//
				MemtoReg = 1'b0;
				MemWrite = 1'b0;
				ALUSrc = 1'b0;
				RegWrite = 1'b1;
				AddPC = 1'b0;//
				MemRead = 1'b0;//
			end
			
		7'b1100011 : 	//b
			begin
				ALUOP =  2'b11;
				Brach = 1'b1;
				PCRead = 1'b0;//
				MemtoReg = 1'b0;
				MemWrite = 1'b0;
				ALUSrc = 1'b0;
				RegWrite = 1'b0;
				AddPC = 1'b0;//
				MemRead = 1'b0;//
			end
			
		7'b1100111 : 	//JALR
			begin
				ALUOP =  2'b10;
				Brach = 1'b0;
				PCRead = 1'b1;//
				MemtoReg = 1'b0;
				MemWrite = 1'b0;
				ALUSrc = 1'b0;
				RegWrite = 1'b1;
				AddPC = 1'b1;//
				MemRead = 1'b0;//
			end
			
		7'b1101111 : //JAL
			begin
				ALUOP =  2'b10;
				Brach = 1'b0;
				PCRead = 1'b1;//
				MemtoReg = 1'b0;
				MemWrite = 1'b0;
				ALUSrc = 1'b1;
				RegWrite = 1'b1;
				AddPC = 1'b1;//
				MemRead = 1'b0;//
			end
			
		7'b0110111 : //LUI
			begin
				ALUOP =  2'b01;
				Brach = 1'b0;
				PCRead = 1'b0;//
				MemtoReg = 1'b0;
				MemWrite = 1'b0;
				ALUSrc = 1'b1;
				RegWrite = 1'b1;
				AddPC = 1'b0;//
				MemRead = 1'b0;//
			end
	
		7'b0010111 : //AUIPC
			begin
				ALUOP =  2'b01;
				Brach = 1'b0;
				PCRead = 1'b1;//
				MemtoReg = 1'b0;
				MemWrite = 1'b0;
				ALUSrc = 1'b1;
				RegWrite = 1'b1;
				AddPC = 1'b1;//
				MemRead = 1'b0;//
			end
			
		default :
			begin
				ALUOP =  2'b00;
				Brach = 1'b0;
				PCRead = 1'b0;
				MemtoReg = 1'b0;
				MemWrite = 1'b0;
				ALUSrc = 1'b0;
				RegWrite = 1'b0;
				AddPC = 1'b0;
				MemRead = 1'b0;
			end
			
	endcase
end
endmodule 