module esercizio_4_32_tb;

    logic a, b;
    logic clock, reset;
    logic q;

    esercizio_4_32 dut(a, b, clock, reset, q);

    initial begin
        clock = 1;
        forever #5 clock = ~clock;
    end

    initial begin
        reset = 1;
        a = 0;
        b = 0;
        #10;
        reset = 0;
        a = 1;
        b = 0;
        #10;
        a = 1;
        b = 1;
        #10;
        a = 0;
        b = 1;
        #10;
        a = 1;
        b = 1;
        #10;
        a = 0;
        b = 0;
        #10;
        a = 0;
        b = 1;
        #10;
        a = 1;
        b = 0;
        #10;
        a = 1;
        b = 1;
        #10;
        $finish;

    end

    initial begin
        $monitor("Time = %3d, a = %b, b = %b, q = %b",
                $time, a, b, q);
    end
endmodule