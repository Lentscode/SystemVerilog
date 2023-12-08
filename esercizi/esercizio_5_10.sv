`timescale 1ns/1ps
module comparator #(
    parameter N = 4
) (
    input logic [N-1:0] a, b,
    output logic [N-1:0] sum,
    output logic y
);

    logic [N-1:0] b_complement;
    logic y;
    
    assign b_complement = ~b + 1;
    assign {r_out, sum} = a + b_complement;
    assign y = ~r_out;
endmodule