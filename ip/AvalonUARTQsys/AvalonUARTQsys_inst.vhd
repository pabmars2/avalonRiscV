	component AvalonUARTQsys is
		port (
			avalon_timer_0_external_interface_conduit  : out std_logic;        -- conduit
			avalonmasteruart_0_control_flag_tx_flag_tx : in  std_logic := 'X'; -- flag_tx
			avalonmasteruart_0_rs232_rx_rx             : in  std_logic := 'X'; -- rx
			avalonmasteruart_0_rs232_tx_tx             : out std_logic;        -- tx
			clk_clk                                    : in  std_logic := 'X'; -- clk
			reset_reset_n                              : in  std_logic := 'X'  -- reset_n
		);
	end component AvalonUARTQsys;

	u0 : component AvalonUARTQsys
		port map (
			avalon_timer_0_external_interface_conduit  => CONNECTED_TO_avalon_timer_0_external_interface_conduit,  --  avalon_timer_0_external_interface.conduit
			avalonmasteruart_0_control_flag_tx_flag_tx => CONNECTED_TO_avalonmasteruart_0_control_flag_tx_flag_tx, -- avalonmasteruart_0_control_flag_tx.flag_tx
			avalonmasteruart_0_rs232_rx_rx             => CONNECTED_TO_avalonmasteruart_0_rs232_rx_rx,             --        avalonmasteruart_0_rs232_rx.rx
			avalonmasteruart_0_rs232_tx_tx             => CONNECTED_TO_avalonmasteruart_0_rs232_tx_tx,             --        avalonmasteruart_0_rs232_tx.tx
			clk_clk                                    => CONNECTED_TO_clk_clk,                                    --                                clk.clk
			reset_reset_n                              => CONNECTED_TO_reset_reset_n                               --                              reset.reset_n
		);

