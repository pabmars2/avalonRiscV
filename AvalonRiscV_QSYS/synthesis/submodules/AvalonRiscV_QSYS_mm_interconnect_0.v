// AvalonRiscV_QSYS_mm_interconnect_0.v

// This file was auto-generated from altera_mm_interconnect_hw.tcl.  If you edit it your changes
// will probably be lost.
// 
// Generated using ACDS version 17.1 590

`timescale 1 ps / 1 ps
module AvalonRiscV_QSYS_mm_interconnect_0 (
		input  wire        clk_0_clk_clk,                                //                              clk_0_clk.clk
		input  wire        MasterUART_reset_reset_bridge_in_reset_reset, // MasterUART_reset_reset_bridge_in_reset.reset
		input  wire [31:0] MasterUART_avalon_master_address,             //               MasterUART_avalon_master.address
		output wire        MasterUART_avalon_master_waitrequest,         //                                       .waitrequest
		input  wire        MasterUART_avalon_master_read,                //                                       .read
		output wire [31:0] MasterUART_avalon_master_readdata,            //                                       .readdata
		input  wire        MasterUART_avalon_master_write,               //                                       .write
		input  wire [31:0] MasterUART_avalon_master_writedata,           //                                       .writedata
		input  wire        MasterUART_avalon_master_lock,                //                                       .lock
		output wire [2:0]  RISC_V_AVALON_0_debug_address,                //                  RISC_V_AVALON_0_debug.address
		output wire        RISC_V_AVALON_0_debug_write,                  //                                       .write
		output wire        RISC_V_AVALON_0_debug_read,                   //                                       .read
		input  wire [31:0] RISC_V_AVALON_0_debug_readdata,               //                                       .readdata
		output wire [31:0] RISC_V_AVALON_0_debug_writedata,              //                                       .writedata
		output wire        RISC_V_AVALON_0_debug_chipselect              //                                       .chipselect
	);

	wire         masteruart_avalon_master_translator_avalon_universal_master_0_waitrequest;   // RISC_V_AVALON_0_debug_translator:uav_waitrequest -> MasterUART_avalon_master_translator:uav_waitrequest
	wire  [31:0] masteruart_avalon_master_translator_avalon_universal_master_0_readdata;      // RISC_V_AVALON_0_debug_translator:uav_readdata -> MasterUART_avalon_master_translator:uav_readdata
	wire         masteruart_avalon_master_translator_avalon_universal_master_0_debugaccess;   // MasterUART_avalon_master_translator:uav_debugaccess -> RISC_V_AVALON_0_debug_translator:uav_debugaccess
	wire  [31:0] masteruart_avalon_master_translator_avalon_universal_master_0_address;       // MasterUART_avalon_master_translator:uav_address -> RISC_V_AVALON_0_debug_translator:uav_address
	wire         masteruart_avalon_master_translator_avalon_universal_master_0_read;          // MasterUART_avalon_master_translator:uav_read -> RISC_V_AVALON_0_debug_translator:uav_read
	wire   [3:0] masteruart_avalon_master_translator_avalon_universal_master_0_byteenable;    // MasterUART_avalon_master_translator:uav_byteenable -> RISC_V_AVALON_0_debug_translator:uav_byteenable
	wire         masteruart_avalon_master_translator_avalon_universal_master_0_readdatavalid; // RISC_V_AVALON_0_debug_translator:uav_readdatavalid -> MasterUART_avalon_master_translator:uav_readdatavalid
	wire         masteruart_avalon_master_translator_avalon_universal_master_0_lock;          // MasterUART_avalon_master_translator:uav_lock -> RISC_V_AVALON_0_debug_translator:uav_lock
	wire         masteruart_avalon_master_translator_avalon_universal_master_0_write;         // MasterUART_avalon_master_translator:uav_write -> RISC_V_AVALON_0_debug_translator:uav_write
	wire  [31:0] masteruart_avalon_master_translator_avalon_universal_master_0_writedata;     // MasterUART_avalon_master_translator:uav_writedata -> RISC_V_AVALON_0_debug_translator:uav_writedata
	wire   [2:0] masteruart_avalon_master_translator_avalon_universal_master_0_burstcount;    // MasterUART_avalon_master_translator:uav_burstcount -> RISC_V_AVALON_0_debug_translator:uav_burstcount

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
	) masteruart_avalon_master_translator (
		.clk                    (clk_0_clk_clk),                                                               //                       clk.clk
		.reset                  (MasterUART_reset_reset_bridge_in_reset_reset),                                //                     reset.reset
		.uav_address            (masteruart_avalon_master_translator_avalon_universal_master_0_address),       // avalon_universal_master_0.address
		.uav_burstcount         (masteruart_avalon_master_translator_avalon_universal_master_0_burstcount),    //                          .burstcount
		.uav_read               (masteruart_avalon_master_translator_avalon_universal_master_0_read),          //                          .read
		.uav_write              (masteruart_avalon_master_translator_avalon_universal_master_0_write),         //                          .write
		.uav_waitrequest        (masteruart_avalon_master_translator_avalon_universal_master_0_waitrequest),   //                          .waitrequest
		.uav_readdatavalid      (masteruart_avalon_master_translator_avalon_universal_master_0_readdatavalid), //                          .readdatavalid
		.uav_byteenable         (masteruart_avalon_master_translator_avalon_universal_master_0_byteenable),    //                          .byteenable
		.uav_readdata           (masteruart_avalon_master_translator_avalon_universal_master_0_readdata),      //                          .readdata
		.uav_writedata          (masteruart_avalon_master_translator_avalon_universal_master_0_writedata),     //                          .writedata
		.uav_lock               (masteruart_avalon_master_translator_avalon_universal_master_0_lock),          //                          .lock
		.uav_debugaccess        (masteruart_avalon_master_translator_avalon_universal_master_0_debugaccess),   //                          .debugaccess
		.av_address             (MasterUART_avalon_master_address),                                            //      avalon_anti_master_0.address
		.av_waitrequest         (MasterUART_avalon_master_waitrequest),                                        //                          .waitrequest
		.av_read                (MasterUART_avalon_master_read),                                               //                          .read
		.av_readdata            (MasterUART_avalon_master_readdata),                                           //                          .readdata
		.av_write               (MasterUART_avalon_master_write),                                              //                          .write
		.av_writedata           (MasterUART_avalon_master_writedata),                                          //                          .writedata
		.av_lock                (MasterUART_avalon_master_lock),                                               //                          .lock
		.av_burstcount          (1'b1),                                                                        //               (terminated)
		.av_byteenable          (4'b1111),                                                                     //               (terminated)
		.av_beginbursttransfer  (1'b0),                                                                        //               (terminated)
		.av_begintransfer       (1'b0),                                                                        //               (terminated)
		.av_chipselect          (1'b0),                                                                        //               (terminated)
		.av_readdatavalid       (),                                                                            //               (terminated)
		.av_debugaccess         (1'b0),                                                                        //               (terminated)
		.uav_clken              (),                                                                            //               (terminated)
		.av_clken               (1'b1),                                                                        //               (terminated)
		.uav_response           (2'b00),                                                                       //               (terminated)
		.av_response            (),                                                                            //               (terminated)
		.uav_writeresponsevalid (1'b0),                                                                        //               (terminated)
		.av_writeresponsevalid  ()                                                                             //               (terminated)
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
	) risc_v_avalon_0_debug_translator (
		.clk                    (clk_0_clk_clk),                                                               //                      clk.clk
		.reset                  (MasterUART_reset_reset_bridge_in_reset_reset),                                //                    reset.reset
		.uav_address            (masteruart_avalon_master_translator_avalon_universal_master_0_address),       // avalon_universal_slave_0.address
		.uav_burstcount         (masteruart_avalon_master_translator_avalon_universal_master_0_burstcount),    //                         .burstcount
		.uav_read               (masteruart_avalon_master_translator_avalon_universal_master_0_read),          //                         .read
		.uav_write              (masteruart_avalon_master_translator_avalon_universal_master_0_write),         //                         .write
		.uav_waitrequest        (masteruart_avalon_master_translator_avalon_universal_master_0_waitrequest),   //                         .waitrequest
		.uav_readdatavalid      (masteruart_avalon_master_translator_avalon_universal_master_0_readdatavalid), //                         .readdatavalid
		.uav_byteenable         (masteruart_avalon_master_translator_avalon_universal_master_0_byteenable),    //                         .byteenable
		.uav_readdata           (masteruart_avalon_master_translator_avalon_universal_master_0_readdata),      //                         .readdata
		.uav_writedata          (masteruart_avalon_master_translator_avalon_universal_master_0_writedata),     //                         .writedata
		.uav_lock               (masteruart_avalon_master_translator_avalon_universal_master_0_lock),          //                         .lock
		.uav_debugaccess        (masteruart_avalon_master_translator_avalon_universal_master_0_debugaccess),   //                         .debugaccess
		.av_address             (RISC_V_AVALON_0_debug_address),                                               //      avalon_anti_slave_0.address
		.av_write               (RISC_V_AVALON_0_debug_write),                                                 //                         .write
		.av_read                (RISC_V_AVALON_0_debug_read),                                                  //                         .read
		.av_readdata            (RISC_V_AVALON_0_debug_readdata),                                              //                         .readdata
		.av_writedata           (RISC_V_AVALON_0_debug_writedata),                                             //                         .writedata
		.av_chipselect          (RISC_V_AVALON_0_debug_chipselect),                                            //                         .chipselect
		.av_begintransfer       (),                                                                            //              (terminated)
		.av_beginbursttransfer  (),                                                                            //              (terminated)
		.av_burstcount          (),                                                                            //              (terminated)
		.av_byteenable          (),                                                                            //              (terminated)
		.av_readdatavalid       (1'b0),                                                                        //              (terminated)
		.av_waitrequest         (1'b0),                                                                        //              (terminated)
		.av_writebyteenable     (),                                                                            //              (terminated)
		.av_lock                (),                                                                            //              (terminated)
		.av_clken               (),                                                                            //              (terminated)
		.uav_clken              (1'b0),                                                                        //              (terminated)
		.av_debugaccess         (),                                                                            //              (terminated)
		.av_outputenable        (),                                                                            //              (terminated)
		.uav_response           (),                                                                            //              (terminated)
		.av_response            (2'b00),                                                                       //              (terminated)
		.uav_writeresponsevalid (),                                                                            //              (terminated)
		.av_writeresponsevalid  (1'b0)                                                                         //              (terminated)
	);

endmodule
