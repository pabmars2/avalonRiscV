module memoryControl(start, done, enable_in, enable_out);

parameter n = 4;

input done, start;
input [n - 1 : 0] enable_in;

output [n - 1 : 0] enable_out;

reg [n - 1 : 0] ctr;

assign enable_out = ctr;

always_comb
begin
	if(start)
	begin
		if(!done)
			ctr = 0;
		else
			ctr = enable_in; 
	end
	else
	begin	
		ctr = enable_in;	
	end
end

endmodule 