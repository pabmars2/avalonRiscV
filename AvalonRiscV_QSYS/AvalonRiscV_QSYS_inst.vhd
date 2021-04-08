	component AvalonRiscV_QSYS is
		port (
			clk_clk                : in  std_logic := 'X'; -- clk
			masteruart_rs232_rx_rx : in  std_logic := 'X'; -- rx
			masteruart_rs232_tx_tx : out std_logic;        -- tx
			reset_reset_n          : in  std_logic := 'X'  -- reset_n
		);
	end component AvalonRiscV_QSYS;

	u0 : component AvalonRiscV_QSYS
		port map (
			clk_clk                => CONNECTED_TO_clk_clk,                --                 clk.clk
			masteruart_rs232_rx_rx => CONNECTED_TO_masteruart_rs232_rx_rx, -- masteruart_rs232_rx.rx
			masteruart_rs232_tx_tx => CONNECTED_TO_masteruart_rs232_tx_tx, -- masteruart_rs232_tx.tx
			reset_reset_n          => CONNECTED_TO_reset_reset_n           --               reset.reset_n
		);

