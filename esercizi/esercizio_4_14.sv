// Scrivere in HDL un modulo per un decoder 6:64 usando tre istanze del decoder 2:4 dell’Esercizio 4.13 e un po’ di porte AND a 3 ingressi.

// Fallito, riprovare
`timescale 1ns/1ps
module decoder_2_4 (input log
    input logic [1:0] d,
    output logic [3:0] y
);
    always_comb begin  
        case 
            2'b00   : y = 4'b0001;
            2'b01   : y = 4'b0010;
            2'b10   : y = 4'b0100;
            2'b11   : y = 4'b1000;
            default : y = 4'b0000;
        endcase
    
    end
    
endmodule

module decoder_6_64 (
    input logic [5:0] d,
    output logic [65:0] y
);
    
    decoder_2_4 primo();
    decoder_2_4 secondo();
    decoder_2_4 terzo();

endmodule 