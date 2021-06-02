module top_Avalon(CLK, RST, ADDRESS_instr, ADDRESS_ext, BeginTransfer_instr, 
BeginTransfer_ext, READ_instr, READ_ext, WRITE_instr, WRITE_ext, WriteData_instr, 
WriteData_ext, LOCK_instr, LOCK_ext, ReadData_instr, ReadData_ext, waitRqst_instr, 
waitRqst_ext, chipselect_debug, write_debug, writedata_debug, read_debug, adress_debug, 
readdata_debug, tx_flag, doneSending);

//General Inputs
input CLK, RST;
input doneSending;
output tx_flag; 

//AVALON MASTERS connections
output [31:0] ADDRESS_instr, ADDRESS_ext;
output BeginTransfer_instr, BeginTransfer_ext;
output READ_instr, READ_ext;
output WRITE_instr, WRITE_ext;
output [31:0] WriteData_instr, WriteData_ext;
output LOCK_instr, LOCK_ext;
input [31:0] ReadData_instr, ReadData_ext;
input waitRqst_instr, waitRqst_ext;

//AVALON SLAVE connections
input chipselect_debug;
input write_debug;
input [31:0] writedata_debug;
input read_debug;
input [2:0] adress_debug;
output [31:0] readdata_debug;

//Fixed data / adresses interconnects
wire [31:0] data_read_instr, data_read_ext;
wire [31:0] adress_instr, adress_ext;
wire [31:0] data_write_instr, data_write_ext;

//Fixed controllers
wire control_instr, control_ext;
wire start_instr, start_ext;
wire done_instr, done_ext;
wire WRam, RRam;

//Connections debug
wire debug;
wire enable_pc_ext;
wire enableStep;
wire [3:0] enable_ext, clr_ext;

wire readInstrAux, writeInstrAux, readExtAux, writeExtAux;
wire startExtAux;	
wire [2 : 0] mode;
wire [31 : 0] address_instr_master, address_ext_master, address_debug_master;
wire [31 : 0] dataTxDebug, dataRxDebug;	
wire [31 : 0] data_read_ext_uP, data_read_instr_uP;
wire [31 : 0] data_write_ext_uP;

wire [31 : 0] dataPCNext;

//Assignations external
assign control_ext = (writeExtAux == 1'b0) ? ((readExtAux == 1'b1) ? 1'b1 : 1'bX) : 1'b0;
assign start_ext = WRam || RRam;
assign control_instr = (writeInstrAux == 1'b0) ? ((readInstrAux == 1'b1) ? 1'b1 : 1'bX) : 1'b0;	
	

top top_RISC(
	.CLK(CLK), 
	.RST_N(~RST), 
	.idata(data_read_instr_uP), 
	.ddata_r(data_read_ext_uP), 
	.iaddr(adress_instr), 
	.daddr(adress_ext), 
	.ddata_w(data_write_ext_uP), 
	.WRam(WRam), 
	.RRam(RRam),
	.enable_ext(enable_ext), 
	.enable_pc_ext(enable_pc_ext), 
	.done_instr(done_instr), 
	.done_ext(done_ext),
	.enableStep(enableStep),
	.dataPCNext(dataPCNext),
	.clr_ext(clr_ext));

avalon_mm_master #(.width(32)) master_instr(
   .CLK(CLK), 
	.RESET(RST),
	.ADDRESS(ADDRESS_instr), 
	.BEGINTRANSFER(BeginTransfer_instr), 
	.READ(READ_instr), 
	.WRITE(WRITE_instr), 
	.WRITEDATA(WriteData_instr), 
	.LOCK(LOCK_instr), 
	.done(done_instr), 
	.data_read(data_read_instr),  
	.READDATA(ReadData_instr), 
	.WAITREQUEST(waitRqst_instr), 
	.data_to_write(data_write_instr), 
   .rnw(control_instr), 
	.start(start_instr),  
	.address_to_access(address_instr_master)); 
	
	
avalon_mm_master #(.width(32)) master_ext(
   .CLK(CLK), 
	.RESET(RST),
	.ADDRESS(ADDRESS_ext), 
	.BEGINTRANSFER(BeginTransfer_ext), 
	.READ(READ_ext), 
	.WRITE(WRITE_ext), 
	.WRITEDATA(WriteData_ext), 
	.LOCK(LOCK_ext), 
	.done(done_ext), 
	.data_read(data_read_ext),  
	.READDATA(ReadData_ext), 
	.WAITREQUEST(waitRqst_ext), 
	.data_to_write(data_write_ext),
   .rnw(control_ext), 
	.start(startExtAux),  
	.address_to_access(address_ext_master)); 


debugMode  SystemDebug(
	.CLK(CLK),
	.RST(RST),
	.chipselect_debug(chipselect_debug),
	.write_debug(write_debug),
	.writedata_debug(writedata_debug),
	.read_debug(read_debug),
	.adress_debug(adress_debug),
	.readdata_debug(readdata_debug),
	.debug(debug),
	.enable_ext(enable_ext),
	.enable_pc_ext(enable_pc_ext),
	.tx_flag(tx_flag), 
	.address_bridged(address_debug_master),
	.data_bridged(dataRxDebug), 
	.mode(mode),
	.data_internal(dataTxDebug),
	.doneSending(doneSending),
	.enableStep(enableStep),
	.clr_ext(clr_ext),
	.doneInstr(done_instr), 
	.doneExt(done_ext));	
	
	
	
interconexLogic  connectLogic(
	.mode(mode), 
	.uPAddressExt(adress_ext), 
	.uPAddressInstr(adress_instr), 
	.debugAddress(address_debug_master), 
	.dataReadExt(data_read_ext), 
	.dataReadInstr(ReadData_instr), 
	.uPdataWriteExt(data_write_ext_uP), 
	.uPdataWriteInstr(32'b0), 
	.DEBUGWrite(dataRxDebug), 
	.dataPC(adress_instr), 
	.dataPCNext(dataPCNext),
	.read_Ext(RRam), 
	.read_Instr(1'b1), 
	.write_Ext(WRam), 
	.write_Instr(1'b0), 
	.doneExt(done_ext), 
	.doneInstr(done_instr), 
	.startInputInstr(1'b1), 
	.startInputExt(start_ext),
	.AddressExt(address_ext_master), 
	.AddressInstr(address_instr_master), 
	.uPdataReadExt(data_read_ext_uP), 
	.uPdataReadInstr(data_read_instr_uP), 
	.dataReadDebug(dataTxDebug), 
	.dataWriteExt(data_write_ext), 
	.dataWriteInstr(data_write_instr), 
	.readExt(readExtAux), 
	.readInstr(readInstrAux), 
	.writeExt(writeExtAux), 
	.writeInstr(writeInstrAux), 
	.startInstr(start_instr), 
	.startExt(startExtAux),
	.chipselect_debug(chipselect_debug));	
	
	

endmodule 