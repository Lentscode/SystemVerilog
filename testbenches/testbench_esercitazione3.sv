module esercitazione3_tb;

    logic x, clock, reset;
    logic q;

    esercitazione3 dut(x, clock, reset, q);

    initial begin
        clock = 1;
        forever #5 clock = ~clock;
    end

    initial begin
        reset = 1;
        x = 0;
        #10;
        reset = 0;
        x = 1;
        #10;
        x = 1;
        #10;
        x = 0;
        #10;
        x = 0;
        #10;
        x = 1;
        #10;
        x = 0;
        #10;
        x = 1;
        #10;
        x = 1;
        #10;
        $finish;
    end

    initial begin
        $monitor("Time = %3d, x = %b, q = %b",
                $time, x, q);
    end
endmodule