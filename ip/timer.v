module timer(clk, rst_n, enable, borra_irq, irq, count, threshold, fin_cuenta, out_th);

input clk, rst_n, enable, borra_irq;
input [31:0] threshold, fin_cuenta;
output reg irq;
output out_th;
output reg [31:0] count;

always @ (posedge clk or negedge rst_n)
	begin
		if (!rst_n)
			begin
			count <= 0;
			irq <= 1'b0;
			end
		else
			begin
				if (enable == 1'b1)
					if (count == fin_cuenta)
						begin
							count <= 0;
							irq <= 1'b1;
						end	
					else
						count <= count + 1'b1;
				else
					count <= count;
					
			if(borra_irq)	irq <= 1'b0;	
				
		end
	end

assign out_th = (count > threshold) ? 1'b1 : 1'b0;
	
endmodule 