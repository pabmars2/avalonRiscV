`timescale 100 ns / 1 ps
module ROM_tb;

	logic        clk;
	logic  [9:0] instruction_address;
  	logic [31:0] instruction;
	
	reg [31:0] ROMfake [1023 : 0];

//INSTANCIACION DUV
memoriaROM ROMduv
(
	.INSTRUCTION_ADDRESS(instruction_address) ,	
	.INSTRUCTION(instruction) 
);

defparam ROMduv.POSICIONES = 1024;


initial begin 

	$readmemh("rom.txt", ROMfake); //Cambiar por la ruta deseada //C:\\Users\\Pablo\\Desktop\\Micro_restored\\rom.txt

	//pruebo con una direccion
	clk = 0;
	instruction_address = 10'h00;
	
	$display("Leo en la direccion.");
	clk_read;
	$display("Instruccion[%0h] : %0h", instruction_address, instruction);
	assert (instruction == ROMfake[instruction_address]) else $error("Incorrectamente leido");	

	clk_read;
	
	//pruebo con otra direccion
	instruction_address = 10'h3;
	
	$display("Leo una nueva direccion.");
	clk_read;
	$display("Instruccion[%0h] : %0h", instruction_address, instruction);
	assert (instruction == ROMfake[instruction_address]) else $error("Incorrectamente leido");	
	end
	
  //definicion clk
  task clk_read;
    begin
      #10 clk = ~clk;
      #10 clk = ~clk;
    end
  endtask
  
 endmodule

	
	

