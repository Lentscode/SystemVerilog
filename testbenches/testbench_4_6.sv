`timescale 10ns/1ns

module testbench;
  logic [3:0] d;
  logic [6:0] y;

  es4_6 dut(.d(d), .y(y));

  initial begin
    $display("Simulation started");
    $display("d,   y");
    $display("---------");
    $monitor("%b | %b", d, y);

    d = 4'd0; #10;
    d = 4'd1; #10
    d = 4'd2; #10
    d = 4'd3; #10
    d = 4'd4; #10
    d = 4'd5; #10
    d = 4'd6; #10
    d = 4'd7; #10  
    d = 4'd8; #10
    d = 4'd9; #10
	d = 4'hA; #10
    d = 4'hB; #10
    d = 4'hC; #10
    d = 4'hD; #10
    d = 4'hE; #10
    d = 4'hF; #10
    #10;
    
    $display("Simulation finished");
    $finish;
  end
endmodule