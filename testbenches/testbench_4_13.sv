`timescale 1ns/1ns
module decoder_2_4_tb;
    logic [1:0] a;
    logic [3:0] y;

    decoder_2_4 uut(
        .a(a),
        .y(y)
    );

    initial begin
        a = 2'b00;
        #10;
        a = 2'b01;
        #10;
        a = 2'b11;
        #10;
        a = 2'b10;    

        #10
        $finish; 
    end

    initial begin
        $monitor("Time = %3d, Input = %2b, Output = %4b",
                 $time, a, y);
    end

endmodule
// prova