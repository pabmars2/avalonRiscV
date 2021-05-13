
# (C) 2001-2021 Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions and 
# other software and tools, and its AMPP partner logic functions, and 
# any output files any of the foregoing (including device programming 
# or simulation files), and any associated documentation or information 
# are expressly subject to the terms and conditions of the Altera 
# Program License Subscription Agreement, Altera MegaCore Function 
# License Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by Altera 
# or its authorized distributors. Please refer to the applicable 
# agreement for further details.

# ACDS 17.1 590 win32 2021.05.13.13:27:20

# ----------------------------------------
# ncsim - auto-generated simulation script

# ----------------------------------------
# This script provides commands to simulate the following IP detected in
# your Quartus project:
#     AvalonRiscV_QSYS_tb
# 
# Altera recommends that you source this Quartus-generated IP simulation
# script from your own customized top-level script, and avoid editing this
# generated script.
# 
# To write a top-level shell script that compiles Altera simulation libraries
# and the Quartus-generated IP in your project, along with your design and
# testbench files, copy the text from the TOP-LEVEL TEMPLATE section below
# into a new file, e.g. named "ncsim.sh", and modify text as directed.
# 
# You can also modify the simulation flow to suit your needs. Set the
# following variables to 1 to disable their corresponding processes:
# - SKIP_FILE_COPY: skip copying ROM/RAM initialization files
# - SKIP_DEV_COM: skip compiling the Quartus EDA simulation library
# - SKIP_COM: skip compiling Quartus-generated IP simulation files
# - SKIP_ELAB and SKIP_SIM: skip elaboration and simulation
# 
# ----------------------------------------
# # TOP-LEVEL TEMPLATE - BEGIN
# #
# # QSYS_SIMDIR is used in the Quartus-generated IP simulation script to
# # construct paths to the files required to simulate the IP in your Quartus
# # project. By default, the IP script assumes that you are launching the
# # simulator from the IP script location. If launching from another
# # location, set QSYS_SIMDIR to the output directory you specified when you
# # generated the IP script, relative to the directory from which you launch
# # the simulator. In this case, you must also copy the generated files
# # "cds.lib" and "hdl.var" - plus the directory "cds_libs" if generated - 
# # into the location from which you launch the simulator, or incorporate
# # into any existing library setup.
# #
# # Run Quartus-generated IP simulation script once to compile Quartus EDA
# # simulation libraries and Quartus-generated IP simulation files, and copy
# # any ROM/RAM initialization files to the simulation directory.
# # - If necessary, specify any compilation options:
# #   USER_DEFINED_COMPILE_OPTIONS
# #   USER_DEFINED_VHDL_COMPILE_OPTIONS applied to vhdl compiler
# #   USER_DEFINED_VERILOG_COMPILE_OPTIONS applied to verilog compiler
# #
# source <script generation output directory>/cadence/ncsim_setup.sh \
# SKIP_ELAB=1 \
# SKIP_SIM=1 \
# USER_DEFINED_COMPILE_OPTIONS=<compilation options for your design> \
# USER_DEFINED_VHDL_COMPILE_OPTIONS=<VHDL compilation options for your design> \
# USER_DEFINED_VERILOG_COMPILE_OPTIONS=<Verilog compilation options for your design> \
# QSYS_SIMDIR=<script generation output directory>
# #
# # Compile all design files and testbench files, including the top level.
# # (These are all the files required for simulation other than the files
# # compiled by the IP script)
# #
# ncvlog <compilation options> <design and testbench files>
# #
# # TOP_LEVEL_NAME is used in this script to set the top-level simulation or
# # testbench module/entity name.
# #
# # Run the IP script again to elaborate and simulate the top level:
# # - Specify TOP_LEVEL_NAME and USER_DEFINED_ELAB_OPTIONS.
# # - Override the default USER_DEFINED_SIM_OPTIONS. For example, to run
# #   until $finish(), set to an empty string: USER_DEFINED_SIM_OPTIONS="".
# #
# source <script generation output directory>/cadence/ncsim_setup.sh \
# SKIP_FILE_COPY=1 \
# SKIP_DEV_COM=1 \
# SKIP_COM=1 \
# TOP_LEVEL_NAME=<simulation top> \
# USER_DEFINED_ELAB_OPTIONS=<elaboration options for your design> \
# USER_DEFINED_SIM_OPTIONS=<simulation options for your design>
# #
# # TOP-LEVEL TEMPLATE - END
# ----------------------------------------
# 
# IP SIMULATION SCRIPT
# ----------------------------------------
# If AvalonRiscV_QSYS_tb is one of several IP cores in your
# Quartus project, you can generate a simulation script
# suitable for inclusion in your top-level simulation
# script by running the following command line:
# 
# ip-setup-simulation --quartus-project=<quartus project>
# 
# ip-setup-simulation will discover the Altera IP
# within the Quartus project, and generate a unified
# script which supports all the Altera IP within the design.
# ----------------------------------------
# ACDS 17.1 590 win32 2021.05.13.13:27:20
# ----------------------------------------
# initialize variables
TOP_LEVEL_NAME="AvalonRiscV_QSYS_tb"
QSYS_SIMDIR="./../"
QUARTUS_INSTALL_DIR="C:/intelfpga_lite/17.1/quartus/"
SKIP_FILE_COPY=0
SKIP_DEV_COM=0
SKIP_COM=0
SKIP_ELAB=0
SKIP_SIM=0
USER_DEFINED_ELAB_OPTIONS=""
USER_DEFINED_SIM_OPTIONS="-input \"@run 100; exit\""

# ----------------------------------------
# overwrite variables - DO NOT MODIFY!
# This block evaluates each command line argument, typically used for 
# overwriting variables. An example usage:
#   sh <simulator>_setup.sh SKIP_SIM=1
for expression in "$@"; do
  eval $expression
  if [ $? -ne 0 ]; then
    echo "Error: This command line argument, \"$expression\", is/has an invalid expression." >&2
    exit $?
  fi
done

# ----------------------------------------
# initialize simulation properties - DO NOT MODIFY!
ELAB_OPTIONS=""
SIM_OPTIONS=""
if [[ `ncsim -version` != *"ncsim(64)"* ]]; then
  :
else
  :
fi

# ----------------------------------------
# create compilation libraries
mkdir -p ./libraries/work/
mkdir -p ./libraries/altera_common_sv_packages/
mkdir -p ./libraries/RISC_V_AVALON_0_debug_translator/
mkdir -p ./libraries/MasterUART_avalon_master_translator/
mkdir -p ./libraries/rst_controller/
mkdir -p ./libraries/mm_interconnect_2/
mkdir -p ./libraries/mm_interconnect_1/
mkdir -p ./libraries/mm_interconnect_0/
mkdir -p ./libraries/instruccionMemory/
mkdir -p ./libraries/externalMemory/
mkdir -p ./libraries/RISC_V_AVALON_0/
mkdir -p ./libraries/MasterUART/
mkdir -p ./libraries/AvalonRiscV_QSYS_inst_reset_bfm/
mkdir -p ./libraries/AvalonRiscV_QSYS_inst_masteruart_rs232_tx_bfm/
mkdir -p ./libraries/AvalonRiscV_QSYS_inst_masteruart_rs232_rx_bfm/
mkdir -p ./libraries/AvalonRiscV_QSYS_inst_clk_bfm/
mkdir -p ./libraries/AvalonRiscV_QSYS_inst/
mkdir -p ./libraries/altera_ver/
mkdir -p ./libraries/lpm_ver/
mkdir -p ./libraries/sgate_ver/
mkdir -p ./libraries/altera_mf_ver/
mkdir -p ./libraries/altera_lnsim_ver/
mkdir -p ./libraries/cycloneive_ver/

# ----------------------------------------
# copy RAM/ROM files to simulation directory
if [ $SKIP_FILE_COPY -eq 0 ]; then
  cp -f $QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/AvalonRiscV_QSYS_instruccionMemory.hex ./
  cp -f $QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/AvalonRiscV_QSYS_externalMemory.hex ./
fi

# ----------------------------------------
# compile device library files
if [ $SKIP_DEV_COM -eq 0 ]; then
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v" -work altera_ver      
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v"          -work lpm_ver         
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v"             -work sgate_ver       
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v"         -work altera_mf_ver   
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"     -work altera_lnsim_ver
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cycloneive_atoms.v"  -work cycloneive_ver  
fi

# ----------------------------------------
# compile design files in correct order
if [ $SKIP_COM -eq 0 ]; then
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/verbosity_pkg.sv"                     -work altera_common_sv_packages                     -cdslib ./cds_libs/altera_common_sv_packages.cds.lib                    
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/altera_merlin_slave_translator.sv"    -work RISC_V_AVALON_0_debug_translator              -cdslib ./cds_libs/RISC_V_AVALON_0_debug_translator.cds.lib             
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/altera_merlin_master_translator.sv"   -work MasterUART_avalon_master_translator           -cdslib ./cds_libs/MasterUART_avalon_master_translator.cds.lib          
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/altera_reset_controller.v"            -work rst_controller                                -cdslib ./cds_libs/rst_controller.cds.lib                               
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/altera_reset_synchronizer.v"          -work rst_controller                                -cdslib ./cds_libs/rst_controller.cds.lib                               
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/AvalonRiscV_QSYS_mm_interconnect_2.v" -work mm_interconnect_2                             -cdslib ./cds_libs/mm_interconnect_2.cds.lib                            
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/AvalonRiscV_QSYS_mm_interconnect_1.v" -work mm_interconnect_1                             -cdslib ./cds_libs/mm_interconnect_1.cds.lib                            
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/AvalonRiscV_QSYS_mm_interconnect_0.v" -work mm_interconnect_0                             -cdslib ./cds_libs/mm_interconnect_0.cds.lib                            
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/AvalonRiscV_QSYS_instruccionMemory.v" -work instruccionMemory                             -cdslib ./cds_libs/instruccionMemory.cds.lib                            
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/AvalonRiscV_QSYS_externalMemory.v"    -work externalMemory                                -cdslib ./cds_libs/externalMemory.cds.lib                               
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/top_Avalon.sv"                        -work RISC_V_AVALON_0                               -cdslib ./cds_libs/RISC_V_AVALON_0.cds.lib                              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/ALU.sv"                               -work RISC_V_AVALON_0                               -cdslib ./cds_libs/RISC_V_AVALON_0.cds.lib                              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/ALUControl.sv"                        -work RISC_V_AVALON_0                               -cdslib ./cds_libs/RISC_V_AVALON_0.cds.lib                              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/FUnit.sv"                             -work RISC_V_AVALON_0                               -cdslib ./cds_libs/RISC_V_AVALON_0.cds.lib                              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/HazardDet.sv"                         -work RISC_V_AVALON_0                               -cdslib ./cds_libs/RISC_V_AVALON_0.cds.lib                              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/ImmGen.sv"                            -work RISC_V_AVALON_0                               -cdslib ./cds_libs/RISC_V_AVALON_0.cds.lib                              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/MUX.sv"                               -work RISC_V_AVALON_0                               -cdslib ./cds_libs/RISC_V_AVALON_0.cds.lib                              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/MUX3.sv"                              -work RISC_V_AVALON_0                               -cdslib ./cds_libs/RISC_V_AVALON_0.cds.lib                              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/MUX9b.sv"                             -work RISC_V_AVALON_0                               -cdslib ./cds_libs/RISC_V_AVALON_0.cds.lib                              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/adder.sv"                             -work RISC_V_AVALON_0                               -cdslib ./cds_libs/RISC_V_AVALON_0.cds.lib                              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/avalon_mm_master.sv"                  -work RISC_V_AVALON_0                               -cdslib ./cds_libs/RISC_V_AVALON_0.cds.lib                              
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/avalon_slave_MM_interface.v"          -work RISC_V_AVALON_0                               -cdslib ./cds_libs/RISC_V_AVALON_0.cds.lib                              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/control.sv"                           -work RISC_V_AVALON_0                               -cdslib ./cds_libs/RISC_V_AVALON_0.cds.lib                              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/debugMode.sv"                         -work RISC_V_AVALON_0                               -cdslib ./cds_libs/RISC_V_AVALON_0.cds.lib                              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/memoryControl.sv"                     -work RISC_V_AVALON_0                               -cdslib ./cds_libs/RISC_V_AVALON_0.cds.lib                              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/regEX_MEM.sv"                         -work RISC_V_AVALON_0                               -cdslib ./cds_libs/RISC_V_AVALON_0.cds.lib                              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/regID_EX.sv"                          -work RISC_V_AVALON_0                               -cdslib ./cds_libs/RISC_V_AVALON_0.cds.lib                              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/regIF_ID.sv"                          -work RISC_V_AVALON_0                               -cdslib ./cds_libs/RISC_V_AVALON_0.cds.lib                              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/regMEM_WB.sv"                         -work RISC_V_AVALON_0                               -cdslib ./cds_libs/RISC_V_AVALON_0.cds.lib                              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/regPC.sv"                             -work RISC_V_AVALON_0                               -cdslib ./cds_libs/RISC_V_AVALON_0.cds.lib                              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/registers.sv"                         -work RISC_V_AVALON_0                               -cdslib ./cds_libs/RISC_V_AVALON_0.cds.lib                              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/top.sv"                               -work RISC_V_AVALON_0                               -cdslib ./cds_libs/RISC_V_AVALON_0.cds.lib                              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/interconexLogic.sv"                   -work RISC_V_AVALON_0                               -cdslib ./cds_libs/RISC_V_AVALON_0.cds.lib                              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/readControl.sv"                       -work RISC_V_AVALON_0                               -cdslib ./cds_libs/RISC_V_AVALON_0.cds.lib                              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/avalon_UART.sv"                       -work MasterUART                                    -cdslib ./cds_libs/MasterUART.cds.lib                                   
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/UART.sv"                              -work MasterUART                                    -cdslib ./cds_libs/MasterUART.cds.lib                                   
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/avalon_mm_master.sv"                  -work MasterUART                                    -cdslib ./cds_libs/MasterUART.cds.lib                                   
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/uart_rx.sv"                           -work MasterUART                                    -cdslib ./cds_libs/MasterUART.cds.lib                                   
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/uart_tx.sv"                           -work MasterUART                                    -cdslib ./cds_libs/MasterUART.cds.lib                                   
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/altera_avalon_reset_source.sv"        -work AvalonRiscV_QSYS_inst_reset_bfm               -cdslib ./cds_libs/AvalonRiscV_QSYS_inst_reset_bfm.cds.lib              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/altera_conduit_bfm_0002.sv"           -work AvalonRiscV_QSYS_inst_masteruart_rs232_tx_bfm -cdslib ./cds_libs/AvalonRiscV_QSYS_inst_masteruart_rs232_tx_bfm.cds.lib
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/altera_conduit_bfm.sv"                -work AvalonRiscV_QSYS_inst_masteruart_rs232_rx_bfm -cdslib ./cds_libs/AvalonRiscV_QSYS_inst_masteruart_rs232_rx_bfm.cds.lib
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/altera_avalon_clock_source.sv"        -work AvalonRiscV_QSYS_inst_clk_bfm                 -cdslib ./cds_libs/AvalonRiscV_QSYS_inst_clk_bfm.cds.lib                
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/AvalonRiscV_QSYS.v"                   -work AvalonRiscV_QSYS_inst                         -cdslib ./cds_libs/AvalonRiscV_QSYS_inst.cds.lib                        
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/AvalonRiscV_QSYS_tb.v"                                                                                                                                                       
fi

# ----------------------------------------
# elaborate top level design
if [ $SKIP_ELAB -eq 0 ]; then
  export GENERIC_PARAM_COMPAT_CHECK=1
  ncelab -access +w+r+c -namemap_mixgen $ELAB_OPTIONS $USER_DEFINED_ELAB_OPTIONS $TOP_LEVEL_NAME
fi

# ----------------------------------------
# simulate
if [ $SKIP_SIM -eq 0 ]; then
  eval ncsim -licqueue $SIM_OPTIONS $USER_DEFINED_SIM_OPTIONS $TOP_LEVEL_NAME
fi
