module UART(CLK, TX, RX, data_rx, done_rx, data_tx, flag_tx, controlBits, done_tx);

//baudRate = 115200;
//clkSpeed = 50000000;
//c_CLKS_PER_BIT = clkSpeed/baudRate = 434;

parameter c_CLKS_PER_BIT = 434;

input CLK;
input RX;
input flag_tx;
input [31 : 0] data_tx;

output [31 : 0] data_rx; 
output [1 : 0] controlBits;
output reg done_rx, done_tx;
output TX;


reg [7 : 0] data_to_recieve [4 : 0];
reg [7 : 0] data_to_send [3 : 0];

reg flag_tx_aux;
reg done_rx_aux, done_tx_aux;
reg [7 : 0] data_recieved_aux, data_tx_aux;

reg [3 : 0] indexCount = 0;
reg [3 : 0] indexCountTx = 0;
reg WrAux;

assign data_rx = {data_to_recieve[3][7:0], data_to_recieve[2][7:0], data_to_recieve[1][7:0], data_to_recieve[0][7:0]};
assign controlBits = data_to_recieve[4][1:0];

enum {IDLE, SAVE_READ, READ, DONE} state;
enum {IDLEWr, SAVE_WRITE, WRITE, DONEWr} stateWr;

  uart_rx #(.CLKS_PER_BIT(c_CLKS_PER_BIT)) UART_RX_INST
    (.i_Clock(CLK),
     .i_Rx_Serial(RX),
     .o_Rx_DV(done_rx_aux),		
     .o_Rx_Byte(data_recieved_aux)
     );
   
  uart_tx #(.CLKS_PER_BIT(c_CLKS_PER_BIT)) UART_TX_INST
    (.i_Clock(CLK),
     .i_Tx_DV(flag_tx_aux),
     .i_Tx_Byte(data_tx_aux),
     .o_Tx_Active(),
     .o_Tx_Serial(TX),
     .o_Tx_Done(done_tx_aux)
     );
  
 


always_ff @(posedge CLK)
begin
	case(state)
	
		IDLE:
			begin
				
				if(RX == 1'b0)
					state <= READ;
				else
					state <= IDLE;
					
				indexCount = 0;
				
				done_rx <= 1'b0; 
				
				WrAux = 1'b0;
			end

			
		
		READ:
			begin
				
				if(indexCount < 5)
				begin
					state <= READ;
					
					done_rx <= 1'b0; 
					
					if(done_rx_aux | WrAux)
					begin	
						data_to_recieve[indexCount][7:0] = data_recieved_aux;
						indexCount = indexCount + 1;
						WrAux = 1'b0;
					end	
				end	
				else
				begin
					data_to_recieve[indexCount][7:0] = data_recieved_aux;
					indexCount = 0;
					state <= DONE;
					
					done_rx <= 1'b1; 
				end	
			
			end
		

		
		DONE:
			begin
				state <= IDLE;
			
				indexCount = 0;
				
				done_rx <= 1'b0; 
				
				WrAux = 1'b0;
			end
		
		default:	
			begin
				state <= IDLE;
			
				indexCount = 0;
				
				done_rx <= 1'b0; 
				
				WrAux = 1'b0;
			end
	
	endcase
	
	
	case(stateWr)
	
		IDLEWr:
			begin
			
				if(flag_tx)
					stateWr <= SAVE_WRITE;
				else
					stateWr <= IDLEWr;
				
				indexCountTx = 0;
				flag_tx_aux = 1'b0;
				
				done_tx <= 1'b0;
				
			end

	
	
		SAVE_WRITE:
			begin
			
				stateWr <= WRITE;
				
				indexCountTx = 0;
				flag_tx_aux = 1'b0;
				
				done_tx <= 1'b0;
				
			end
		
		WRITE:
			begin
				
				data_to_send[0][7:0] = data_tx[7 : 0];
				data_to_send[1][7:0] = data_tx[15 : 8];
				data_to_send[2][7:0] = data_tx[23 : 16];
				data_to_send[3][7:0] = data_tx[31 : 24];
				
				if(done_tx_aux)
					indexCountTx = indexCountTx + 1;
				
				case(indexCountTx)
				
					0:
					begin
						flag_tx_aux = 1'b1;
						data_tx_aux = data_to_send[0][7:0];
					
						stateWr <= WRITE;
						
						done_tx <= 1'b0;
					end
					
					1:
					begin
						flag_tx_aux = 1'b1;
						data_tx_aux = data_to_send[1][7:0];
						
						stateWr <= WRITE;
						
						done_tx <= 1'b0;
					end
					
					2:
					begin
						flag_tx_aux = 1'b1;
						data_tx_aux = data_to_send[2][7:0];
					
						stateWr <= WRITE;
						
						done_rx <= 1'b0; 
						done_tx <= 1'b0;
					end
					
					3:
					begin
						flag_tx_aux = 1'b1;
						data_tx_aux = data_to_send[3][7:0];
					
						stateWr <= WRITE;
						
						done_tx <= 1'b0;
					end
					
					4:
					begin
						flag_tx_aux = 1'b0;
						data_tx_aux = data_to_send[0][7:0];
					
						stateWr <= DONEWr;
						
						done_tx <= 1'b1;
					end
				
					
					default:
					begin
						flag_tx_aux = 1'b0;
						data_tx_aux = data_to_send[indexCountTx][7:0];
					
						stateWr <= WRITE;
						 
						done_tx <= 1'b0;
					end
				
				endcase
				
			end	
	
	
		DONEWr:
			begin
			
				stateWr <= IDLEWr;
				
				indexCountTx = 0;
				flag_tx_aux = 1'b0;
				
				done_tx <= 1'b0;
				
			end
	
		
		
		default:
			begin
			
				stateWr <= IDLEWr;
				
				indexCountTx = 0;
				flag_tx_aux = 1'b0;
				
				done_tx <= 1'b0;
				
			end
	
	endcase
	
end
  
endmodule 