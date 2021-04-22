module UART(CLK, TX, RX, data_rx, done_rx, data_tx, flag_tx, controlBits, done_tx);

//baudRate = 115200;
//clkSpeed = 50000000;
//c_CLKS_PER_BIT = clkSpeed/baudRate = 434;

parameter c_CLKS_PER_BIT = 434;

input CLK;
input RX;
input flag_tx;
input [31 : 0] data_tx;

output [31 : 0] data_rx; 
output [1 : 0] controlBits;
output done_rx, done_tx;
output TX;

reg [33 : 0] data_recieved;

assign data_rx = data_recieved[31:0];
assign controlBits = data_recieved[33:32]; 

  uart_rx #(.CLKS_PER_BIT(c_CLKS_PER_BIT)) UART_RX_INST
    (.i_Clock(CLK),
     .i_Rx_Serial(RX),
     .o_Rx_DV(done_rx),		//DONE
     .o_Rx_Byte(data_recieved)
     );
   
  uart_tx #(.CLKS_PER_BIT(c_CLKS_PER_BIT)) UART_TX_INST
    (.i_Clock(CLK),
     .i_Tx_DV(flag_tx),
     .i_Tx_Byte(data_tx),
     .o_Tx_Active(),
     .o_Tx_Serial(TX),
     .o_Tx_Done(done_tx)
     );
  
	  
endmodule 