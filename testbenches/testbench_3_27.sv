module contatore_gray_tb;

    logic reset, clk;
    logic [2:0] y;

    contatore_gray dut(
        .reset(reset),
        .clk(clk),
        .y(y)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        reset = 1;
        #10
        reset = 0;
        #10;
        #10;
        #10;
        #10;
        #10;
        #10;
        #10;
        #10;
        #10;
        #10;
        #10;
        #10;
        #10;
        #10;
        $finish;
    end

    initial begin
        $monitor("Time = %3d, y = %3b",
                $time, y);
    end

endmodule