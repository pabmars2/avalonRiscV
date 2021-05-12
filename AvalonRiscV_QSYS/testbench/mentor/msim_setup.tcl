
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

# ----------------------------------------
# Auto-generated simulation script msim_setup.tcl
# ----------------------------------------
# This script provides commands to simulate the following IP detected in
# your Quartus project:
#     AvalonRiscV_QSYS_tb
# 
# Altera recommends that you source this Quartus-generated IP simulation
# script from your own customized top-level script, and avoid editing this
# generated script.
# 
# To write a top-level script that compiles Altera simulation libraries and
# the Quartus-generated IP in your project, along with your design and
# testbench files, copy the text from the TOP-LEVEL TEMPLATE section below
# into a new file, e.g. named "mentor.do", and modify the text as directed.
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
# # the simulator.
# #
# set QSYS_SIMDIR <script generation output directory>
# #
# # Source the generated IP simulation script.
# source $QSYS_SIMDIR/mentor/msim_setup.tcl
# #
# # Set any compilation options you require (this is unusual).
# set USER_DEFINED_COMPILE_OPTIONS <compilation options>
# set USER_DEFINED_VHDL_COMPILE_OPTIONS <compilation options for VHDL>
# set USER_DEFINED_VERILOG_COMPILE_OPTIONS <compilation options for Verilog>
# #
# # Call command to compile the Quartus EDA simulation library.
# dev_com
# #
# # Call command to compile the Quartus-generated IP simulation files.
# com
# #
# # Add commands to compile all design files and testbench files, including
# # the top level. (These are all the files required for simulation other
# # than the files compiled by the Quartus-generated IP simulation script)
# #
# vlog <compilation options> <design and testbench files>
# #
# # Set the top-level simulation or testbench module/entity name, which is
# # used by the elab command to elaborate the top level.
# #
# set TOP_LEVEL_NAME <simulation top>
# #
# # Set any elaboration options you require.
# set USER_DEFINED_ELAB_OPTIONS <elaboration options>
# #
# # Call command to elaborate your design and testbench.
# elab
# #
# # Run the simulation.
# run -a
# #
# # Report success to the shell.
# exit -code 0
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
# ACDS 17.1 590 win32 2021.05.12.13:44:16

# ----------------------------------------
# Initialize variables
if ![info exists SYSTEM_INSTANCE_NAME] { 
  set SYSTEM_INSTANCE_NAME ""
} elseif { ![ string match "" $SYSTEM_INSTANCE_NAME ] } { 
  set SYSTEM_INSTANCE_NAME "/$SYSTEM_INSTANCE_NAME"
}

if ![info exists TOP_LEVEL_NAME] { 
  set TOP_LEVEL_NAME "AvalonRiscV_QSYS_tb"
}

if ![info exists QSYS_SIMDIR] { 
  set QSYS_SIMDIR "./../"
}

if ![info exists QUARTUS_INSTALL_DIR] { 
  set QUARTUS_INSTALL_DIR "C:/intelfpga_lite/17.1/quartus/"
}

if ![info exists USER_DEFINED_COMPILE_OPTIONS] { 
  set USER_DEFINED_COMPILE_OPTIONS ""
}
if ![info exists USER_DEFINED_VHDL_COMPILE_OPTIONS] { 
  set USER_DEFINED_VHDL_COMPILE_OPTIONS ""
}
if ![info exists USER_DEFINED_VERILOG_COMPILE_OPTIONS] { 
  set USER_DEFINED_VERILOG_COMPILE_OPTIONS ""
}
if ![info exists USER_DEFINED_ELAB_OPTIONS] { 
  set USER_DEFINED_ELAB_OPTIONS ""
}

# ----------------------------------------
# Initialize simulation properties - DO NOT MODIFY!
set ELAB_OPTIONS ""
set SIM_OPTIONS ""
if ![ string match "*-64 vsim*" [ vsim -version ] ] {
} else {
}

# ----------------------------------------
# Copy ROM/RAM files to simulation directory
alias file_copy {
  echo "\[exec\] file_copy"
  file copy -force $QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/AvalonRiscV_QSYS_instruccionMemory.hex ./
  file copy -force $QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/AvalonRiscV_QSYS_externalMemory.hex ./
}

# ----------------------------------------
# Create compilation libraries
proc ensure_lib { lib } { if ![file isdirectory $lib] { vlib $lib } }
ensure_lib          ./libraries/     
ensure_lib          ./libraries/work/
vmap       work     ./libraries/work/
vmap       work_lib ./libraries/work/
if ![ string match "*ModelSim ALTERA*" [ vsim -version ] ] {
  ensure_lib                  ./libraries/altera_ver/      
  vmap       altera_ver       ./libraries/altera_ver/      
  ensure_lib                  ./libraries/lpm_ver/         
  vmap       lpm_ver          ./libraries/lpm_ver/         
  ensure_lib                  ./libraries/sgate_ver/       
  vmap       sgate_ver        ./libraries/sgate_ver/       
  ensure_lib                  ./libraries/altera_mf_ver/   
  vmap       altera_mf_ver    ./libraries/altera_mf_ver/   
  ensure_lib                  ./libraries/altera_lnsim_ver/
  vmap       altera_lnsim_ver ./libraries/altera_lnsim_ver/
  ensure_lib                  ./libraries/cycloneive_ver/  
  vmap       cycloneive_ver   ./libraries/cycloneive_ver/  
}
ensure_lib                                               ./libraries/altera_common_sv_packages/                    
vmap       altera_common_sv_packages                     ./libraries/altera_common_sv_packages/                    
ensure_lib                                               ./libraries/RISC_V_AVALON_0_debug_translator/             
vmap       RISC_V_AVALON_0_debug_translator              ./libraries/RISC_V_AVALON_0_debug_translator/             
ensure_lib                                               ./libraries/MasterUART_avalon_master_translator/          
vmap       MasterUART_avalon_master_translator           ./libraries/MasterUART_avalon_master_translator/          
ensure_lib                                               ./libraries/rst_controller/                               
vmap       rst_controller                                ./libraries/rst_controller/                               
ensure_lib                                               ./libraries/mm_interconnect_2/                            
vmap       mm_interconnect_2                             ./libraries/mm_interconnect_2/                            
ensure_lib                                               ./libraries/mm_interconnect_1/                            
vmap       mm_interconnect_1                             ./libraries/mm_interconnect_1/                            
ensure_lib                                               ./libraries/mm_interconnect_0/                            
vmap       mm_interconnect_0                             ./libraries/mm_interconnect_0/                            
ensure_lib                                               ./libraries/instruccionMemory/                            
vmap       instruccionMemory                             ./libraries/instruccionMemory/                            
ensure_lib                                               ./libraries/externalMemory/                               
vmap       externalMemory                                ./libraries/externalMemory/                               
ensure_lib                                               ./libraries/RISC_V_AVALON_0/                              
vmap       RISC_V_AVALON_0                               ./libraries/RISC_V_AVALON_0/                              
ensure_lib                                               ./libraries/MasterUART/                                   
vmap       MasterUART                                    ./libraries/MasterUART/                                   
ensure_lib                                               ./libraries/AvalonRiscV_QSYS_inst_reset_bfm/              
vmap       AvalonRiscV_QSYS_inst_reset_bfm               ./libraries/AvalonRiscV_QSYS_inst_reset_bfm/              
ensure_lib                                               ./libraries/AvalonRiscV_QSYS_inst_masteruart_rs232_tx_bfm/
vmap       AvalonRiscV_QSYS_inst_masteruart_rs232_tx_bfm ./libraries/AvalonRiscV_QSYS_inst_masteruart_rs232_tx_bfm/
ensure_lib                                               ./libraries/AvalonRiscV_QSYS_inst_masteruart_rs232_rx_bfm/
vmap       AvalonRiscV_QSYS_inst_masteruart_rs232_rx_bfm ./libraries/AvalonRiscV_QSYS_inst_masteruart_rs232_rx_bfm/
ensure_lib                                               ./libraries/AvalonRiscV_QSYS_inst_clk_bfm/                
vmap       AvalonRiscV_QSYS_inst_clk_bfm                 ./libraries/AvalonRiscV_QSYS_inst_clk_bfm/                
ensure_lib                                               ./libraries/AvalonRiscV_QSYS_inst/                        
vmap       AvalonRiscV_QSYS_inst                         ./libraries/AvalonRiscV_QSYS_inst/                        

# ----------------------------------------
# Compile device library files
alias dev_com {
  echo "\[exec\] dev_com"
  if ![ string match "*ModelSim ALTERA*" [ vsim -version ] ] {
    eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v" -work altera_ver      
    eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v"          -work lpm_ver         
    eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v"             -work sgate_ver       
    eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v"         -work altera_mf_ver   
    eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"     -work altera_lnsim_ver
    eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cycloneive_atoms.v"  -work cycloneive_ver  
  }
}

# ----------------------------------------
# Compile the design files in correct order
alias com {
  echo "\[exec\] com"
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/verbosity_pkg.sv"                                                  -work altera_common_sv_packages                    
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/altera_merlin_slave_translator.sv"    -L altera_common_sv_packages -work RISC_V_AVALON_0_debug_translator             
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/altera_merlin_master_translator.sv"   -L altera_common_sv_packages -work MasterUART_avalon_master_translator          
  eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/altera_reset_controller.v"                                         -work rst_controller                               
  eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/altera_reset_synchronizer.v"                                       -work rst_controller                               
  eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/AvalonRiscV_QSYS_mm_interconnect_2.v"                              -work mm_interconnect_2                            
  eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/AvalonRiscV_QSYS_mm_interconnect_1.v"                              -work mm_interconnect_1                            
  eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/AvalonRiscV_QSYS_mm_interconnect_0.v"                              -work mm_interconnect_0                            
  eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/AvalonRiscV_QSYS_instruccionMemory.v"                              -work instruccionMemory                            
  eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/AvalonRiscV_QSYS_externalMemory.v"                                 -work externalMemory                               
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/top_Avalon.sv"                        -L altera_common_sv_packages -work RISC_V_AVALON_0                              
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/ALU.sv"                               -L altera_common_sv_packages -work RISC_V_AVALON_0                              
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/ALUControl.sv"                        -L altera_common_sv_packages -work RISC_V_AVALON_0                              
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/FUnit.sv"                             -L altera_common_sv_packages -work RISC_V_AVALON_0                              
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/HazardDet.sv"                         -L altera_common_sv_packages -work RISC_V_AVALON_0                              
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/ImmGen.sv"                            -L altera_common_sv_packages -work RISC_V_AVALON_0                              
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/MUX.sv"                               -L altera_common_sv_packages -work RISC_V_AVALON_0                              
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/MUX3.sv"                              -L altera_common_sv_packages -work RISC_V_AVALON_0                              
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/MUX9b.sv"                             -L altera_common_sv_packages -work RISC_V_AVALON_0                              
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/adder.sv"                             -L altera_common_sv_packages -work RISC_V_AVALON_0                              
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/avalon_mm_master.sv"                  -L altera_common_sv_packages -work RISC_V_AVALON_0                              
  eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/avalon_slave_MM_interface.v"                                       -work RISC_V_AVALON_0                              
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/control.sv"                           -L altera_common_sv_packages -work RISC_V_AVALON_0                              
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/debugMode.sv"                         -L altera_common_sv_packages -work RISC_V_AVALON_0                              
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/memoryControl.sv"                     -L altera_common_sv_packages -work RISC_V_AVALON_0                              
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/regEX_MEM.sv"                         -L altera_common_sv_packages -work RISC_V_AVALON_0                              
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/regID_EX.sv"                          -L altera_common_sv_packages -work RISC_V_AVALON_0                              
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/regIF_ID.sv"                          -L altera_common_sv_packages -work RISC_V_AVALON_0                              
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/regMEM_WB.sv"                         -L altera_common_sv_packages -work RISC_V_AVALON_0                              
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/regPC.sv"                             -L altera_common_sv_packages -work RISC_V_AVALON_0                              
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/registers.sv"                         -L altera_common_sv_packages -work RISC_V_AVALON_0                              
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/top.sv"                               -L altera_common_sv_packages -work RISC_V_AVALON_0                              
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/interconexLogic.sv"                   -L altera_common_sv_packages -work RISC_V_AVALON_0                              
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/readControl.sv"                       -L altera_common_sv_packages -work RISC_V_AVALON_0                              
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/avalon_UART.sv"                       -L altera_common_sv_packages -work MasterUART                                   
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/UART.sv"                              -L altera_common_sv_packages -work MasterUART                                   
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/avalon_mm_master.sv"                  -L altera_common_sv_packages -work MasterUART                                   
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/uart_rx.sv"                           -L altera_common_sv_packages -work MasterUART                                   
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/uart_tx.sv"                           -L altera_common_sv_packages -work MasterUART                                   
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/altera_avalon_reset_source.sv"        -L altera_common_sv_packages -work AvalonRiscV_QSYS_inst_reset_bfm              
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/altera_conduit_bfm_0002.sv"           -L altera_common_sv_packages -work AvalonRiscV_QSYS_inst_masteruart_rs232_tx_bfm
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/altera_conduit_bfm.sv"                -L altera_common_sv_packages -work AvalonRiscV_QSYS_inst_masteruart_rs232_rx_bfm
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/altera_avalon_clock_source.sv"        -L altera_common_sv_packages -work AvalonRiscV_QSYS_inst_clk_bfm                
  eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/AvalonRiscV_QSYS.v"                                                -work AvalonRiscV_QSYS_inst                        
  eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/AvalonRiscV_QSYS_tb.v"                                                                                                           
}

# ----------------------------------------
# Elaborate top level design
alias elab {
  echo "\[exec\] elab"
  eval vsim -t ps $ELAB_OPTIONS $USER_DEFINED_ELAB_OPTIONS -L work -L work_lib -L altera_common_sv_packages -L RISC_V_AVALON_0_debug_translator -L MasterUART_avalon_master_translator -L rst_controller -L mm_interconnect_2 -L mm_interconnect_1 -L mm_interconnect_0 -L instruccionMemory -L externalMemory -L RISC_V_AVALON_0 -L MasterUART -L AvalonRiscV_QSYS_inst_reset_bfm -L AvalonRiscV_QSYS_inst_masteruart_rs232_tx_bfm -L AvalonRiscV_QSYS_inst_masteruart_rs232_rx_bfm -L AvalonRiscV_QSYS_inst_clk_bfm -L AvalonRiscV_QSYS_inst -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver $TOP_LEVEL_NAME
}

# ----------------------------------------
# Elaborate the top level design with novopt option
alias elab_debug {
  echo "\[exec\] elab_debug"
  eval vsim -novopt -t ps $ELAB_OPTIONS $USER_DEFINED_ELAB_OPTIONS -L work -L work_lib -L altera_common_sv_packages -L RISC_V_AVALON_0_debug_translator -L MasterUART_avalon_master_translator -L rst_controller -L mm_interconnect_2 -L mm_interconnect_1 -L mm_interconnect_0 -L instruccionMemory -L externalMemory -L RISC_V_AVALON_0 -L MasterUART -L AvalonRiscV_QSYS_inst_reset_bfm -L AvalonRiscV_QSYS_inst_masteruart_rs232_tx_bfm -L AvalonRiscV_QSYS_inst_masteruart_rs232_rx_bfm -L AvalonRiscV_QSYS_inst_clk_bfm -L AvalonRiscV_QSYS_inst -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver $TOP_LEVEL_NAME
}

# ----------------------------------------
# Compile all the design files and elaborate the top level design
alias ld "
  dev_com
  com
  elab
"

# ----------------------------------------
# Compile all the design files and elaborate the top level design with -novopt
alias ld_debug "
  dev_com
  com
  elab_debug
"

# ----------------------------------------
# Print out user commmand line aliases
alias h {
  echo "List Of Command Line Aliases"
  echo
  echo "file_copy                                         -- Copy ROM/RAM files to simulation directory"
  echo
  echo "dev_com                                           -- Compile device library files"
  echo
  echo "com                                               -- Compile the design files in correct order"
  echo
  echo "elab                                              -- Elaborate top level design"
  echo
  echo "elab_debug                                        -- Elaborate the top level design with novopt option"
  echo
  echo "ld                                                -- Compile all the design files and elaborate the top level design"
  echo
  echo "ld_debug                                          -- Compile all the design files and elaborate the top level design with -novopt"
  echo
  echo 
  echo
  echo "List Of Variables"
  echo
  echo "TOP_LEVEL_NAME                                    -- Top level module name."
  echo "                                                     For most designs, this should be overridden"
  echo "                                                     to enable the elab/elab_debug aliases."
  echo
  echo "SYSTEM_INSTANCE_NAME                              -- Instantiated system module name inside top level module."
  echo
  echo "QSYS_SIMDIR                                       -- Platform Designer base simulation directory."
  echo
  echo "QUARTUS_INSTALL_DIR                               -- Quartus installation directory."
  echo
  echo "USER_DEFINED_COMPILE_OPTIONS                      -- User-defined compile options, added to com/dev_com aliases."
  echo
  echo "USER_DEFINED_ELAB_OPTIONS                         -- User-defined elaboration options, added to elab/elab_debug aliases."
  echo
  echo "USER_DEFINED_VHDL_COMPILE_OPTIONS                 -- User-defined vhdl compile options, added to com/dev_com aliases."
  echo
  echo "USER_DEFINED_VERILOG_COMPILE_OPTIONS              -- User-defined verilog compile options, added to com/dev_com aliases."
}
file_copy
h
