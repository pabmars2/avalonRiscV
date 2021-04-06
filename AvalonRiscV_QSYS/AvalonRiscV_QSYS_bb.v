
module AvalonRiscV_QSYS (
	avalon_displays7seg_0_external_interface_conduit1,
	avalon_displays7seg_0_external_interface_conduit0,
	avalon_displays7seg_0_external_interface_conduit2,
	avalon_displays7seg_0_external_interface_conduit3,
	avalon_displays7seg_0_external_interface_conduit4,
	avalon_displays7seg_0_external_interface_conduit5,
	avalon_displays7seg_0_external_interface_conduit6,
	avalon_displays7seg_0_external_interface_conduit7,
	avalonmasteruart_0_rs232_rx,
	avalonmasteruart_0_rs232_tx,
	clk_clk,
	reset_reset_n);	

	output	[6:0]	avalon_displays7seg_0_external_interface_conduit1;
	output	[6:0]	avalon_displays7seg_0_external_interface_conduit0;
	output	[6:0]	avalon_displays7seg_0_external_interface_conduit2;
	output	[6:0]	avalon_displays7seg_0_external_interface_conduit3;
	output	[6:0]	avalon_displays7seg_0_external_interface_conduit4;
	output	[6:0]	avalon_displays7seg_0_external_interface_conduit5;
	output	[6:0]	avalon_displays7seg_0_external_interface_conduit6;
	output	[6:0]	avalon_displays7seg_0_external_interface_conduit7;
	input		avalonmasteruart_0_rs232_rx;
	output		avalonmasteruart_0_rs232_tx;
	input		clk_clk;
	input		reset_reset_n;
endmodule
