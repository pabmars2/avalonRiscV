module avalon_displays7seg(//Avalon MM interface signals
                            input reset,
                            input clock,
                            input chipselect,
                            input [2:0]  address,
                            input write,
                            input [31:0] writedata,
                            input read, 
                            output [31:0] readdata,
                    //Conduit - Interface con 7 segmentos - salida externa.
                            output [6:0] HEX0,
                            output [6:0] HEX1,
                            output [6:0] HEX2,
                            output [6:0] HEX3,
                            output [6:0] HEX4,
                            output [6:0] HEX5,
                            output [6:0] HEX6,
                            output [6:0] HEX7);
                                    
                                    
parameter invert=0;
                                    
wire [31:0] reg1, reg0;                                 
                                    

// Instancia del interface con el bus Avalon MM

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
                                         // Registros 0 y 1 de lectura 
                                        .reg0(reg0), 
                                        .reg1(reg1), 
                                         //Datos para el registro interno reg3
                                        .data(32'h87654321), 
                                        .we(1'b1)); // Write enabl. de reg3
                                                  
                                                  
                                                  
hex7seg #(.invert(invert)) dec0 (.inhex(reg0[3:0]),   .out7seg(HEX0));
hex7seg #(.invert(invert)) dec1 (.inhex(reg0[7:4]),   .out7seg(HEX1));
hex7seg #(.invert(invert)) dec2 (.inhex(reg0[11:8]),  .out7seg(HEX2));
hex7seg #(.invert(invert)) dec3 (.inhex(reg0[15:12]), .out7seg(HEX3));

hex7seg #(.invert(invert)) dec4 (.inhex(reg1[3:0]),   .out7seg(HEX4));
hex7seg #(.invert(invert)) dec5 (.inhex(reg1[7:4]),   .out7seg(HEX5));
hex7seg #(.invert(invert)) dec6 (.inhex(reg1[11:8]),  .out7seg(HEX6));
hex7seg #(.invert(invert)) dec7 (.inhex(reg1[15:12]), .out7seg(HEX7));

endmodule
