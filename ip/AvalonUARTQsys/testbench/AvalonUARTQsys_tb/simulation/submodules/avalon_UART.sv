module avalon_UART(CLK, RST, flag_tx, TX, RX, READDATA, WAITREQUEST, ADDRESS, WRITEDATA, BEGINTRANSFER, READ, WRITE, LOCK, doneSending);

parameter c_CLKS_PER_BIT = 434;

input CLK, RST;

////////////
//EXTERNAL//
////////////
input flag_tx;
input RX;
output TX;
output doneSending;

//////////////////
//AVALON SIGNALS//
//////////////////
input [31 : 0] READDATA;
input WAITREQUEST;
output [31 : 0] ADDRESS;
output [31 : 0] WRITEDATA;
output BEGINTRANSFER;
output READ, WRITE;
output LOCK;

////////////////////
//INTERNAL SIGNALS//
////////////////////
reg doneRecieved, doneAvalon;
reg ctrAvalon, flag_tx_UART;
reg startTransfer;
reg [1 : 0] control;
reg [31 : 0] addressAvalon;
reg [31 : 0] dataRecieved;
reg [31 : 0] dataToSend;//, data_to_send;
reg [31 : 0] data_to_write;

reg flagTx_aux = 0;

enum {IDLE, RECIEVE, TRANSMIT, DONE} state;

UART #(.c_CLKS_PER_BIT(c_CLKS_PER_BIT)) UART(
	.CLK(CLK), 
	.TX(TX), 
	.RX(RX), 
	.data_rx(dataRecieved), 
	.done_rx(doneRecieved), 
	.data_tx(dataToSend), 
	.flag_tx(flag_tx_UART), 
	.controlBits(control),
	.done_tx(doneSending));



avalon_mm_master  masterUART(
   .CLK(CLK), 
	.RESET(RST),
	.ADDRESS(ADDRESS), 
	.BEGINTRANSFER(BEGINTRANSFER), 
	.READ(READ), 
	.WRITE(WRITE), 
	.WRITEDATA(WRITEDATA), 
	.LOCK(LOCK), 
	.WAITREQUEST(WAITREQUEST), 
	.READDATA(READDATA),
	.done(doneAvalon), 
	.data_read(dataToSend),  
	.data_to_write(data_to_write),
   .rnw(ctrAvalon), 
	.start(startTransfer), 
	.address_to_access(addressAvalon)) ;

always_ff @(posedge CLK or posedge RST)
begin
	if(RST)
		state <= IDLE;
	else
	begin
		case(state)
			
			IDLE:
			begin
				if(doneRecieved)
					state  <= RECIEVE;
				else
				begin
					if(flag_tx)
						state <= TRANSMIT;
					else
						state <= IDLE;
				end
			end
			
			RECIEVE: 
			begin
				if(doneAvalon)
					state <= DONE;
				else
					state <= RECIEVE;
			end
			
			TRANSMIT: 
			begin
				if(doneSending)
					state <= DONE;
				else
					state <= TRANSMIT;
			end			
			
			DONE: state <= IDLE;
			
			default: state <= IDLE;
		
		endcase
	end
end	
	
always @(state or control or flag_tx_UART or flag_tx)
begin	
	if(RST)
	begin
		addressAvalon = 0;
		ctrAvalon = 1'b1;
		startTransfer = 1'b0;
		data_to_write = 0;
		flag_tx_UART = 1'b0;
		
		flagTx_aux = 1'b0;
	end
	else
	begin
		case(state)
			
			IDLE:
			begin
				addressAvalon = 0;
				ctrAvalon = 1'b1;
				startTransfer = 1'b0;
				data_to_write = 0;
				flag_tx_UART = 1'b0;
				
				flagTx_aux = 1'b0;
			end
			
			RECIEVE: 
			begin
				case(control) //hmm
					2'b00: addressAvalon = 32'h00000000;
					
					2'b01: addressAvalon = 32'h00000004;
					
					2'b10: addressAvalon = 32'h00000008;
					
					default: addressAvalon = 32'h00000000;
					
				endcase
				ctrAvalon = 1'b0;
				startTransfer = 1'b1;
				data_to_write = dataRecieved; 
				flag_tx_UART = 1'b0;
				
				flagTx_aux = 1'b0;
			end
			
			TRANSMIT: 
			begin
				addressAvalon = 32'h0000000C;
				ctrAvalon = 1'b1;
				//startTransfer = 1'b1;
				data_to_write = 0;
				flag_tx_UART = 1'b1;
				
				if(flag_tx)
					flagTx_aux <= 1'b1;
										
				if(flagTx_aux == 1'b1)
					startTransfer = 1'b0;
				else
					startTransfer = 1'b1;
				
				
			end
			
			DONE:
			begin
				addressAvalon = 0;
				ctrAvalon = 1'b1;
				startTransfer = 1'b0;
				data_to_write = dataRecieved;
				flag_tx_UART = 1'b0;
				
				flagTx_aux = 1'b0;
			end
			
			default:
			begin
				addressAvalon = 0;
				ctrAvalon = 1'b1;
				startTransfer = 1'b0;
				data_to_write = 0;
				flag_tx_UART = 1'b0;
				
				flagTx_aux = 1'b0;
			end		
		endcase
	end	
end

endmodule 