// Filename        : avalon_mm_master.v
// Description     : Avalon MM Master Example
// Author          : Philip Tracton
// Created On      : Fri May 30 17:36:03 2014
// Last Modified By: Pablo Martinez Sanchez
// Last Modified On: 
// Update Count    : 1

module avalon_mm_master (
   // Outputs
   ADDRESS, BEGINTRANSFER, READ, WRITE, WRITEDATA, LOCK, done, data_read,
   // Inputs
   CLK, RESET, READDATA, WAITREQUEST, data_to_write,
   rnw, start, address_to_access
   ) ;

	////////////////////////////////////
	//GENERAL PARAMETERS OF THE MODULE//
	////////////////////////////////////
	parameter width = 32;									
	
	//////////////////
	//GENERAL INPUTS//
	//////////////////
   input CLK;
   input RESET;

   ////////////////////////
   // FUNDAMENTAL SIGNALS//
   ////////////////////////
   output reg [width - 1 : 0] ADDRESS;					//usable adress
   output  BEGINTRANSFER;									//start transfer bit
   output reg  READ;											//read flag 
   input [width - 1 : 0]  READDATA;						//data to read
   output reg WRITE;											//write flag
   output reg [width - 1 : 0] WRITEDATA;				//data to write
	
   ////////////////
   //WAIT SIGNALS//
   ////////////////
   output	 LOCK;											//shows the MM is locked
   input 	 WAITREQUEST;									//locks the MM


   //////////////////////////////////////////
   // Control Signals -- NOT part of AVALON//
   //////////////////////////////////////////
   input [width - 1 : 0]  data_to_write;
   input 	 rnw;
   input 	 start;  
   input [width - 1 : 0]  address_to_access;
   output 	 done;
   output reg [width - 1 : 0] data_read;

   ///////////////////////////
   //State Machine Variables//
   ///////////////////////////

	enum {STATE_IDLE, STATE_WAIT, STATE_DONE} state;
	
   assign LOCK = (state == STATE_WAIT);   
   assign done = (state == STATE_DONE);
   assign BEGINTRANSFER = start;
	assign data_read = READDATA;
	
   /////////////////////////////
   // Synchronous state change//
   /////////////////////////////
   always_ff @(posedge CLK or posedge RESET)
	begin
		if (RESET)
			state <= STATE_IDLE;	
		else 
			begin
				case(state)
				
					STATE_IDLE:
						begin
						if(start)
							begin
							if (WAITREQUEST) 
								state <= STATE_WAIT;		   			   
							else 
								state <= STATE_DONE;		 	
							end
						else
							state <= STATE_IDLE;
						end
					
					STATE_WAIT: 
						begin
						if (WAITREQUEST) 
							state <= STATE_WAIT;		   
						else 
							state <= STATE_DONE;		   
						end	  
					
					STATE_DONE:	state <= STATE_IDLE;
					
					default : state <= STATE_IDLE;				
			
				endcase
			end
	end
   //
   // Asynchronous State Machine
   //
   always_comb
   begin
	
		if (RESET) begin
			ADDRESS = 0;
			READ = 0;
			WRITE = 0;
			WRITEDATA = 0;
		end else begin
		
			case (state)
			
				STATE_IDLE: 
					begin
					if (start) begin
						ADDRESS = address_to_access;
						if (!rnw) 
							begin
							WRITE = 1'b1;
							READ = 1'b0;
							WRITEDATA = data_to_write;
							end 
						else 
							begin
							READ = 1'b1;
							WRITE = 1'b0;	
							WRITEDATA = 0;				
							end
							
					end else 
					begin // if (start)
						ADDRESS = 0;
						READ = 0;
						WRITE = 0;
						WRITEDATA = 0;
					end
			  end 

			  
			  STATE_WAIT: 
					begin
					ADDRESS = address_to_access;
					if (!rnw) 
						begin
						WRITE = 1'b1;
						READ = 1'b0;
						end 
					else 
						begin
						READ = 1'b1;
						WRITE = 1'b0;			
						end
					WRITEDATA = data_to_write;
					end	  

			  STATE_DONE:
					begin						
				  	ADDRESS = address_to_access;
					READ = 0;
					WRITE = 0;
					WRITEDATA = data_to_write;
					end	  
			  
			  default:
			  begin
					ADDRESS = 0;
					READ = 0;
					WRITE = 0;
					WRITEDATA = 0;
			  end
			  
		endcase // case (state)	
		end
   end
endmodule // avalon_mm_master