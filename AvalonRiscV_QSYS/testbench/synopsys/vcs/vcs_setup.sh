
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

# ACDS 17.1 590 win32 2021.07.02.16:26:35

# ----------------------------------------
# vcs - auto-generated simulation script

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
# testbench files, follow the guidelines below.
# 
# 1) Copy the shell script text from the TOP-LEVEL TEMPLATE section
# below into a new file, e.g. named "vcs_sim.sh".
# 
# 2) Copy the text from the DESIGN FILE LIST & OPTIONS TEMPLATE section into
# a separate file, e.g. named "filelist.f".
# 
# ----------------------------------------
# # TOP-LEVEL TEMPLATE - BEGIN
# #
# # TOP_LEVEL_NAME is used in the Quartus-generated IP simulation script to
# # set the top-level simulation or testbench module/entity name.
# #
# # QSYS_SIMDIR is used in the Quartus-generated IP simulation script to
# # construct paths to the files required to simulate the IP in your Quartus
# # project. By default, the IP script assumes that you are launching the
# # simulator from the IP script location. If launching from another
# # location, set QSYS_SIMDIR to the output directory you specified when you
# # generated the IP script, relative to the directory from which you launch
# # the simulator.
# #
# # Source the Quartus-generated IP simulation script and do the following:
# # - Compile the Quartus EDA simulation library and IP simulation files.
# # - Specify TOP_LEVEL_NAME and QSYS_SIMDIR.
# # - Compile the design and top-level simulation module/entity using
# #   information specified in "filelist.f".
# # - Override the default USER_DEFINED_SIM_OPTIONS. For example, to run
# #   until $finish(), set to an empty string: USER_DEFINED_SIM_OPTIONS="".
# # - Run the simulation.
# #
# source <script generation output directory>/synopsys/vcs/vcs_setup.sh \
# TOP_LEVEL_NAME=<simulation top> \
# QSYS_SIMDIR=<script generation output directory> \
# USER_DEFINED_ELAB_OPTIONS="\"-f filelist.f\"" \
# USER_DEFINED_SIM_OPTIONS=<simulation options for your design>
# #
# # TOP-LEVEL TEMPLATE - END
# ----------------------------------------
# 
# ----------------------------------------
# # DESIGN FILE LIST & OPTIONS TEMPLATE - BEGIN
# #
# # Compile all design files and testbench files, including the top level.
# # (These are all the files required for simulation other than the files
# # compiled by the Quartus-generated IP simulation script)
# #
# +systemverilogext+.sv
# <design and testbench files, compile-time options, elaboration options>
# #
# # DESIGN FILE LIST & OPTIONS TEMPLATE - END
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
# ACDS 17.1 590 win32 2021.07.02.16:26:35
# ----------------------------------------
# initialize variables
TOP_LEVEL_NAME="AvalonRiscV_QSYS_tb"
QSYS_SIMDIR="./../../"
QUARTUS_INSTALL_DIR="C:/intelfpga_lite/17.1/quartus/"
SKIP_FILE_COPY=0
SKIP_SIM=0
USER_DEFINED_ELAB_OPTIONS=""
USER_DEFINED_SIM_OPTIONS="+vcs+finish+100"
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
if [[ `vcs -platform` != *"amd64"* ]]; then
  :
else
  :
fi

# ----------------------------------------
# copy RAM/ROM files to simulation directory
if [ $SKIP_FILE_COPY -eq 0 ]; then
  cp -f $QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/AvalonRiscV_QSYS_instruccionMemory.hex ./
  cp -f $QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/AvalonRiscV_QSYS_externalMemory.hex ./
fi

vcs -lca -timescale=1ps/1ps -sverilog +verilog2001ext+.v -ntb_opts dtm $ELAB_OPTIONS $USER_DEFINED_ELAB_OPTIONS \
  -v $QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v \
  -v $QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v \
  -v $QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v \
  -v $QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v \
  $QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv \
  -v $QUARTUS_INSTALL_DIR/eda/sim_lib/cycloneive_atoms.v \
  $QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/verbosity_pkg.sv \
  $QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/altera_merlin_slave_translator.sv \
  $QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/altera_merlin_master_translator.sv \
  $QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/altera_reset_controller.v \
  $QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/altera_reset_synchronizer.v \
  $QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/AvalonRiscV_QSYS_mm_interconnect_2.v \
  $QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/AvalonRiscV_QSYS_mm_interconnect_1.v \
  $QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/AvalonRiscV_QSYS_mm_interconnect_0.v \
  $QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/AvalonRiscV_QSYS_instruccionMemory.v \
  $QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/AvalonRiscV_QSYS_externalMemory.v \
  $QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/top_Avalon.sv \
  $QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/ALU.sv \
  $QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/ALUControl.sv \
  $QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/FUnit.sv \
  $QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/HazardDet.sv \
  $QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/ImmGen.sv \
  $QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/MUX.sv \
  $QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/MUX3.sv \
  $QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/MUX9b.sv \
  $QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/adder.sv \
  $QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/avalon_mm_master.sv \
  $QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/avalon_slave_MM_interface.v \
  $QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/control.sv \
  $QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/debugMode.sv \
  $QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/memoryControl.sv \
  $QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/regEX_MEM.sv \
  $QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/regID_EX.sv \
  $QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/regIF_ID.sv \
  $QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/regMEM_WB.sv \
  $QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/regPC.sv \
  $QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/registers.sv \
  $QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/top.sv \
  $QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/interconexLogic.sv \
  $QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/readControl.sv \
  $QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/controlEnables.sv \
  $QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/avalon_UART.sv \
  $QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/UART.sv \
  $QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/uart_rx.sv \
  $QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/uart_tx.sv \
  $QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/altera_avalon_reset_source.sv \
  $QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/altera_conduit_bfm_0002.sv \
  $QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/altera_conduit_bfm.sv \
  $QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/altera_avalon_clock_source.sv \
  $QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/submodules/AvalonRiscV_QSYS.v \
  $QSYS_SIMDIR/AvalonRiscV_QSYS_tb/simulation/AvalonRiscV_QSYS_tb.v \
  -top $TOP_LEVEL_NAME
# ----------------------------------------
# simulate
if [ $SKIP_SIM -eq 0 ]; then
  ./simv $SIM_OPTIONS $USER_DEFINED_SIM_OPTIONS
fi
