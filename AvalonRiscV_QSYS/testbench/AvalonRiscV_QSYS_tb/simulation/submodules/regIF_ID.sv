module regIF_ID(CLK, RST_n, clr, Enable, instr, PC, Oinstr, OPC, Add1, oAdd1);

input CLK, RST_n, clr, Enable;
input [31:0] instr, PC, Add1;

output [31:0] Oinstr, OPC, oAdd1;

reg [31:0] auxinstr, auxPC, aAdd1;

assign OPC = auxPC;
assign Oinstr = auxinstr;
assign oAdd1 = aAdd1;

always_ff @(posedge CLK, negedge RST_n)
begin
	if(!RST_n)
		begin
			auxinstr <= 32'd0;
			auxPC <= 32'd0;
			aAdd1 <= 32'd0;
		end
	else if(clr)
		begin
			auxinstr <= 32'd0;
			auxPC <= 32'd0;
			aAdd1 <= 32'd0;
		end
	else if(Enable)
		begin
			auxinstr <= instr;
			auxPC <= PC;
			aAdd1 <= Add1;
		end		
end
endmodule 