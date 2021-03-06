// AvalonUARTQsys_mm_interconnect_0.v

// This file was auto-generated from altera_mm_interconnect_hw.tcl.  If you edit it your changes
// will probably be lost.
// 
// Generated using ACDS version 17.1 590

`timescale 1 ps / 1 ps
module AvalonUARTQsys_mm_interconnect_0 (
		input  wire        clk_0_clk_clk,                                         //                                       clk_0_clk.clk
		input  wire        avalon_timer_0_reset_sink_reset_bridge_in_reset_reset, // avalon_timer_0_reset_sink_reset_bridge_in_reset.reset
		input  wire        AvalonMasterUART_0_reset_reset_bridge_in_reset_reset,  //  AvalonMasterUART_0_reset_reset_bridge_in_reset.reset
		input  wire [31:0] AvalonMasterUART_0_avalon_master_address,              //                AvalonMasterUART_0_avalon_master.address
		output wire        AvalonMasterUART_0_avalon_master_waitrequest,          //                                                .waitrequest
		input  wire        AvalonMasterUART_0_avalon_master_read,                 //                                                .read
		output wire [31:0] AvalonMasterUART_0_avalon_master_readdata,             //                                                .readdata
		input  wire        AvalonMasterUART_0_avalon_master_write,                //                                                .write
		input  wire [31:0] AvalonMasterUART_0_avalon_master_writedata,            //                                                .writedata
		input  wire        AvalonMasterUART_0_avalon_master_lock,                 //                                                .lock
		output wire [2:0]  avalon_timer_0_avalon_slave_address,                   //                     avalon_timer_0_avalon_slave.address
		output wire        avalon_timer_0_avalon_slave_write,                     //                                                .write
		output wire        avalon_timer_0_avalon_slave_read,                      //                                                .read
		input  wire [31:0] avalon_timer_0_avalon_slave_readdata,                  //                                                .readdata
		output wire [31:0] avalon_timer_0_avalon_slave_writedata,                 //                                                .writedata
		output wire        avalon_timer_0_avalon_slave_chipselect                 //                                                .chipselect
	);

	wire         avalonmasteruart_0_avalon_master_translator_avalon_universal_master_0_waitrequest;   // avalon_timer_0_avalon_slave_translator:uav_waitrequest -> AvalonMasterUART_0_avalon_master_translator:uav_waitrequest
	wire  [31:0] avalonmasteruart_0_avalon_master_translator_avalon_universal_master_0_readdata;      // avalon_timer_0_avalon_slave_translator:uav_readdata -> AvalonMasterUART_0_avalon_master_translator:uav_readdata
	wire         avalonmasteruart_0_avalon_master_translator_avalon_universal_master_0_debugaccess;   // AvalonMasterUART_0_avalon_master_translator:uav_debugaccess -> avalon_timer_0_avalon_slave_translator:uav_debugaccess
	wire  [31:0] avalonmasteruart_0_avalon_master_translator_avalon_universal_master_0_address;       // AvalonMasterUART_0_avalon_master_translator:uav_address -> avalon_timer_0_avalon_slave_translator:uav_address
	wire         avalonmasteruart_0_avalon_master_translator_avalon_universal_master_0_read;          // AvalonMasterUART_0_avalon_master_translator:uav_read -> avalon_timer_0_avalon_slave_translator:uav_read
	wire   [3:0] avalonmasteruart_0_avalon_master_translator_avalon_universal_master_0_byteenable;    // AvalonMasterUART_0_avalon_master_translator:uav_byteenable -> avalon_timer_0_avalon_slave_translator:uav_byteenable
	wire         avalonmasteruart_0_avalon_master_translator_avalon_universal_master_0_readdatavalid; // avalon_timer_0_avalon_slave_translator:uav_readdatavalid -> AvalonMasterUART_0_avalon_master_translator:uav_readdatavalid
	wire         avalonmasteruart_0_avalon_master_translator_avalon_universal_master_0_lock;          // AvalonMasterUART_0_avalon_master_translator:uav_lock -> avalon_timer_0_avalon_slave_translator:uav_lock
	wire         avalonmasteruart_0_avalon_master_translator_avalon_universal_master_0_write;         // AvalonMasterUART_0_avalon_master_translator:uav_write -> avalon_timer_0_avalon_slave_translator:uav_write
	wire  [31:0] avalonmasteruart_0_avalon_master_translator_avalon_universal_master_0_writedata;     // AvalonMasterUART_0_avalon_master_translator:uav_writedata -> avalon_timer_0_avalon_slave_translator:uav_writedata
	wire   [2:0] avalonmasteruart_0_avalon_master_translator_avalon_universal_master_0_burstcount;    // AvalonMasterUART_0_avalon_master_translator:uav_burstcount -> avalon_timer_0_avalon_slave_translator:uav_burstcount

	altera_merlin_master_translator #(
		.AV_ADDRESS_W                (32),
		.AV_DATA_W                   (32),
		.AV_BURSTCOUNT_W             (1),
		.AV_BYTEENABLE_W             (4),
		.UAV_ADDRESS_W               (32),
		.UAV_BURSTCOUNT_W            (3),
		.USE_READ                    (1),
		.USE_WRITE                   (1),
		.USE_BEGINBURSTTRANSFER      (0),
		.USE_BEGINTRANSFER           (0),
		.USE_CHIPSELECT              (0),
		.USE_BURSTCOUNT              (0),
		.USE_READDATAVALID           (0),
		.USE_WAITREQUEST             (1),
		.USE_READRESPONSE            (0),
		.USE_WRITERESPONSE           (0),
		.AV_SYMBOLS_PER_WORD         (4),
		.AV_ADDRESS_SYMBOLS          (1),
		.AV_BURSTCOUNT_SYMBOLS       (0),
		.AV_CONSTANT_BURST_BEHAVIOR  (0),
		.UAV_CONSTANT_BURST_BEHAVIOR (0),
		.AV_LINEWRAPBURSTS           (0),
		.AV_REGISTERINCOMINGSIGNALS  (0)
	) avalonmasteruart_0_avalon_master_translator (
		.clk                    (clk_0_clk_clk),                                                                       //                       clk.clk
		.reset                  (AvalonMasterUART_0_reset_reset_bridge_in_reset_reset),                                //                     reset.reset
		.uav_address            (avalonmasteruart_0_avalon_master_translator_avalon_universal_master_0_address),       // avalon_universal_master_0.address
		.uav_burstcount         (avalonmasteruart_0_avalon_master_translator_avalon_universal_master_0_burstcount),    //                          .burstcount
		.uav_read               (avalonmasteruart_0_avalon_master_translator_avalon_universal_master_0_read),          //                          .read
		.uav_write              (avalonmasteruart_0_avalon_master_translator_avalon_universal_master_0_write),         //                          .write
		.uav_waitrequest        (avalonmasteruart_0_avalon_master_translator_avalon_universal_master_0_waitrequest),   //                          .waitrequest
		.uav_readdatavalid      (avalonmasteruart_0_avalon_master_translator_avalon_universal_master_0_readdatavalid), //                          .readdatavalid
		.uav_byteenable         (avalonmasteruart_0_avalon_master_translator_avalon_universal_master_0_byteenable),    //                          .byteenable
		.uav_readdata           (avalonmasteruart_0_avalon_master_translator_avalon_universal_master_0_readdata),      //                          .readdata
		.uav_writedata          (avalonmasteruart_0_avalon_master_translator_avalon_universal_master_0_writedata),     //                          .writedata
		.uav_lock               (avalonmasteruart_0_avalon_master_translator_avalon_universal_master_0_lock),          //                          .lock
		.uav_debugaccess        (avalonmasteruart_0_avalon_master_translator_avalon_universal_master_0_debugaccess),   //                          .debugaccess
		.av_address             (AvalonMasterUART_0_avalon_master_address),                                            //      avalon_anti_master_0.address
		.av_waitrequest         (AvalonMasterUART_0_avalon_master_waitrequest),                                        //                          .waitrequest
		.av_read                (AvalonMasterUART_0_avalon_master_read),                                               //                          .read
		.av_readdata            (AvalonMasterUART_0_avalon_master_readdata),                                           //                          .readdata
		.av_write               (AvalonMasterUART_0_avalon_master_write),                                              //                          .write
		.av_writedata           (AvalonMasterUART_0_avalon_master_writedata),                                          //                          .writedata
		.av_lock                (AvalonMasterUART_0_avalon_master_lock),                                               //                          .lock
		.av_burstcount          (1'b1),                                                                                //               (terminated)
		.av_byteenable          (4'b1111),                                                                             //               (terminated)
		.av_beginbursttransfer  (1'b0),                                                                                //               (terminated)
		.av_begintransfer       (1'b0),                                                                                //               (terminated)
		.av_chipselect          (1'b0),                                                                                //               (terminated)
		.av_readdatavalid       (),                                                                                    //               (terminated)
		.av_debugaccess         (1'b0),                                                                                //               (terminated)
		.uav_clken              (),                                                                                    //               (terminated)
		.av_clken               (1'b1),                                                                                //               (terminated)
		.uav_response           (2'b00),                                                                               //               (terminated)
		.av_response            (),                                                                                    //               (terminated)
		.uav_writeresponsevalid (1'b0),                                                                                //               (terminated)
		.av_writeresponsevalid  ()                                                                                     //               (terminated)
	);

	altera_merlin_slave_translator #(
		.AV_ADDRESS_W                   (3),
		.AV_DATA_W                      (32),
		.UAV_DATA_W                     (32),
		.AV_BURSTCOUNT_W                (1),
		.AV_BYTEENABLE_W                (4),
		.UAV_BYTEENABLE_W               (4),
		.UAV_ADDRESS_W                  (32),
		.UAV_BURSTCOUNT_W               (3),
		.AV_READLATENCY                 (0),
		.USE_READDATAVALID              (0),
		.USE_WAITREQUEST                (0),
		.USE_UAV_CLKEN                  (0),
		.USE_READRESPONSE               (0),
		.USE_WRITERESPONSE              (0),
		.AV_SYMBOLS_PER_WORD            (4),
		.AV_ADDRESS_SYMBOLS             (0),
		.AV_BURSTCOUNT_SYMBOLS          (0),
		.AV_CONSTANT_BURST_BEHAVIOR     (0),
		.UAV_CONSTANT_BURST_BEHAVIOR    (0),
		.AV_REQUIRE_UNALIGNED_ADDRESSES (0),
		.CHIPSELECT_THROUGH_READLATENCY (0),
		.AV_READ_WAIT_CYCLES            (1),
		.AV_WRITE_WAIT_CYCLES           (0),
		.AV_SETUP_WAIT_CYCLES           (0),
		.AV_DATA_HOLD_CYCLES            (0)
	) avalon_timer_0_avalon_slave_translator (
		.clk                    (clk_0_clk_clk),                                                                       //                      clk.clk
		.reset                  (AvalonMasterUART_0_reset_reset_bridge_in_reset_reset),                                //                    reset.reset
		.uav_address            (avalonmasteruart_0_avalon_master_translator_avalon_universal_master_0_address),       // avalon_universal_slave_0.address
		.uav_burstcount         (avalonmasteruart_0_avalon_master_translator_avalon_universal_master_0_burstcount),    //                         .burstcount
		.uav_read               (avalonmasteruart_0_avalon_master_translator_avalon_universal_master_0_read),          //                         .read
		.uav_write              (avalonmasteruart_0_avalon_master_translator_avalon_universal_master_0_write),         //                         .write
		.uav_waitrequest        (avalonmasteruart_0_avalon_master_translator_avalon_universal_master_0_waitrequest),   //                         .waitrequest
		.uav_readdatavalid      (avalonmasteruart_0_avalon_master_translator_avalon_universal_master_0_readdatavalid), //                         .readdatavalid
		.uav_byteenable         (avalonmasteruart_0_avalon_master_translator_avalon_universal_master_0_byteenable),    //                         .byteenable
		.uav_readdata           (avalonmasteruart_0_avalon_master_translator_avalon_universal_master_0_readdata),      //                         .readdata
		.uav_writedata          (avalonmasteruart_0_avalon_master_translator_avalon_universal_master_0_writedata),     //                         .writedata
		.uav_lock               (avalonmasteruart_0_avalon_master_translator_avalon_universal_master_0_lock),          //                         .lock
		.uav_debugaccess        (avalonmasteruart_0_avalon_master_translator_avalon_universal_master_0_debugaccess),   //                         .debugaccess
		.av_address             (avalon_timer_0_avalon_slave_address),                                                 //      avalon_anti_slave_0.address
		.av_write               (avalon_timer_0_avalon_slave_write),                                                   //                         .write
		.av_read                (avalon_timer_0_avalon_slave_read),                                                    //                         .read
		.av_readdata            (avalon_timer_0_avalon_slave_readdata),                                                //                         .readdata
		.av_writedata           (avalon_timer_0_avalon_slave_writedata),                                               //                         .writedata
		.av_chipselect          (avalon_timer_0_avalon_slave_chipselect),                                              //                         .chipselect
		.av_begintransfer       (),                                                                                    //              (terminated)
		.av_beginbursttransfer  (),                                                                                    //              (terminated)
		.av_burstcount          (),                                                                                    //              (terminated)
		.av_byteenable          (),                                                                                    //              (terminated)
		.av_readdatavalid       (1'b0),                                                                                //              (terminated)
		.av_waitrequest         (1'b0),                                                                                //              (terminated)
		.av_writebyteenable     (),                                                                                    //              (terminated)
		.av_lock                (),                                                                                    //              (terminated)
		.av_clken               (),                                                                                    //              (terminated)
		.uav_clken              (1'b0),                                                                                //              (terminated)
		.av_debugaccess         (),                                                                                    //              (terminated)
		.av_outputenable        (),                                                                                    //              (terminated)
		.uav_response           (),                                                                                    //              (terminated)
		.av_response            (2'b00),                                                                               //              (terminated)
		.uav_writeresponsevalid (),                                                                                    //              (terminated)
		.av_writeresponsevalid  (1'b0)                                                                                 //              (terminated)
	);

endmodule
