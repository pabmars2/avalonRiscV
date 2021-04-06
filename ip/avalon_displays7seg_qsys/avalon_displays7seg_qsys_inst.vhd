	component avalon_displays7seg_qsys is
		port (
			clk_clk                                           : in  std_logic                    := 'X'; -- clk
			reset_reset_n                                     : in  std_logic                    := 'X'; -- reset_n
			avalon_displays7seg_0_external_interface_conduit1 : out std_logic_vector(6 downto 0);        -- conduit1
			avalon_displays7seg_0_external_interface_conduit0 : out std_logic_vector(6 downto 0);        -- conduit0
			avalon_displays7seg_0_external_interface_conduit2 : out std_logic_vector(6 downto 0);        -- conduit2
			avalon_displays7seg_0_external_interface_conduit3 : out std_logic_vector(6 downto 0);        -- conduit3
			avalon_displays7seg_0_external_interface_conduit4 : out std_logic_vector(6 downto 0);        -- conduit4
			avalon_displays7seg_0_external_interface_conduit5 : out std_logic_vector(6 downto 0);        -- conduit5
			avalon_displays7seg_0_external_interface_conduit6 : out std_logic_vector(6 downto 0);        -- conduit6
			avalon_displays7seg_0_external_interface_conduit7 : out std_logic_vector(6 downto 0)         -- conduit7
		);
	end component avalon_displays7seg_qsys;

	u0 : component avalon_displays7seg_qsys
		port map (
			clk_clk                                           => CONNECTED_TO_clk_clk,                                           --                                      clk.clk
			reset_reset_n                                     => CONNECTED_TO_reset_reset_n,                                     --                                    reset.reset_n
			avalon_displays7seg_0_external_interface_conduit1 => CONNECTED_TO_avalon_displays7seg_0_external_interface_conduit1, -- avalon_displays7seg_0_external_interface.conduit1
			avalon_displays7seg_0_external_interface_conduit0 => CONNECTED_TO_avalon_displays7seg_0_external_interface_conduit0, --                                         .conduit0
			avalon_displays7seg_0_external_interface_conduit2 => CONNECTED_TO_avalon_displays7seg_0_external_interface_conduit2, --                                         .conduit2
			avalon_displays7seg_0_external_interface_conduit3 => CONNECTED_TO_avalon_displays7seg_0_external_interface_conduit3, --                                         .conduit3
			avalon_displays7seg_0_external_interface_conduit4 => CONNECTED_TO_avalon_displays7seg_0_external_interface_conduit4, --                                         .conduit4
			avalon_displays7seg_0_external_interface_conduit5 => CONNECTED_TO_avalon_displays7seg_0_external_interface_conduit5, --                                         .conduit5
			avalon_displays7seg_0_external_interface_conduit6 => CONNECTED_TO_avalon_displays7seg_0_external_interface_conduit6, --                                         .conduit6
			avalon_displays7seg_0_external_interface_conduit7 => CONNECTED_TO_avalon_displays7seg_0_external_interface_conduit7  --                                         .conduit7
		);

