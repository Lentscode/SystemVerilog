// Scrivere in HDL un modulo strutturale per cal­colare la funzione logica y = a~b + ~b~c + ~abc usando logica a mul­tiplexer.

`timescale 1ns/1ps
module mux2 (
    input logic s,
    input logic d1, d0,
    output logic y
);
    assign y = s ? d1 : d0;
endmodule

module muxfinale (
    input logic a, b, c,
    output logic y
);
    logic not_a, not_b, not_c, b_and_c;
    logic term1, term2, term3;

    assign not_a = ~a;
    assign not_b = ~b;
    assign not_c = ~c;
    assign b_and_c = b & c;

    mux2 muxprimo(a, not_b, 1'b0, term1);
    mux2 muxsecondo(not_b, not_c, 1'b0, term2);
    mux2 muxterzo(not_a, b_and_c, 1'b0, term3);

    assign y = term1 | term2 | term3;

endmodule