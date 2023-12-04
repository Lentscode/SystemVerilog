`timescale 1ns/1ps
module sommatore_tb;

    logic [15:0] a, b, s;
    logic r_in, r_out;

    sommatore uut(
        .a(a),
        .b(b),
        .s(s),
        .r_in(r_in),
        .r_out(r_out)
    );

    initial begin
        a = 16'b0000000000000000;
        b = 16'b0000000000000000;
        r_in = 1'b0;
        #10;

        a = 16'b0101010100100100;
        b = 16'b1001010001001010;
        #10;

        a = 16'b1111111111111111;
        a = 16'b0000000000000010;
        r_in = 1'b1;
        #10;

        a = 16'b1101000101011010;
        b = 16'b1010010101001011;
        #10;

        a = 16'b0010100101010111;
        a = 16'b1010100100111111;
        #10;
        $finish;

    end

    initial begin
        $monitor("A = %8b, B = %8b, R_in = %b, Sum = %8b, R_out = %b",
                 a, b, r_in, s, r_out);
    end

endmodule