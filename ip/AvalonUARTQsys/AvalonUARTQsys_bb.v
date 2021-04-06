
module AvalonUARTQsys (
	avalon_timer_0_external_interface_conduit,
	avalonmasteruart_0_control_flag_tx,
	avalonmasteruart_0_rs232_rx,
	avalonmasteruart_0_rs232_tx,
	clk_clk,
	reset_reset_n);	

	output		avalon_timer_0_external_interface_conduit;
	input		avalonmasteruart_0_control_flag_tx;
	input		avalonmasteruart_0_rs232_rx;
	output		avalonmasteruart_0_rs232_tx;
	input		clk_clk;
	input		reset_reset_n;
endmodule
