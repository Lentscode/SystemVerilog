//Write  an  HDL  module  for  a  hexadecimal  seven-segment  display decoder.  
//The decoder  should  handle  the  digits  A,  B,  C,  D,  E,  and  F  as  well  as  0–9
`timescale 10ns/1ns

module es4_6(input logic [3:0] d, output logic [6:0] y);
always @*
	case(d)
		    //abc_defg
	4'd0: y = 7'b111_1110;
    4'd1: y = 7'b011_0000;
    4'd2: y = 7'b110_1101;
    4'd3: y = 7'b110_1101;
    4'd4: y = 7'b011_0011;
    4'd5: y = 7'b101_1011;
    4'd6: y = 7'b101_1111;
    4'd7: y = 7'b111_0000;  
    4'd8: y = 7'b111_1111;
    4'd9: y = 7'b111_1011;
	4'hA: y = 7'b111_0111;
    4'hB: y = 7'b001_1111;
    4'hC: y = 7'b100_1110;
    4'hD: y = 7'b011_1101;
    4'hE: y = 7'b100_1111;
    4'hF: y = 7'b100_0111;
	default: y = 7'b000_0000;
	endcase
endmodule