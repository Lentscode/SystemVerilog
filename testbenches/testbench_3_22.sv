module esercizio_3_22_tb;

    logic a, b, clock, reset;
    logic q;

    esercizio_3_22 dut(
        .a(a),
        .b(b),
        .clock(clock),
        .reset(reset),
        .q(q)
    );

    initial begin
        clock = 1;
        forever #5 clock = ~clock;
    end

    initial begin
        
        a = 0;
        b = 0;
        #10;
        a = 1;
        b = 1;
        #10;
        a = 0;
        b = 1;
        #10;
        a = 1;
        b = 0;
        #10;
        a = 0;
        b = 1;
        #10;
        a = 0;
        b = 0;
        #10;
        a = 0;
        b = 1;
        #10;
        a = 1;
        b = 1;
        #10;
        a = 0;
        b = 1;
        #10;
        $finish;
    end

    initial begin
        $monitor("Time = %3d, a = %b, b = %b, q = %b",
                $time, a, b, q);
    end

endmodule