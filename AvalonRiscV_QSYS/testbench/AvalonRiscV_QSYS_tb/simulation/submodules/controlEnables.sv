module controlEnables(CLK, RST_N, startInstr, startExt, doneInstr, doneExt, EnableInPC, EnableInEtapas, EnableOutPC, EnableOutEtapas);

input CLK, RST_N;

input startInstr, startExt;
input doneInstr, doneExt;
input EnableInPC;
input [3:0] EnableInEtapas;

output EnableOutPC;
output [3:0] EnableOutEtapas;

reg [3:0] EnableEtapasInstr, EnableEtapasExt;
reg EnablePCInstr, EnablePCExt;
reg flagDoneExt;

enum {IDLE, WAITING, DONE} state;

assign EnableOutEtapas = (flagDoneExt) ? EnableEtapasExt : EnableEtapasExt & EnableEtapasInstr;
assign EnableOutPC = (flagDoneExt) ? EnablePCExt : EnablePCExt & EnablePCInstr;


memoryControl #(.n(5)) controlInstr(
	.CLK(CLK),
	.RST_N(RST_N),
	.start(startInstr), 
	.done(doneInstr), 
	.enable_in({EnableInEtapas, EnableInPC}), 
	.enable_out({EnableEtapasInstr, EnablePCInstr}));

memoryControl #(.n(5)) controlExt(
	.CLK(CLK),
	.RST_N(RST_N),
	.start(startExt), 
	.done(doneExt), 
	.enable_in({EnableInEtapas, EnableInPC}), 
	.enable_out({EnableEtapasExt, EnablePCExt}));	


always_ff @(posedge CLK or negedge RST_N)
begin
	if(!RST_N)
		state <= IDLE;
	else
	begin
		case(state)
		
			IDLE:
				begin
					if(startExt == 1'b1)
						state <= WAITING;
					else
						state <= IDLE;
				end
			
			
			WAITING:
				begin
					if(doneExt == 1'b1)
						state <= DONE;
					else
						state <= WAITING;
				end
				
			DONE:	state <= IDLE;
			
			
			default: state <= IDLE;
		
		endcase
	end
end


always_comb
begin
	if(!RST_N)
		flagDoneExt <= 1'b0;
	else
	begin
		case(state)
		
			IDLE: flagDoneExt <= 1'b0;
			
			
			WAITING: flagDoneExt <= 1'b0;
			
			
			DONE: flagDoneExt <= 1'b1;
			
			
			default: flagDoneExt <= 1'b0;
		
		endcase
	end

end


endmodule 