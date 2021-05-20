//Versión 5

module top(CLK, RST_N, enable_ext, enable_pc_ext, done_instr, done_ext, idata, ddata_r, iaddr, daddr, ddata_w, WRam, RRam, enableStep, dataPCNext, clr_ext);

input CLK, RST_N;
input enable_pc_ext, done_instr, done_ext;
input [31 : 0] idata;
input [31 : 0] ddata_r;
input [3 : 0] enable_ext, clr_ext; 

output [31 : 0] iaddr, daddr, dataPCNext;
output [31 : 0] ddata_w;
output WRam, RRam;
output enableStep;

//COEXIONES DEBUG//
wire [3 : 0] enable_int;
wire [3 : 0] generalEnable;
wire enable_pc_int;
wire enable_pc;

//CONEXIONES ENABLE//
wire enable_pc_aux, enable_pc_aux_ext, enable_pc_aux_instr;
wire [3 : 0] generalEnable_aux, generalEnable_aux_ext, generalEnable_aux_instr;

//CONEXIONES INTERNAS//
wire Zero, RegWrite;
wire [3 : 0] OP;
wire [31 : 0] AluRes, AluIn1, AluIn2;
 
wire [31 : 0] NeoPC;
wire [31 : 0] Add1, Add2;
wire [31 : 0] OutImm;

wire [31 : 0] Reg1, Reg2, WData;

wire [1:0] AluOP;
wire ctrAddSum, ctrReg1, ctrReg2, ctrRam, ctrAddSum_aux, AddPC, MemRead, oMemRead;
wire [3:0] clr;

//INSTANCIACION//
wire clrIF_ID, clrID_EX, clrMEM_WB, clrEX_MEM;
wire [31:0] PC;

//wires IF/ID --> ID/EX
wire [31:0] PCIF;
wire [31:0] instr;
wire [31:0] Add1_reg2;
wire WRam_ID;

//wires ID/EX --> EX/MEM
wire [31:0] PCID;
wire ctrReg2_EX;
wire [1:0] AluOP_EX;
wire [3:0] instr_reg_contr;
wire [4:0] instr_reg_EX;
wire [31:0] OutImm_reg;
wire [31:0] Reg1_reg;
wire [31:0] Reg2_reg;
wire [31:0] Add1_reg;
wire ctrAddSum_auxEX, RegWrite_EX, WRam_EX, ctrRam_EX, ctrReg1_EX, AddPC_reg1, MemRead_EX;
wire [31:0] Add2_reg;
wire [4:0] REG1, REG2;

//wires EX/MEM --> MEM/WB
wire ctrAddSum_auxMEM;
wire [31 : 0] daddr_MEM;
wire ctrRam_MEM;
wire RegWrite_MEM;
wire [4:0] instr_reg_MEM;
wire [31:0] Reg2_reg_MEM;
wire WRam_MEM;
wire Zero_MEM;
wire AddPC_reg2;

//wires MEM/WB
wire [31:0] ddata_r_WB;
wire [31 : 0] daddr_WB;
wire ctrRam_WB;
wire RegWrite_WB;
wire [4:0] instr_reg;

//Riesgo de datos		
wire [1:0] ctrMux3_1, ctrMux3_2;
wire [31:0] outMUX1_to_Mux, outMUX2_to_Mux;

//Riesgo de control
wire [1:0] ALUOPC;
wire BrachC, PCReadC, MemtoRegC, MemWriteC, ALUSrcC, RegWriteC, AddPCC, ctrC, MemReadC;
wire [9:0] senyales_aux_in, senyales_aux_out;

//ASIGNACIONES//
assign enable_pc = enable_pc_int & enable_pc_ext;
assign enable_int[3:1] = 3'b111;
assign generalEnable = enable_int & enable_ext;

//assign generalEnable_aux = (done_ext) ? generalEnable_aux_ext : generalEnable_aux_ext & generalEnable_aux_instr;
//assign enable_pc_aux = (done_ext) ? enable_pc_aux_ext : enable_pc_aux_ext & enable_pc_aux_instr;
assign enableStep = enable_pc_aux;

assign ctrAddSum = (AddPC_reg2 || (Zero_MEM && ctrAddSum_auxMEM)) ? 1'b1 : 1'b0;
assign daddr = daddr_MEM;
assign ddata_w = Reg2_reg_MEM;
assign iaddr = {PC[31:2],2'b00};
assign dataPCNext = {NeoPC[31:2],2'b00}; 

assign {clrIF_ID, clrID_EX, clrMEM_WB, clrEX_MEM} = clr | clr_ext;

assign senyales_aux_in = {BrachC, PCReadC, MemtoRegC, ALUOPC, MemWriteC, ALUSrcC, RegWriteC, AddPCC, MemReadC};
assign {ctrAddSum_aux, ctrReg1, ctrRam, AluOP, WRam_ID, ctrReg2, RegWrite, AddPC, MemRead} = senyales_aux_out;

regIF_ID		IF_ID(
	.CLK(CLK), 
	.RST_n(RST_N), 
	.clr(clrIF_ID), 
	.Enable(generalEnable_aux[0]), 
	.instr(idata), 
	.PC(PC), 
	.Oinstr(instr), 
	.OPC(PCIF),
	.Add1(Add1),
	.oAdd1(Add1_reg2));
	
regID_EX		ID_EX(
	.CLK(CLK), 
	.RST_n(RST_N), 
	.clr(clrID_EX), 
	.Enable(generalEnable_aux[1]),
	.Rs1(instr[19:15]), 
	.Rs2(instr[24:20]),
	.ImmGen(OutImm), 
	.PC(PCIF), 
	.instr4b({instr[30],instr[14:12]}), 
	.instr5b(instr[11:7]), 
	.rd1(Reg1), 
	.rd2(Reg2), 
	.Brach(ctrAddSum_aux), 
	.PCRead(ctrReg1), 
	.MemtoReg(ctrRam), 
	.ALUOP(AluOP), 
	.MemWrite(WRam_ID), 
	.ALUSrc(ctrReg2), 
	.RegWrite(RegWrite), 
	.oImmGen(OutImm_reg), 
	.oPC(PCID), 
	.oinstr4b(instr_reg_contr), 
	.oinstr5b(instr_reg_EX), 
	.ord1(Reg1_reg), 
	.ord2(Reg2_reg), 
	.oBrach(ctrAddSum_auxEX), 
	.oPCRead(ctrReg1_EX), 
	.oMemtoReg(ctrRam_EX), 
	.oALUOP(AluOP_EX), 
	.oMemWrite(WRam_EX), 
	.oALUSrc(ctrReg2_EX), 
	.oRegWrite(RegWrite_EX),
	.oAdd1(Add1_reg),
	.Add1(Add1_reg2),
	.AddPC(AddPC),
	.oAddPC(AddPC_reg1),
	.oRs1(REG1), 
	.oRs2(REG2),
	.MemRead(MemRead),
	.oMemRead(MemRead_EX));
	
regEX_MEM	EX_MEM(
	.CLK(CLK), 
	.RST_n(RST_N), 
	.clr(clrEX_MEM), 
	.Enable(generalEnable_aux[2]), 
	.RegWrite(RegWrite_EX), 
	.MemtoReg(ctrRam_EX), 
	.Brach(ctrAddSum_auxEX), 
	.MemWrite(WRam_EX), 
	.AddSum(Add2), 
	.Zero(Zero), 
	.AluRes(AluRes), 
	.Reg2(outMUX2_to_Mux), 
	.instr5b(instr_reg_EX), 
	.oRegWrite(RegWrite_MEM), 
	.oMemtoReg(ctrRam_MEM), 
	.oBrach(ctrAddSum_auxMEM), 
	.oMemWrite(WRam_MEM), 
	.oAddSum(Add2_reg), 
	.oZero(Zero_MEM), 
	.oAluRes(daddr_MEM), 
	.oReg2(Reg2_reg_MEM), 
	.oinstr5b(instr_reg_MEM),
	.AddPC(AddPC_reg1),
	.oAddPC(AddPC_reg2),
	.MemRead(MemRead_EX),
	.oMemRead(oMemRead));
	
regMEM_WB	MEM_WB(
	.CLK(CLK), 
	.RST_n(RST_N), 
	.clr(clrMEM_WB), 
	.Enable(generalEnable_aux[3]), 
	.Data(ddata_r), 
	.Address(daddr_MEM), 
	.instr5b(instr_reg_MEM), 
	.MemtoReg(ctrRam_MEM), 
	.RegWrite(RegWrite_MEM), 
	.oData(ddata_r_WB), 
	.oAddress(daddr_WB), 
	.oinstr5b(instr_reg), 
	.oMemtoReg(ctrRam_WB), 
	.oRegWrite(RegWrite_WB));	

//DATA_PATH

regPC PC_a(
	.CLK(CLK), 
	.RST_n(RST_N),
	.Enable(enable_pc_aux),
	.clr(clr_ext[0]),	
	.IN(NeoPC), 
	.OUT(PC)); 

ALU ALU(
	.Op(OP), 
	.Zero(Zero), 
	.sol(AluRes), 
	.Op1(AluIn1), 
	.Op2(AluIn2));
	
registers Registers(
	.CLK(CLK), 
	.RST_N(RST_N), 
	.Rreg1(instr[19:15]), 
	.Rreg2(instr[24:20]), 
	.Wreg(instr_reg), 
	.Wdata(WData), 	
	.RegWrite(RegWrite_WB), 
	.Read1(Reg1), 
	.Read2(Reg2));
	
ImmGen ImmGen(
	.IN(instr[31:0]), 
	.OUT(OutImm)); 
	
adder	 Add(
	.Op1(PC), 
	.Op2(4), 
	.Sol(Add1));

adder	AddSum(
	.Op1(PCID), 
	.Op2(OutImm_reg), 
	.Sol(Add2));
	
MUX MUXAddSum(
	.in1(Add1), 
	.in2(Add2_reg), 
	.ctr(ctrAddSum), 
	.out(NeoPC));
	
MUX MUXReg2(
	.in1(outMUX2_to_Mux), 
	.in2(OutImm_reg),
	.ctr(ctrReg2_EX), 
	.out(AluIn2));	
	
MUX MUXReg1(
	.in1(outMUX1_to_Mux), 
	.in2(Add1_reg), 
	.ctr(ctrReg1_EX), 
	.out(AluIn1));		

MUX MUXRam(
	.in1(daddr_WB), 
	.in2(ddata_r_WB), 
	.ctr(ctrRam_WB), 
	.out(WData));		

//CONTROL_PATH

ALUControl	ALUControl(
	.ALUOP(AluOP_EX), 
	.IN(instr_reg_contr), 
	.OUT(OP)); 
	
control conrtol(
	.IN(instr[6:0]), 
	.Brach(BrachC), 
	.PCRead(PCReadC), 
	.MemtoReg(MemtoRegC), 
	.ALUOP(ALUOPC), 
	.MemWrite(MemWriteC), 
	.ALUSrc(ALUSrcC), 
	.RegWrite(RegWriteC),
	.AddPC(AddPCC),
	.MemRead(MemReadC));

//Riesgo de datos	
	
FUnit FUnit(
	.Rs1(REG1), 
	.Rs2(REG2), 
	.RdEx(instr_reg_MEM), 
	.RdMEM(instr_reg),
	.RegWrite_MEM(RegWrite_WB),
	.RegWrite_EX(RegWrite_MEM),
	.ForB(ctrMux3_2), 
	.ForA(ctrMux3_1));
	
MUX3 Mux_reg1(
	.in1(Reg1_reg), 
	.in2(WData), 
	.in3(daddr_MEM), 
	.ctr(ctrMux3_1), 
	.out(outMUX1_to_Mux));
	
MUX3 Mux_reg2(
	.in1(Reg2_reg), 
	.in2(WData), 
	.in3(daddr_MEM), 
	.ctr(ctrMux3_2), 
	.out(outMUX2_to_Mux));	
	
//Riesgo de control

HazardDet	HazardDet(
	.CLK(CLK),
	.RST_N(RST_N),
	.EnPC(enable_pc_int), 
	.Instr(instr), 
	.ctrMux(ctrC), 
	.RegD(instr_reg_EX),
	.M(MemRead_EX),
	.N(BrachC),
	.O(ctrAddSum_auxEX),
	.P(ctrAddSum),     
	.en(enable_int[0]), 
	.clr(clr),
	.enable(enable_pc_aux));

MUX9b MuxContr(
	.in1(senyales_aux_in), 
	.in2(10'd0), 
	.ctr(ctrC), 
	.out(senyales_aux_out));


//Control de memorias 


controlEnables CtrEnable(
	.CLK(CLK), 
	.RST_N(RST_N), 
	.startInstr(enable_pc), 
	.startExt(RRam), 
	.doneInstr(done_instr), 
	.doneExt(done_ext), 
	.EnableInPC(enable_pc), 
	.EnableInEtapas(generalEnable), 
	.EnableOutPC(enable_pc_aux), 
	.EnableOutEtapas(generalEnable_aux));

		
		
readControl RdControl(
	.CLK(CLK), 
	.RST_N(RST_N), 
	.RReadIn(oMemRead), 
	.RReadOut(RRam), 
	.Done(done_ext));	
	
readControl WrControl(
	.CLK(CLK), 
	.RST_N(RST_N), 
	.RReadIn(WRam_MEM), 
	.RReadOut(WRam), 
	.Done(done_ext));	

endmodule 