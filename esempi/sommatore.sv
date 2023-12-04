`timescale 1ns/1ps
module sommatore #(
    parameter N = 16
) (
    input logic [N-1:0] a, b,
    input logic r_in,
    output logic [N-1:0] s,
    output logic r_out
);
    
    assign {r_out, s} = a + b + r_in;
endmodule