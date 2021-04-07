// AvalonRiscV_QSYS_tb.v

// Generated using ACDS version 17.1 590

`timescale 1 ps / 1 ps
module AvalonRiscV_QSYS_tb (
	);

	wire        avalonriscv_qsys_inst_clk_bfm_clk_clk;                                   // AvalonRiscV_QSYS_inst_clk_bfm:clk -> [AvalonRiscV_QSYS_inst:clk_clk, AvalonRiscV_QSYS_inst_masteruart_rs232_rx_bfm:clk, AvalonRiscV_QSYS_inst_masteruart_rs232_tx_bfm:clk, AvalonRiscV_QSYS_inst_reset_bfm:clk]
	wire  [6:0] avalonriscv_qsys_inst_avalon_displays7seg_0_external_interface_conduit3; // AvalonRiscV_QSYS_inst:avalon_displays7seg_0_external_interface_conduit3 -> AvalonRiscV_QSYS_inst_avalon_displays7seg_0_external_interface_bfm:sig_conduit3
	wire  [6:0] avalonriscv_qsys_inst_avalon_displays7seg_0_external_interface_conduit2; // AvalonRiscV_QSYS_inst:avalon_displays7seg_0_external_interface_conduit2 -> AvalonRiscV_QSYS_inst_avalon_displays7seg_0_external_interface_bfm:sig_conduit2
	wire  [6:0] avalonriscv_qsys_inst_avalon_displays7seg_0_external_interface_conduit5; // AvalonRiscV_QSYS_inst:avalon_displays7seg_0_external_interface_conduit5 -> AvalonRiscV_QSYS_inst_avalon_displays7seg_0_external_interface_bfm:sig_conduit5
	wire  [6:0] avalonriscv_qsys_inst_avalon_displays7seg_0_external_interface_conduit4; // AvalonRiscV_QSYS_inst:avalon_displays7seg_0_external_interface_conduit4 -> AvalonRiscV_QSYS_inst_avalon_displays7seg_0_external_interface_bfm:sig_conduit4
	wire  [6:0] avalonriscv_qsys_inst_avalon_displays7seg_0_external_interface_conduit1; // AvalonRiscV_QSYS_inst:avalon_displays7seg_0_external_interface_conduit1 -> AvalonRiscV_QSYS_inst_avalon_displays7seg_0_external_interface_bfm:sig_conduit1
	wire  [6:0] avalonriscv_qsys_inst_avalon_displays7seg_0_external_interface_conduit0; // AvalonRiscV_QSYS_inst:avalon_displays7seg_0_external_interface_conduit0 -> AvalonRiscV_QSYS_inst_avalon_displays7seg_0_external_interface_bfm:sig_conduit0
	wire  [6:0] avalonriscv_qsys_inst_avalon_displays7seg_0_external_interface_conduit7; // AvalonRiscV_QSYS_inst:avalon_displays7seg_0_external_interface_conduit7 -> AvalonRiscV_QSYS_inst_avalon_displays7seg_0_external_interface_bfm:sig_conduit7
	wire  [6:0] avalonriscv_qsys_inst_avalon_displays7seg_0_external_interface_conduit6; // AvalonRiscV_QSYS_inst:avalon_displays7seg_0_external_interface_conduit6 -> AvalonRiscV_QSYS_inst_avalon_displays7seg_0_external_interface_bfm:sig_conduit6
	wire  [0:0] avalonriscv_qsys_inst_masteruart_rs232_rx_bfm_conduit_rx;                // AvalonRiscV_QSYS_inst_masteruart_rs232_rx_bfm:sig_rx -> AvalonRiscV_QSYS_inst:masteruart_rs232_rx_rx
	wire        avalonriscv_qsys_inst_masteruart_rs232_tx_tx;                            // AvalonRiscV_QSYS_inst:masteruart_rs232_tx_tx -> AvalonRiscV_QSYS_inst_masteruart_rs232_tx_bfm:sig_tx
	wire        avalonriscv_qsys_inst_reset_bfm_reset_reset;                             // AvalonRiscV_QSYS_inst_reset_bfm:reset -> [AvalonRiscV_QSYS_inst:reset_reset_n, AvalonRiscV_QSYS_inst_masteruart_rs232_rx_bfm:reset, AvalonRiscV_QSYS_inst_masteruart_rs232_tx_bfm:reset]

	AvalonRiscV_QSYS avalonriscv_qsys_inst (
		.avalon_displays7seg_0_external_interface_conduit1 (avalonriscv_qsys_inst_avalon_displays7seg_0_external_interface_conduit1), // avalon_displays7seg_0_external_interface.conduit1
		.avalon_displays7seg_0_external_interface_conduit0 (avalonriscv_qsys_inst_avalon_displays7seg_0_external_interface_conduit0), //                                         .conduit0
		.avalon_displays7seg_0_external_interface_conduit2 (avalonriscv_qsys_inst_avalon_displays7seg_0_external_interface_conduit2), //                                         .conduit2
		.avalon_displays7seg_0_external_interface_conduit3 (avalonriscv_qsys_inst_avalon_displays7seg_0_external_interface_conduit3), //                                         .conduit3
		.avalon_displays7seg_0_external_interface_conduit4 (avalonriscv_qsys_inst_avalon_displays7seg_0_external_interface_conduit4), //                                         .conduit4
		.avalon_displays7seg_0_external_interface_conduit5 (avalonriscv_qsys_inst_avalon_displays7seg_0_external_interface_conduit5), //                                         .conduit5
		.avalon_displays7seg_0_external_interface_conduit6 (avalonriscv_qsys_inst_avalon_displays7seg_0_external_interface_conduit6), //                                         .conduit6
		.avalon_displays7seg_0_external_interface_conduit7 (avalonriscv_qsys_inst_avalon_displays7seg_0_external_interface_conduit7), //                                         .conduit7
		.clk_clk                                           (avalonriscv_qsys_inst_clk_bfm_clk_clk),                                   //                                      clk.clk
		.masteruart_rs232_rx_rx                            (avalonriscv_qsys_inst_masteruart_rs232_rx_bfm_conduit_rx),                //                      masteruart_rs232_rx.rx
		.masteruart_rs232_tx_tx                            (avalonriscv_qsys_inst_masteruart_rs232_tx_tx),                            //                      masteruart_rs232_tx.tx
		.reset_reset_n                                     (avalonriscv_qsys_inst_reset_bfm_reset_reset)                              //                                    reset.reset_n
	);

	altera_conduit_bfm avalonriscv_qsys_inst_avalon_displays7seg_0_external_interface_bfm (
		.sig_conduit0 (avalonriscv_qsys_inst_avalon_displays7seg_0_external_interface_conduit0), // conduit.conduit0
		.sig_conduit1 (avalonriscv_qsys_inst_avalon_displays7seg_0_external_interface_conduit1), //        .conduit1
		.sig_conduit2 (avalonriscv_qsys_inst_avalon_displays7seg_0_external_interface_conduit2), //        .conduit2
		.sig_conduit3 (avalonriscv_qsys_inst_avalon_displays7seg_0_external_interface_conduit3), //        .conduit3
		.sig_conduit4 (avalonriscv_qsys_inst_avalon_displays7seg_0_external_interface_conduit4), //        .conduit4
		.sig_conduit5 (avalonriscv_qsys_inst_avalon_displays7seg_0_external_interface_conduit5), //        .conduit5
		.sig_conduit6 (avalonriscv_qsys_inst_avalon_displays7seg_0_external_interface_conduit6), //        .conduit6
		.sig_conduit7 (avalonriscv_qsys_inst_avalon_displays7seg_0_external_interface_conduit7)  //        .conduit7
	);

	altera_avalon_clock_source #(
		.CLOCK_RATE (50000000),
		.CLOCK_UNIT (1)
	) avalonriscv_qsys_inst_clk_bfm (
		.clk (avalonriscv_qsys_inst_clk_bfm_clk_clk)  // clk.clk
	);

	altera_conduit_bfm_0002 avalonriscv_qsys_inst_masteruart_rs232_rx_bfm (
		.clk    (avalonriscv_qsys_inst_clk_bfm_clk_clk),                    //     clk.clk
		.reset  (~avalonriscv_qsys_inst_reset_bfm_reset_reset),             //   reset.reset
		.sig_rx (avalonriscv_qsys_inst_masteruart_rs232_rx_bfm_conduit_rx)  // conduit.rx
	);

	altera_conduit_bfm_0003 avalonriscv_qsys_inst_masteruart_rs232_tx_bfm (
		.clk    (avalonriscv_qsys_inst_clk_bfm_clk_clk),        //     clk.clk
		.reset  (~avalonriscv_qsys_inst_reset_bfm_reset_reset), //   reset.reset
		.sig_tx (avalonriscv_qsys_inst_masteruart_rs232_tx_tx)  // conduit.tx
	);

	altera_avalon_reset_source #(
		.ASSERT_HIGH_RESET    (0),
		.INITIAL_RESET_CYCLES (50)
	) avalonriscv_qsys_inst_reset_bfm (
		.reset (avalonriscv_qsys_inst_reset_bfm_reset_reset), // reset.reset_n
		.clk   (avalonriscv_qsys_inst_clk_bfm_clk_clk)        //   clk.clk
	);

endmodule
