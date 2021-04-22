module readControl(CLK, RST_N, RReadIn, RReadOut, Done);

input CLK, RST_N;
input RReadIn, Done;

output reg RReadOut;

enum {W_READ, W_DONE, DONE} state;

always @(posedge CLK or negedge RST_N)
begin
	if(!RST_N)
		state <= W_READ;
	else
	begin
		case(state)
			
			W_READ:
				begin
					if(RReadIn)
						state <= W_DONE;
					else
						state <= W_READ;
				end
			
			W_DONE:
				begin
					if(Done)
						state <= DONE;
					else
						state <= W_DONE;			
				end
			
			DONE:
				begin
					if(!RReadIn)
						state <= W_READ;
					else
						state <= DONE;
				end
			
			default: state <= W_READ;
		
		endcase
	end
end

always_comb
begin
	if(!RST_N)
		RReadOut = RReadIn;
	else
	begin
		case(state)
			
			W_READ:	RReadOut = RReadIn;
			
			W_DONE:	RReadOut = 0;
			
			DONE:	RReadOut = 0;
			
			default: RReadOut = RReadIn;
			
		endcase
	end

end

endmodule 