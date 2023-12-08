// Progettare in HDL l’ALU a 32 bit mostrata nella Figura 5.17. Il modulo di più alto livello può essere realizzato sia in modo combinatorio sia in modo sequenziale.
`timescale 1ns/1ps
module alu #(
    parameter N = 32
) (
    input logic [N-1:0] a, b,
    input logic [1:0] control,
    output logic [N-1:0] result,
    output logic v, c, n, z     // flags
);
    logic [N-1:0] sum, sub, and_, or_;
    logic r_out;

    assign {r_out, sum} = a + b;
    assign sub = a - b;
    assign and_ = a & b;
    assign or_ = a | b;

    assign result = control[1]  ? (control[0] ? or_ : and_)
                                : (control[0] ? sub : sum); // si usa un multiplexer per scegliere l'operazione che si vuole ottenere

    assign v = ~(control[0] ^ a[N-1] ^ a[N-1]) & (a[N-1] ^ sum[N-1]) & ~control[1];
    assign c = r_out & ~control[1];
    assign z = &(~result);
    assign n = result[N-1];


endmodule

/*
    Risultato test:
    
    Time =   0, A = 00000000000000000000000000000000, B = 00000000000000000000000000000000, Control = 00, Result = 00000000000000000000000000000000, V = 0, C = 0, Z = 1, N = 0,
    Time =  10, A = 01111011111100000101101111000011, B = 00100100011100101001010000010101, Control = 00, Result = 10100000011000101110111111011000, V = 1, C = 0, Z = 0, N = 1,
    Time =  20, A = 11111110000100110110110100001101, B = 01100100001011001010010010111110, Control = 01, Result = 10011001111001101100100001001111, V = 0, C = 1, Z = 0, N = 1,
    Time =  30, A = 10011011000011100101001010001111, B = 10000000000000000000000000000000, Control = 00, Result = 00011011000011100101001010001111, V = 1, C = 1, Z = 0, N = 0,
    Time =  40, A = 00000111001100110110010011100110, B = 11000001001000111100011001000000, Control = 10, Result = 00000001001000110100010001000000, V = 0, C = 0, Z = 0, N = 0,
    Time =  50, A = 11000000111001101110110011000001, B = 11011000010101001000110100101101, Control = 11, Result = 11011000111101101110110111101101, V = 0, C = 0, Z = 0, N = 1,
    Time =  60, A = 00010011000100000000011000011110, B = 11010110110110010001010101011100, Control = 01, Result = 00111100001101101111000011000010, V = 0, C = 0, Z = 0, N = 0,
    Time =  70, A = 00001101000011111110001001001010, B = 10011111100110000111000000100111, Control = 10, Result = 00001101000010000110000000000010, V = 0, C = 0, Z = 0, N = 0,
    Time =  80, A = 11111111111111111111111111111111, B = 00000000000000000000000000000001, Control = 00, Result = 00000000000000000000000000000000, V = 1, C = 1, Z = 1, N = 0,
*/