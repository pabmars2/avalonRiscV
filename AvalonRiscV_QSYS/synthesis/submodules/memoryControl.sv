module memoryControl(CLK, RST_N, start, done, enable_in, enable_out);

parameter n = 4;

input CLK, RST_N;
input done, start;
input [n - 1 : 0] enable_in;

output [n - 1 : 0] enable_out;

reg [n - 1 : 0] ctr;
enum {W_START, W_DONE} state;

assign enable_out = ctr;

always @(posedge CLK or negedge RST_N)
begin
	if(!RST_N)
		state <= W_START;
	else
	begin
		case(state)
			
			W_START: 
				begin
					if(start)
						state <= W_DONE;
					else
						state <= W_START;
				end
		
			W_DONE:
				begin
					if(done)
						state <= W_START;
					else
						state <= W_DONE;				
				end
			
			default: state <= W_START;
		
		endcase
	end
end

always_comb
begin
	if(!RST_N)
		ctr = enable_in;
	else	
	begin
		case(state)
			
			W_START: ctr = enable_in;
			
			W_DONE: ctr = 0;
			
			default:	ctr = enable_in;	
		
		endcase
	end
end

endmodule 