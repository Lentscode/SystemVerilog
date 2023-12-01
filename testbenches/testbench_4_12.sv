`timescale 1ps/1ps

module priority_circuit_tb;

    logic [7:0] d, y;

    priority_circuit uut(
        d[7:0],
        y[7:0]
    );

    initial begin
        d = 8'b00000000;

        #10;
        d = 8'b01001011;
        #10;
        d = 8'b00011000;
        #10;
        d = 8'b00100101;
        #10;
        d = 8'b01010100;
        #10;
        d = 8'b10100010;
        #10;
        d = 8'b10100010;
        #10;
        d = 8'b00101010;
        #10;
        d = 8'b00100000;
        #10;
        d = 8'b00100101;
        #10;
        d = 8'b00101010;
        #10;
        d = 8'b01010000;
        $finish;
    end

    initial begin
        $monitor("Time = %3d, Input = %8b, Output = %8b",
                 $time, d, y);
    end

endmodule