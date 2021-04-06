module regPC(CLK, RST_n, Enable, IN, OUT);

input CLK, RST_n, Enable;
input [31 : 0] IN;
output [31 : 0] OUT;

reg [31 : 0] aux;

assign OUT = aux;

always_ff @(posedge CLK or negedge RST_n) 
begin
	if(!RST_n)
		aux = 0;
	else if(Enable)
		aux = IN;
end
endmodule 