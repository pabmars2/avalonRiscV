# TCL File Generated by Component Editor 17.1
# Thu Apr 08 18:11:45 CEST 2021
# DO NOT MODIFY


# 
# RISC_V_AVALON "RISC_V_AVALON" v1.9
#  2021.04.08.18:11:45
# 
# 

# 
# request TCL package from ACDS 16.1
# 
package require -exact qsys 16.1


# 
# module RISC_V_AVALON
# 
set_module_property DESCRIPTION ""
set_module_property NAME RISC_V_AVALON
set_module_property VERSION 1.9
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property GROUP myAvalonIPs
set_module_property AUTHOR ""
set_module_property DISPLAY_NAME RISC_V_AVALON
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL top_Avalon
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file top_Avalon.sv SYSTEM_VERILOG PATH top_Avalon.sv TOP_LEVEL_FILE
add_fileset_file ALU.sv SYSTEM_VERILOG PATH ALU.sv
add_fileset_file ALUControl.sv SYSTEM_VERILOG PATH ALUControl.sv
add_fileset_file FUnit.sv SYSTEM_VERILOG PATH FUnit.sv
add_fileset_file HazardDet.sv SYSTEM_VERILOG PATH HazardDet.sv
add_fileset_file ImmGen.sv SYSTEM_VERILOG PATH ImmGen.sv
add_fileset_file MUX.sv SYSTEM_VERILOG PATH MUX.sv
add_fileset_file MUX3.sv SYSTEM_VERILOG PATH MUX3.sv
add_fileset_file MUX9b.sv SYSTEM_VERILOG PATH MUX9b.sv
add_fileset_file adder.sv SYSTEM_VERILOG PATH adder.sv
add_fileset_file avalon_mm_master.sv SYSTEM_VERILOG PATH avalon_mm_master.sv
add_fileset_file avalon_slave_MM_interface.v VERILOG PATH avalon_slave_MM_interface.v
add_fileset_file control.sv SYSTEM_VERILOG PATH control.sv
add_fileset_file debugMode.sv SYSTEM_VERILOG PATH debugMode.sv
add_fileset_file memoryControl.sv SYSTEM_VERILOG PATH memoryControl.sv
add_fileset_file regEX_MEM.sv SYSTEM_VERILOG PATH regEX_MEM.sv
add_fileset_file regID_EX.sv SYSTEM_VERILOG PATH regID_EX.sv
add_fileset_file regIF_ID.sv SYSTEM_VERILOG PATH regIF_ID.sv
add_fileset_file regMEM_WB.sv SYSTEM_VERILOG PATH regMEM_WB.sv
add_fileset_file regPC.sv SYSTEM_VERILOG PATH regPC.sv
add_fileset_file registers.sv SYSTEM_VERILOG PATH registers.sv
add_fileset_file top.sv SYSTEM_VERILOG PATH top.sv
add_fileset_file interconexLogic.sv SYSTEM_VERILOG PATH interconexLogic.sv

add_fileset SIM_VERILOG SIM_VERILOG "" ""
set_fileset_property SIM_VERILOG TOP_LEVEL top_Avalon
set_fileset_property SIM_VERILOG ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property SIM_VERILOG ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file top_Avalon.sv SYSTEM_VERILOG PATH top_Avalon.sv
add_fileset_file ALU.sv SYSTEM_VERILOG PATH ALU.sv
add_fileset_file ALUControl.sv SYSTEM_VERILOG PATH ALUControl.sv
add_fileset_file FUnit.sv SYSTEM_VERILOG PATH FUnit.sv
add_fileset_file HazardDet.sv SYSTEM_VERILOG PATH HazardDet.sv
add_fileset_file ImmGen.sv SYSTEM_VERILOG PATH ImmGen.sv
add_fileset_file MUX.sv SYSTEM_VERILOG PATH MUX.sv
add_fileset_file MUX3.sv SYSTEM_VERILOG PATH MUX3.sv
add_fileset_file MUX9b.sv SYSTEM_VERILOG PATH MUX9b.sv
add_fileset_file adder.sv SYSTEM_VERILOG PATH adder.sv
add_fileset_file avalon_mm_master.sv SYSTEM_VERILOG PATH avalon_mm_master.sv
add_fileset_file avalon_slave_MM_interface.v VERILOG PATH avalon_slave_MM_interface.v
add_fileset_file control.sv SYSTEM_VERILOG PATH control.sv
add_fileset_file debugMode.sv SYSTEM_VERILOG PATH debugMode.sv
add_fileset_file memoryControl.sv SYSTEM_VERILOG PATH memoryControl.sv
add_fileset_file regEX_MEM.sv SYSTEM_VERILOG PATH regEX_MEM.sv
add_fileset_file regID_EX.sv SYSTEM_VERILOG PATH regID_EX.sv
add_fileset_file regIF_ID.sv SYSTEM_VERILOG PATH regIF_ID.sv
add_fileset_file regMEM_WB.sv SYSTEM_VERILOG PATH regMEM_WB.sv
add_fileset_file regPC.sv SYSTEM_VERILOG PATH regPC.sv
add_fileset_file registers.sv SYSTEM_VERILOG PATH registers.sv
add_fileset_file top.sv SYSTEM_VERILOG PATH top.sv
add_fileset_file interconexLogic.sv SYSTEM_VERILOG PATH interconexLogic.sv


# 
# parameters
# 


# 
# display items
# 


# 
# connection point clock
# 
add_interface clock clock end
set_interface_property clock clockRate 0
set_interface_property clock ENABLED true
set_interface_property clock EXPORT_OF ""
set_interface_property clock PORT_NAME_MAP ""
set_interface_property clock CMSIS_SVD_VARIABLES ""
set_interface_property clock SVD_ADDRESS_GROUP ""

add_interface_port clock CLK clk Input 1


# 
# connection point debug
# 
add_interface debug avalon end
set_interface_property debug addressUnits WORDS
set_interface_property debug associatedClock clock
set_interface_property debug associatedReset reset_sink
set_interface_property debug bitsPerSymbol 8
set_interface_property debug burstOnBurstBoundariesOnly false
set_interface_property debug burstcountUnits WORDS
set_interface_property debug explicitAddressSpan 0
set_interface_property debug holdTime 0
set_interface_property debug linewrapBursts false
set_interface_property debug maximumPendingReadTransactions 0
set_interface_property debug maximumPendingWriteTransactions 0
set_interface_property debug readLatency 0
set_interface_property debug readWaitTime 1
set_interface_property debug setupTime 0
set_interface_property debug timingUnits Cycles
set_interface_property debug writeWaitTime 0
set_interface_property debug ENABLED true
set_interface_property debug EXPORT_OF ""
set_interface_property debug PORT_NAME_MAP ""
set_interface_property debug CMSIS_SVD_VARIABLES ""
set_interface_property debug SVD_ADDRESS_GROUP ""

add_interface_port debug chipselect_debug chipselect Input 1
add_interface_port debug write_debug write Input 1
add_interface_port debug writedata_debug writedata Input 32
add_interface_port debug read_debug read Input 1
add_interface_port debug readdata_debug readdata Output 32
add_interface_port debug adress_debug address Input 3
set_interface_assignment debug embeddedsw.configuration.isFlash 0
set_interface_assignment debug embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment debug embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment debug embeddedsw.configuration.isPrintableDevice 0


# 
# connection point reset_sink
# 
add_interface reset_sink reset end
set_interface_property reset_sink associatedClock clock
set_interface_property reset_sink synchronousEdges DEASSERT
set_interface_property reset_sink ENABLED true
set_interface_property reset_sink EXPORT_OF ""
set_interface_property reset_sink PORT_NAME_MAP ""
set_interface_property reset_sink CMSIS_SVD_VARIABLES ""
set_interface_property reset_sink SVD_ADDRESS_GROUP ""

add_interface_port reset_sink RST reset Input 1


# 
# connection point master_external
# 
add_interface master_external avalon start
set_interface_property master_external addressUnits SYMBOLS
set_interface_property master_external associatedClock clock
set_interface_property master_external associatedReset reset_sink
set_interface_property master_external bitsPerSymbol 8
set_interface_property master_external burstOnBurstBoundariesOnly false
set_interface_property master_external burstcountUnits WORDS
set_interface_property master_external doStreamReads false
set_interface_property master_external doStreamWrites false
set_interface_property master_external holdTime 0
set_interface_property master_external linewrapBursts false
set_interface_property master_external maximumPendingReadTransactions 0
set_interface_property master_external maximumPendingWriteTransactions 0
set_interface_property master_external readLatency 0
set_interface_property master_external readWaitTime 1
set_interface_property master_external setupTime 0
set_interface_property master_external timingUnits Cycles
set_interface_property master_external writeWaitTime 0
set_interface_property master_external ENABLED true
set_interface_property master_external EXPORT_OF ""
set_interface_property master_external PORT_NAME_MAP ""
set_interface_property master_external CMSIS_SVD_VARIABLES ""
set_interface_property master_external SVD_ADDRESS_GROUP ""

add_interface_port master_external ADDRESS_ext address Output 32
add_interface_port master_external BeginTransfer_ext flush Output 1
add_interface_port master_external READ_ext read Output 1
add_interface_port master_external WRITE_ext write Output 1
add_interface_port master_external WriteData_ext writedata Output 32
add_interface_port master_external LOCK_ext lock Output 1
add_interface_port master_external ReadData_ext readdata Input 32
add_interface_port master_external waitRqst_ext waitrequest Input 1


# 
# connection point master_instruccions
# 
add_interface master_instruccions avalon start
set_interface_property master_instruccions addressUnits SYMBOLS
set_interface_property master_instruccions associatedClock clock
set_interface_property master_instruccions associatedReset reset_sink
set_interface_property master_instruccions bitsPerSymbol 8
set_interface_property master_instruccions burstOnBurstBoundariesOnly false
set_interface_property master_instruccions burstcountUnits WORDS
set_interface_property master_instruccions doStreamReads false
set_interface_property master_instruccions doStreamWrites false
set_interface_property master_instruccions holdTime 0
set_interface_property master_instruccions linewrapBursts false
set_interface_property master_instruccions maximumPendingReadTransactions 0
set_interface_property master_instruccions maximumPendingWriteTransactions 0
set_interface_property master_instruccions readLatency 0
set_interface_property master_instruccions readWaitTime 1
set_interface_property master_instruccions setupTime 0
set_interface_property master_instruccions timingUnits Cycles
set_interface_property master_instruccions writeWaitTime 0
set_interface_property master_instruccions ENABLED true
set_interface_property master_instruccions EXPORT_OF ""
set_interface_property master_instruccions PORT_NAME_MAP ""
set_interface_property master_instruccions CMSIS_SVD_VARIABLES ""
set_interface_property master_instruccions SVD_ADDRESS_GROUP ""

add_interface_port master_instruccions ADDRESS_instr address Output 32
add_interface_port master_instruccions BeginTransfer_instr flush Output 1
add_interface_port master_instruccions LOCK_instr lock Output 1
add_interface_port master_instruccions READ_instr read Output 1
add_interface_port master_instruccions ReadData_instr readdata Input 32
add_interface_port master_instruccions WRITE_instr write Output 1
add_interface_port master_instruccions WriteData_instr writedata Output 32
add_interface_port master_instruccions waitRqst_instr waitrequest Input 1


# 
# connection point control_debug
# 
add_interface control_debug conduit end
set_interface_property control_debug associatedClock clock
set_interface_property control_debug associatedReset reset_sink
set_interface_property control_debug ENABLED true
set_interface_property control_debug EXPORT_OF ""
set_interface_property control_debug PORT_NAME_MAP ""
set_interface_property control_debug CMSIS_SVD_VARIABLES ""
set_interface_property control_debug SVD_ADDRESS_GROUP ""

add_interface_port control_debug tx_flag flag_tx Output 1


# 
# connection point DoneSending
# 
add_interface DoneSending conduit end
set_interface_property DoneSending associatedClock clock
set_interface_property DoneSending associatedReset reset_sink
set_interface_property DoneSending ENABLED true
set_interface_property DoneSending EXPORT_OF ""
set_interface_property DoneSending PORT_NAME_MAP ""
set_interface_property DoneSending CMSIS_SVD_VARIABLES ""
set_interface_property DoneSending SVD_ADDRESS_GROUP ""

add_interface_port DoneSending doneSending donesending Input 1

