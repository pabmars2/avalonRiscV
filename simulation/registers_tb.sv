`timescale 1ns/1ps
module registers_tb ();

bit RegWrite, CLK, RST_N;

reg [4:0] Rreg1, Rreg2, Wreg;
reg [31:0] Wdata;

logic [31:0] Read1, Read2;
logic [31:0] regis [31:0];

registers		A1	  (.CLK(CLK),
							.RST_N(RST_N),
							.Rreg1(Rreg1),
							.Rreg2(Rreg2),
							.Wreg(Wreg),
							.Wdata(Wdata),
							.RegWrite(RegWrite),
							.Read1(Read1),
							.Read2(Read2));

//ESTRUCTURA PRINCIPAL				
initial
	begin
		RESET();
//		ESCRIBIR 100 EN 5
		Wreg = 5;
		Wdata = 100;
		RegWrite = 1'b1;
		#100;
		RegWrite = 1'b0;
//		ESCRIBIR 150 EN 10
		Wreg = 10;
		Wdata = 150;
		RegWrite = 1'b1;
		#100;
		RegWrite = 1'b0;
//		LEER EN 5
		Rreg1 = 5;
//		LEER EN 10
		Rreg2 = 10;
		#100
//		LECTURA/ESCRITURA 200 EN 15
		Wreg = 15;
		Wdata = 200;
		RegWrite = 1'b1;
		Rreg1 = 15;
		#100;
		RegWrite = 1'b0;
		#150;
//		ESCRIBIR FFFFFFFF EN 2
		Wreg = 2;
		Wdata = 32'hFFFFFFFF;
		RegWrite = 1'b1;
		#100;
		RegWrite = 1'b0;
//		LEER EN 2
		Rreg2 = 2;
		#100
		$stop;
	end
	

//TASKS
task RESET;
	begin
		RST_N = 1'b0;
		Rreg1 = 5'b00000;
		Rreg2 = 5'b00000;
		Wreg = 5'b00000;
		Wdata = 0;
		#150;
		RST_N = 1'b1;
	end
endtask


//RELOJ
initial
	forever #50 CLK = !CLK;

endmodule 