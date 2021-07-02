// AvalonRiscV_QSYS_tb.v

// Generated using ACDS version 17.1 590

`timescale 1 ps / 1 ps
module AvalonRiscV_QSYS_tb (
	);

	parameter c_CLOCK_PERIOD_NS = 20;
	parameter c_CLKS_PER_BIT    = 434;
	parameter c_BIT_PERIOD      = 8600;

	wire        r_Clock;                    // AvalonRiscV_QSYS_inst_clk_bfm:clk -> [AvalonRiscV_QSYS_inst:clk_clk, AvalonRiscV_QSYS_inst_masteruart_rs232_rx_bfm:clk, AvalonRiscV_QSYS_inst_masteruart_rs232_tx_bfm:clk, AvalonRiscV_QSYS_inst_reset_bfm:clk]
	reg r_Rx_Serial = 1; // AvalonRiscV_QSYS_inst_masteruart_rs232_rx_bfm:sig_rx -> AvalonRiscV_QSYS_inst:masteruart_rs232_rx_rx
	wire        TX;             // AvalonRiscV_QSYS_inst:masteruart_rs232_tx_tx -> AvalonRiscV_QSYS_inst_masteruart_rs232_tx_bfm:sig_tx
	wire        avalonriscv_qsys_inst_reset_bfm_reset_reset;              // AvalonRiscV_QSYS_inst_reset_bfm:reset -> [AvalonRiscV_QSYS_inst:reset_reset_n, AvalonRiscV_QSYS_inst_masteruart_rs232_rx_bfm:reset, AvalonRiscV_QSYS_inst_masteruart_rs232_tx_bfm:reset]

	AvalonRiscV_QSYS avalonriscv_qsys_inst (
		.clk_clk                (r_Clock),                    //                 clk.clk
		.masteruart_rs232_rx_rx (r_Rx_Serial), // masteruart_rs232_rx.rx
		.masteruart_rs232_tx_tx (TX),             // masteruart_rs232_tx.tx
		.reset_reset_n          (avalonriscv_qsys_inst_reset_bfm_reset_reset)               //               reset.reset_n
	);

	altera_avalon_clock_source #(
		.CLOCK_RATE (50000000),
		.CLOCK_UNIT (1)
	) avalonriscv_qsys_inst_clk_bfm (
		.clk (r_Clock)  // clk.clk
	);

	/*altera_conduit_bfm avalonriscv_qsys_inst_masteruart_rs232_rx_bfm (
		.clk    (avalonriscv_qsys_inst_clk_bfm_clk_clk),                    //     clk.clk
		.reset  (~avalonriscv_qsys_inst_reset_bfm_reset_reset),             //   reset.reset
		.sig_rx (avalonriscv_qsys_inst_masteruart_rs232_rx_bfm_conduit_rx)  // conduit.rx
	);

	altera_conduit_bfm_0002 avalonriscv_qsys_inst_masteruart_rs232_tx_bfm (
		.clk    (avalonriscv_qsys_inst_clk_bfm_clk_clk),        //     clk.clk
		.reset  (~avalonriscv_qsys_inst_reset_bfm_reset_reset), //   reset.reset
		.sig_tx (avalonriscv_qsys_inst_masteruart_rs232_tx_tx)  // conduit.tx
	);*/

	altera_avalon_reset_source #(
		.ASSERT_HIGH_RESET    (0),
		.INITIAL_RESET_CYCLES (50)
	) avalonriscv_qsys_inst_reset_bfm (
		.reset (avalonriscv_qsys_inst_reset_bfm_reset_reset), // reset.reset_n
		.clk   (r_Clock)        //   clk.clk
	);


// Takes in input byte and serializes it 
  task UART_WRITE_BYTE;
    input [7:0] i_Data;
    integer     ii;
    begin
       
      // Send Start Bit
      r_Rx_Serial <= 1'b0;
      #(c_BIT_PERIOD);
      //#1000;
      repeat(c_CLKS_PER_BIT) @(posedge r_Clock);
       
      // Send Data Byte
	  
		  for (ii=0; ii<8; ii=ii+1)
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
       wait(avalonriscv_qsys_inst_reset_bfm_reset_reset)
      // Tell UART to send a command (exercise Tx)
      @(posedge r_Clock);

       
      // Send a command to the UART (exercise Rx)
     
      @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h01);
      @(posedge r_Clock);
	  
	  
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h93);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h09);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h30);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h12);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h02);
      @(posedge r_Clock);
	  
	  
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h41);
      @(posedge r_Clock);

	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);


		
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h01);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  
	  
      @(posedge r_Clock);
      UART_WRITE_BYTE(8'h04);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);

	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h01);
      @(posedge r_Clock);	

	  
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h93);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h08);
      @(posedge r_Clock);	  
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);	  
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h10);
      @(posedge r_Clock);	  
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h02);
      @(posedge r_Clock);	  
	  
	  
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h41);
      @(posedge r_Clock);

	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h01);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h08);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h01);
      @(posedge r_Clock);
	  
	  
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h37);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'hf9);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h2f);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h02);
      @(posedge r_Clock);
	  
	  
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h41);
      @(posedge r_Clock);

	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  
	  
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h01);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  
	  
      UART_WRITE_BYTE(8'h0c);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h01);
      @(posedge r_Clock);
	  
	  
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h23);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'ha2);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h38);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h01);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h02);
      @(posedge r_Clock);
	  
	  
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h41);
      @(posedge r_Clock);

	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h01);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  
	  
      UART_WRITE_BYTE(8'h10);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h01);
      @(posedge r_Clock);
	  
	  
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h13);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h0a);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h1a);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h02);
      @(posedge r_Clock);
	  
	  
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h41);
      @(posedge r_Clock);

	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h01);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock); 
	  
	  
	  
      UART_WRITE_BYTE(8'h14);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h01);
      @(posedge r_Clock);
	  
	  
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'hb3);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h02);
      @(posedge r_Clock);
	  
	  
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h41);
      @(posedge r_Clock);

	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h01);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock); 	  
	  
	  

      UART_WRITE_BYTE(8'h18);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h01);
      @(posedge r_Clock);
	  
	  
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h23);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'ha0);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h48);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h01);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h02);
      @(posedge r_Clock);
	  
	  
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h41);
      @(posedge r_Clock);

	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h01);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock); 
	  
	  
	  

      UART_WRITE_BYTE(8'h1c);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h01);
      @(posedge r_Clock);
	  
	  
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h93);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h80);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h10);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h02);
      @(posedge r_Clock);
	  
	  
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h41);
      @(posedge r_Clock);

	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h01);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock); 	




	  UART_WRITE_BYTE(8'h20);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h01);
      @(posedge r_Clock);
	  
	  
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'he3);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h88);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h20);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'hff);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h02);
      @(posedge r_Clock);
	  

	  
	  
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h41);
      @(posedge r_Clock);

	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h01);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock); 





      UART_WRITE_BYTE(8'h24);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h01);
      @(posedge r_Clock);
	  
	  
	  
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h13);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h02);
      @(posedge r_Clock);
	  
	  
	  
	  
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h41);
      @(posedge r_Clock);

	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h01);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock); 
	  
	  
	  
	  
	  UART_WRITE_BYTE(8'h28);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h01);
      @(posedge r_Clock);
	  
	  
	  
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'he3);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h9a);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h20);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'hff);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h02);
      @(posedge r_Clock);
	  
	  
	  
	  
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h41);
      @(posedge r_Clock);

	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h01);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock); 
	  
	  
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h01);			
      @(posedge r_Clock);

	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h01);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  
	   
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h01);			
      @(posedge r_Clock);

	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  /*
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h61);			
      @(posedge r_Clock);

	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  repeat(40*c_CLKS_PER_BIT) @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h01);			
      @(posedge r_Clock);

	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  
	  
	  UART_WRITE_BYTE(8'h04);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h01);
      @(posedge r_Clock);
	  



	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h01);			
      @(posedge r_Clock);

	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h01);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  
	  	  
	  
	  
	  
	  
	  repeat(40*c_CLKS_PER_BIT) @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h01);			
      @(posedge r_Clock);

	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);



 	 @(posedge r_Clock);
      UART_WRITE_BYTE(8'h08);			
      @(posedge r_Clock);

	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h01);
      @(posedge r_Clock);

	  
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h21);			
      @(posedge r_Clock);

	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
      @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);

      repeat(40*c_CLKS_PER_BIT) @(posedge r_Clock);  
	
      @(posedge r_Clock);
      UART_WRITE_BYTE(8'h01);			
      @(posedge r_Clock);

	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h01);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  repeat(40*c_CLKS_PER_BIT) @(posedge r_Clock);  
	  
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h0d);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h05);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  */
	  
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h0d);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h5f);
      @(posedge r_Clock);
	  
	  @(posedge r_Clock);
      UART_WRITE_BYTE(8'h00);
      @(posedge r_Clock);
	  
	  repeat(1000*c_CLKS_PER_BIT) @(posedge r_Clock); 
	  
	$stop;
    end


endmodule
