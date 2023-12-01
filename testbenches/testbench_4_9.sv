`timescale 1ns/1ps

module muxfinale_tb;

    logic a, b, c;
    logic y;

    muxfinale uut(
        .a(a),
        .b(b),
        .c(c),
        .y(y)

    );

    initial begin
        
        a = 0; b = 0; c = 0;

        #10;
        a = 0; b = 0; c = 1;
        #10;
        a = 0; b = 1; c = 0;
        #10;
        a = 0; b = 1; c = 1;
        #10;
        a = 1; b = 0; c = 0;
        #10;
        a = 1; b = 0; c = 1;
        #10;
        a = 1; b = 1; c = 0;
        #10;
        a = 1; b = 1; c = 1;

        #10;
        $finish;
    end

    initial begin
        $monitor("Time = %3d, a = %b, b = %b, c = %b, Output = %b",
                $time, a, b, c, y);
    end

endmodule