// 
`timescale 1ps/1ps
module priority_circuit (
    input logic [7:0] d,
    output logic [7:0] y
);
    
    always_comb // EDA non lo riconosce, usare always @*
            casez (d)
                8'b1???????: y = 8'b10000000;
                8'b01??????: y = 8'b01000000;
                8'b001?????: y = 8'b00100000;
                8'b0001????: y = 8'b00010000;
                8'b00001???: y = 8'b00001000;
                8'b000001??: y = 8'b00000100;
                8'b0000001?: y = 8'b00000010;
                8'b00000001: y = 8'b00000001;
                default: y = 8'b00000000;
            endcase

endmodule