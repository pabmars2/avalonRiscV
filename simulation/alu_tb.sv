`timescale 1ns/1ps

module alu_tb();

logic [3:0] Op;
logic Zero;
logic signed [31:0] res, Op1, Op2;


//Instanciar el modulo
ALU a1 (
	.Op(Op),
	.Zero(Zero),
	.sol(res),
	.Op1(Op1),
	.Op2(Op2)
);

initial 
	begin

	Op  = 4'b0000; //Sumar
	Op1 = 70;
	Op2 = 50;
	#1
	Op  = 4'b0001; //Restar
	Op1 = 50;
	Op2 = 100;
	#1
	Op  = 4'b0010; //
	Op1 = 70;
	Op2 = 71;
	#1
	Op  = 4'b0011; //Puerta And
	Op1 = 1;
	Op2 = 0;
	#1
	Op  = 4'b0100; //Puerta Or
	Op1 = 0;
	Op2 = 1;
	#1
	Op  = 4'b0101; //Puerta Xor
	Op1 = 1;
	Op2 = 0;
	#1
	Op  = 4'b0110; //Desplazamiento izquierda(Palabra)
	Op1 = 50;
	Op2 = 200;
	#1
	Op  = 4'b0111; //Desplazamiento derecha(Palabra)
	Op1 = 200;
	Op2 = 50;
	#1
	Op  = 4'b1000; //Op1 igual o mayor que Op2
	Op1 = 80;
	Op2 = 70;
	#1
	$stop;
	end
	
endmodule 