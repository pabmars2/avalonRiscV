module FUnit(Rs1, Rs2, RdEx, RdMEM, RegWrite_MEM, RegWrite_EX, ForB, ForA);

input logic [4:0] Rs1, Rs2, RdEx, RdMEM;
input logic RegWrite_MEM, RegWrite_EX;
output logic [1:0] ForB, ForA;

always_comb
begin
	if((RdEx == Rs1) && (RdEx == Rs2) && (RdEx !== 5'd0) && (RdMEM !== 5'd0)) 
		if(RegWrite_EX) //Caso que sean iguales ambos regs en la penúltima etapa
			begin
				ForA = 2'b10; 
				ForB = 2'b10;
			end
		else
			begin
				ForA = 2'b00; 
				ForB = 2'b00;
			end
	else 
		if((RdMEM == Rs1) && (RdMEM == Rs2) && (RdEx !== 5'd0) && (RdMEM !== 5'd0)) //Caso que sean iguales ambos regs en la última etapa
			if(RegWrite_MEM)
				begin
					ForA = 2'b01; 
					ForB = 2'b01;
				end
			else
				begin
					ForA = 2'b00;
					ForB = 2'b00;
				end
		else
			if((RdEx == Rs1) && (RdMEM == Rs2) && (RdEx !== 5'd0) && (RdMEM !== 5'd0))
				if(RegWrite_EX) //Caso que sean iguales ambos regs en la penúltima etapa
					if(RegWrite_MEM)
						begin
							ForA = 2'b10; 
							ForB = 2'b01;
						end
					else
						begin
							ForA = 2'b10; 
							ForB = 2'b00;
						end
				else
					begin
						ForA = 2'b00; 
						ForB = 2'b00;
					end
			else
				if((RdMEM == Rs1) && (RdEx == Rs2) && (RdEx !== 5'd0) && (RdMEM !== 5'd0))
					if(RegWrite_EX) //Caso que sean iguales ambos regs en la penúltima etapa
						if(RegWrite_MEM)
							begin
								ForA = 2'b01; 
								ForB = 2'b10;
							end
						else
							begin
								ForA = 2'b01; 
								ForB = 2'b00;
							end
					else
						begin
							ForA = 2'b00; 
							ForB = 2'b00;
						end
				else
					if((RdEx == Rs1) && (RdMEM == Rs1))
						if(RegWrite_EX)
							begin
								ForA = 2'b10; 
								ForB = 2'b00;
							end
						else
							if(RegWrite_MEM)
								begin
									ForA = 2'b01; 
									ForB = 2'b00;
								end
							else
								begin
									ForA = 2'b00;
									ForB = 2'b00;
								end
						else
							if((RdEx == Rs2) && (RdMEM == Rs2))
								if(RegWrite_EX)
									begin
										ForA = 2'b00;
										ForB = 2'b10;
									end
								else 
									if(RegWrite_MEM)
										begin
											ForA = 2'b00;
											ForB = 2'b01;
										end
									else
										begin
											ForA = 2'b00;
											ForB = 2'b00;
										end
							else
								if(RdEx == Rs1)
									if(RegWrite_EX)
										begin
											ForA = 2'b10;
											ForB = 2'b00;
										end
									else
										begin
											ForA = 2'b00;
											ForB = 2'b00;
										end
								else
									if(RdMEM == Rs1)
										if(RegWrite_MEM)
											begin
												ForA = 2'b01;
												ForB = 2'b00;
											end
										else
											begin
												ForA = 2'b00;
												ForB = 2'b00;
											end
									else
										if(RdEx == Rs2)
											if(RegWrite_EX)
												begin
													ForA = 2'b00;
													ForB = 2'b10;
												end
											else
												begin
													ForA = 2'b00;
													ForB = 2'b00;
												end
										else
											if(RdMEM == Rs2)
												if(RegWrite_MEM)
													begin
														ForA = 2'b00;
														ForB = 2'b01;
													end
												else
													begin
														ForA = 2'b00;
														ForB = 2'b00;
													end
											else
												begin
													ForA = 2'b00;
													ForB = 2'b00;
												end

end
endmodule 