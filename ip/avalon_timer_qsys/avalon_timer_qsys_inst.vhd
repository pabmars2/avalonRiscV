	component avalon_timer_qsys is
		port (
			clk_clk                                   : in  std_logic := 'X'; -- clk
			reset_reset_n                             : in  std_logic := 'X'; -- reset_n
			avalon_timer_0_external_interface_conduit : out std_logic         -- conduit
		);
	end component avalon_timer_qsys;

	u0 : component avalon_timer_qsys
		port map (
			clk_clk                                   => CONNECTED_TO_clk_clk,                                   --                               clk.clk
			reset_reset_n                             => CONNECTED_TO_reset_reset_n,                             --                             reset.reset_n
			avalon_timer_0_external_interface_conduit => CONNECTED_TO_avalon_timer_0_external_interface_conduit  -- avalon_timer_0_external_interface.conduit
		);

