module hex7seg(input [3:0] inhex,
        output [6:0] out7seg);
parameter invert=0;
reg [6:0] out7seg_aux;
always @(*)
    case (inhex)
     4'h0: out7seg_aux = 7'h3F;
     4'h1: out7seg_aux = 7'h06; 
     4'h2: out7seg_aux = 7'h5B; 
     4'h3: out7seg_aux = 7'h4F;
     4'h4: out7seg_aux = 7'h66; 
     4'h5: out7seg_aux = 7'h6D; 
     4'h6: out7seg_aux = 7'h7D; 
     4'h7: out7seg_aux = 7'h07;
     4'h8: out7seg_aux = 7'h7F;
     4'h9: out7seg_aux = 7'h67; 
     4'hA: out7seg_aux = 7'h77; 
     4'hB: out7seg_aux = 7'h7C;
     4'hC: out7seg_aux = 7'h39;
     4'hD: out7seg_aux = 7'h5E; 
     4'hE: out7seg_aux = 7'h79; 
     4'hF: out7seg_aux = 7'h71; 
     default: out7seg_aux = 7'h7F; 
     endcase     
assign out7seg=invert? ~(out7seg_aux): out7seg_aux;
endmodule
