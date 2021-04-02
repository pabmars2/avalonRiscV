// Testbench simple de la memoria RAM con lectura asíncrona y escritura síncrona

`timescale 1ns/1ps

module tb_memoriaRAM;

	//a_width = 1024
	//d_width = 32
	
	logic       clk;
	logic	[9:0] address;
	logic       write_enable;
	logic	[31:0] data_in;
	logic	[31:0] data_out;
	

	memoriaRAM #(.ADDRESS_SIZE(1024)) ram (
		.CLK(clk),
		.ADDRESS(address),
		.MEM_WRITE(write_enable),
		.WRITE_DATA(data_in),
		.READ_DATA(data_out));
		
		always
		begin
			clk = 1'b0;
			#50;
			clk =  1'b1;
			#50;
		end
  
	
	initial begin
		
		clk = 1'b0;
		write_enable = 1'b0;
		
		$display("Escribo unos valores");
		escritura(10'h0,5'h18c);
		assert (data_in == 5'h18c) else $error("valor no escrito en la RAM");
		escritura(10'h16a,5'hfff);
		assert (data_in == 5'hfff) else $error("valor no escrito en la RAM");
		escritura(10'h4b,5'h643);
		assert (data_in == 5'h643) else $error("valor no escrito en la RAM");
    
		$display("Leo unos valores");
		#30
		lectura(10'h16a);
		#10
		assert (data_out == 5'hfff) else $error("Incorrectamente leído");
		#30
		lectura(10'h4b);
		#10
		assert (data_out == 5'h643) else $error("Incorrectamente leído");
		#30
		lectura(10'h0);
		#10
		assert (data_out == 5'h18c) else $error("Incorrectamente leído");
		
		@(posedge clk)
		@(posedge clk)
		$stop;
	end

	task escritura(input[9:0] direccion, input[31:0] valor);
		begin
			write_enable<=1'b0;
			@(posedge clk)
			write_enable<=1'b1;
			
			address<=direccion;
			data_in<=valor;
			@(posedge clk)
			@(negedge clk)
			write_enable<=1'b0;
		end
	endtask
	
	task lectura(input[9:0] direccion);
		begin
			address<=direccion;
		end
	endtask


endmodule
