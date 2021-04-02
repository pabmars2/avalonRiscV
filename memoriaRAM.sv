module memoriaRAM(CLK, ADDRESS, MEM_WRITE, WRITE_DATA, READ_DATA);

parameter ADDRESS_SIZE = 1024;

parameter A_S = $clog2(ADDRESS_SIZE);

input CLK;
input [A_S-1:0] ADDRESS;
input [31:0] WRITE_DATA;
input MEM_WRITE;
output [31:0]READ_DATA;

reg [31:0] RAM [ADDRESS_SIZE - 1 : 0];

always @(posedge CLK)
	begin 
		if(MEM_WRITE == 1'b1)	//escribimos de forma sincrona
			begin
				RAM[ADDRESS] <= WRITE_DATA;
			end
	end

assign READ_DATA = RAM[ADDRESS];
endmodule 
