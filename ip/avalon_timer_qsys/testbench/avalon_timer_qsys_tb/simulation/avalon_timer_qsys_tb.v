// avalon_timer_qsys_tb.v

// Generated using ACDS version 17.1 590

`timescale 1 ps / 1 ps
module avalon_timer_qsys_tb (
	);

	wire    avalon_timer_qsys_inst_clk_bfm_clk_clk;                           // avalon_timer_qsys_inst_clk_bfm:clk -> [avalon_timer_qsys_inst:clk_clk, avalon_timer_qsys_inst_avalon_timer_0_external_interface_bfm:clk, avalon_timer_qsys_inst_reset_bfm:clk]
	wire    avalon_timer_qsys_inst_avalon_timer_0_external_interface_conduit; // avalon_timer_qsys_inst:avalon_timer_0_external_interface_conduit -> avalon_timer_qsys_inst_avalon_timer_0_external_interface_bfm:sig_conduit
	wire    avalon_timer_qsys_inst_reset_bfm_reset_reset;                     // avalon_timer_qsys_inst_reset_bfm:reset -> [avalon_timer_qsys_inst:reset_reset_n, avalon_timer_qsys_inst_avalon_timer_0_external_interface_bfm:reset]

	avalon_timer_qsys avalon_timer_qsys_inst (
		.avalon_timer_0_external_interface_conduit (avalon_timer_qsys_inst_avalon_timer_0_external_interface_conduit), // avalon_timer_0_external_interface.conduit
		.clk_clk                                   (avalon_timer_qsys_inst_clk_bfm_clk_clk),                           //                               clk.clk
		.reset_reset_n                             (avalon_timer_qsys_inst_reset_bfm_reset_reset)                      //                             reset.reset_n
	);

	altera_conduit_bfm avalon_timer_qsys_inst_avalon_timer_0_external_interface_bfm (
		.clk         (avalon_timer_qsys_inst_clk_bfm_clk_clk),                           //     clk.clk
		.reset       (~avalon_timer_qsys_inst_reset_bfm_reset_reset),                    //   reset.reset
		.sig_conduit (avalon_timer_qsys_inst_avalon_timer_0_external_interface_conduit)  // conduit.conduit
	);

	altera_avalon_clock_source #(
		.CLOCK_RATE (50000000),
		.CLOCK_UNIT (1)
	) avalon_timer_qsys_inst_clk_bfm (
		.clk (avalon_timer_qsys_inst_clk_bfm_clk_clk)  // clk.clk
	);

	altera_avalon_reset_source #(
		.ASSERT_HIGH_RESET    (0),
		.INITIAL_RESET_CYCLES (50)
	) avalon_timer_qsys_inst_reset_bfm (
		.reset (avalon_timer_qsys_inst_reset_bfm_reset_reset), // reset.reset_n
		.clk   (avalon_timer_qsys_inst_clk_bfm_clk_clk)        //   clk.clk
	);

endmodule
