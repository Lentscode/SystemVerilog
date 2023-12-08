`timescale 1ns/1ps
module comparator_tb;

    parameter N = 4;

    logic [N-1:0] a, b;
    logic [N-1:0] sum;
    logic y;

    comparator #(.N(N)) uut(
        .a(a),
        .b(b),
        .sum(sum),
        .y(y)
    );

    initial begin
        a = 4'b0000;
        b = 4'b0000;
        #10;
        
        a = 4'b1110;
        b = 4'b1100;
        #10;

        a = 4'b0010;
        b = 4'b0101;
        #10;

        a = 4'b1000;
        b = 4'b1100;
        #10;

        a = 4'b0111;
        b = 4'b0110;
        #10;

        a = 4'b0100;
        b = 4'b0010;
        #10;

        a = 4'b1110;
        b = 4'b1010;
        #10;

        a = 4'b0101;
        b = 4'b1000;
        #10;
        $finish;

    end

    initial begin
        $monitor("Time = %3d, A = %4b, B = %4b, Sum = %4b, A < B ==> %b",
                $time, a, b, sum, y);
    end


endmodule