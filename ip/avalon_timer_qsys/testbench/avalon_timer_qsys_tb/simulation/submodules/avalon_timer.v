module avalon_timer(//Avalon MM interface signals
                            input reset,
                            input clock,
                            input chipselect,
                            input [2:0]  address,
                            input write,
                            input [31:0] writedata,
                            input read, 
                            output [31:0] readdata,
                    //Conduit - Interface con 7 segmentos - salida externa.
									 output irq,
									 output out_th);

wire [31:0] count, fin_cuenta, bits_control, threshold;
									 
avalon_slave_MM_interface u1_av_sl_MM (//Avalon MM interface signals
                                        .reset(reset),
                                        .clock(clock),
                                        .chipselect(chipselect),
                                        .address(address), 
                                        .write(write),
                                        .writedata(writedata),
                                        .read(read),                                          
                                        .readdata(readdata),
                                       //Interface con nuestra logica.
                                         // Registros 0, 1 y 2 de lectura 
                                        .reg0(fin_cuenta),  
													 .reg1(threshold),
													 .reg2(bits_control),  
                                         //Datos para el registro interno reg3
                                        .data(count), 
                                        .we(1'b1)); // Write enabl. de reg3									 
									 
									 
timer	timer(
	.clk(clock), 
	.rst_n(~reset), 
	.enable(bits_control[0]), 
	.borra_irq(bits_control[1]), 
	.irq(irq), 
	.count(count), 
	.threshold(threshold), 
	.fin_cuenta(fin_cuenta), 
	.out_th(out_th));								 
																	 
																	 
endmodule 