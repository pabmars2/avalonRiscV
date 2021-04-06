// AvalonUARTQsys_tb.v

// Generated using ACDS version 17.1 590

`timescale 1 ps / 1 ps
module AvalonUARTQsys_tb (
	);

	parameter c_CLOCK_PERIOD_NS = 20;
	parameter c_CLKS_PER_BIT    = 434;
	parameter c_BIT_PERIOD      = 8600;

	wire        r_Clock;                                // AvalonUARTQsys_inst_clk_bfm:clk -> [AvalonUARTQsys_inst:clk_clk, AvalonUARTQsys_inst_avalon_timer_0_external_interface_bfm:clk, AvalonUARTQsys_inst_avalonmasteruart_0_control_bfm:clk, AvalonUARTQsys_inst_avalonmasteruart_0_rs232_bfm:clk, AvalonUARTQsys_inst_reset_bfm:clk]
	wire        avalonuartqsys_inst_avalon_timer_0_external_interface_conduit;      // AvalonUARTQsys_inst:avalon_timer_0_external_interface_conduit -> AvalonUARTQsys_inst_avalon_timer_0_external_interface_bfm:sig_conduit
	wire  [0:0] w_Tx_Done; // AvalonUARTQsys_inst_avalonmasteruart_0_control_bfm:sig_flag_tx -> AvalonUARTQsys_inst:avalonmasteruart_0_control_flag_tx
	wire        TX;                    // AvalonUARTQsys_inst:avalonmasteruart_0_rs232_tx -> AvalonUARTQsys_inst_avalonmasteruart_0_rs232_bfm:sig_tx
	//wire  [0:0] avalonuartqsys_inst_avalonmasteruart_0_rs232_bfm_conduit_rx;        // AvalonUARTQsys_inst_avalonmasteruart_0_rs232_bfm:sig_rx -> AvalonUARTQsys_inst:avalonmasteruart_0_rs232_rx
	wire        avalonuartqsys_inst_reset_bfm_reset_reset;                          // AvalonUARTQsys_inst_reset_bfm:reset -> [AvalonUARTQsys_inst:reset_reset_n, AvalonUARTQsys_inst_avalon_timer_0_external_interface_bfm:reset, AvalonUARTQsys_inst_avalonmasteruart_0_control_bfm:reset, AvalonUARTQsys_inst_avalonmasteruart_0_rs232_bfm:reset]
	
	reg r_Tx_DV = 0;
	reg [31:0] r_Tx_Byte = 0;
	reg r_Rx_Serial = 1;
	wire [33:0] w_Rx_Byte;	
	
	AvalonUARTQsys avalonuartqsys_inst (
		.avalon_timer_0_external_interface_conduit (avalonuartqsys_inst_avalon_timer_0_external_interface_conduit),      // avalon_timer_0_external_interface.conduit
		.avalonmasteruart_0_control_flag_tx        (r_Tx_DV), //        avalonmasteruart_0_control.flag_tx
		.avalonmasteruart_0_rs232_rx               (r_Rx_Serial),        //          avalonmasteruart_0_rs232.rx
		.avalonmasteruart_0_rs232_tx               (TX),                    //                                  .tx
		.clk_clk                                   (r_Clock),                                //                               clk.clk
		.reset_reset_n                             (avalonuartqsys_inst_reset_bfm_reset_reset)                           //                             reset.reset_n
	);

	/*altera_conduit_bfm avalonuartqsys_inst_avalon_timer_0_external_interface_bfm (
		.clk         (avalonuartqsys_inst_clk_bfm_clk_clk),                           //     clk.clk
		.reset       (~avalonuartqsys_inst_reset_bfm_reset_reset),                    //   reset.reset
		.sig_conduit (avalonuartqsys_inst_avalon_timer_0_external_interface_conduit)  // conduit.conduit
	);

	altera_conduit_bfm_0002 avalonuartqsys_inst_avalonmasteruart_0_control_bfm (
		.clk         (avalonuartqsys_inst_clk_bfm_clk_clk),                                //     clk.clk
		.reset       (~avalonuartqsys_inst_reset_bfm_reset_reset),                         //   reset.reset
		.sig_flag_tx (avalonuartqsys_inst_avalonmasteruart_0_control_bfm_conduit_flag_tx)  // conduit.flag_tx
	);

	altera_conduit_bfm_0003 avalonuartqsys_inst_avalonmasteruart_0_rs232_bfm (
		.clk    (avalonuartqsys_inst_clk_bfm_clk_clk),                         //     clk.clk
		.reset  (~avalonuartqsys_inst_reset_bfm_reset_reset),                  //   reset.reset
		.sig_rx (avalonuartqsys_inst_avalonmasteruart_0_rs232_bfm_conduit_rx), // conduit.rx
		.sig_tx (avalonuartqsys_inst_avalonmasteruart_0_rs232_tx)              //        .tx
	);*/

	altera_avalon_clock_source #(
		.CLOCK_RATE (50000000),
		.CLOCK_UNIT (1)
	) avalonuartqsys_inst_clk_bfm (
		.clk (r_Clock)  // clk.clk
	);

	altera_avalon_reset_source #(
		.ASSERT_HIGH_RESET    (0),
		.INITIAL_RESET_CYCLES (50)
	) avalonuartqsys_inst_reset_bfm (
		.reset (avalonuartqsys_inst_reset_bfm_reset_reset), // reset.reset_n
		.clk   (r_Clock)        //   clk.clk
	);
	
	// Takes in input byte and serializes it 
  task UART_WRITE_BYTE;
    input [33:0] i_Data;
    integer     ii;
    begin
       
      // Send Start Bit
      r_Rx_Serial <= 1'b0;
      #(c_BIT_PERIOD);
      //#1000;
      repeat(c_CLKS_PER_BIT) @(posedge r_Clock);
       
      // Send Data Byte
      for (ii=0; ii<34; ii=ii+1)
        begin
          r_Rx_Serial <= i_Data[ii];
		  #(c_BIT_PERIOD);
		  repeat(c_CLKS_PER_BIT) @(posedge r_Clock);
          
        end
       
      // Send Stop Bit
      r_Rx_Serial <= 1'b1;
      #(c_BIT_PERIOD);
	  repeat(c_CLKS_PER_BIT) @(posedge r_Clock);
     end
  endtask // UART_WRITE_BYTE
   
   
  // Main Testing:
  initial
    begin
       wait(avalonuartqsys_inst_reset_bfm_reset_reset)
      // Tell UART to send a command (exercise Tx)
      @(posedge r_Clock);
      @(posedge r_Clock);
      /*r_Tx_DV <= 1'b1;
	   @(posedge r_Clock);
      r_Tx_Byte <= 32'b00001101101101001111001001010101;
      @(posedge r_Clock);*/
      r_Tx_DV <= 1'b0;
      //@(posedge w_Tx_Done);
       
      // Send a command to the UART (exercise Rx)
      @(posedge r_Clock);
      UART_WRITE_BYTE(34'b0010010110100101001110100101100010);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(34'b0100010110100101001110100101100000);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(34'b1000000000000000000000000000000001);
      @(posedge r_Clock);
	  
	  repeat(c_CLKS_PER_BIT) @(posedge r_Clock);
	  r_Tx_DV <= 1'b1;
	  @(posedge r_Clock)
	  r_Tx_DV <= 1'b0;
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(34'b1000000000000000000000000000000000);
      @(posedge r_Clock);
	  
      repeat(40*c_CLKS_PER_BIT) @(posedge r_Clock);       
      // Check that the correct command was received
	$stop;
    end
	
	
endmodule
