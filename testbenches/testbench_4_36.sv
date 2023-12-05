`timescale 1ns/1ps
module automatic_machine_tb;

    logic nickel, dime, quarter, clock, reset;
    logic deliver, give_nickel, give_dime, give_doubledime;

    automatic_machine uut(
        .nickel(nickel),
        .dime(dime),
        .quarter(quarter),
        .deliver(deliver),
        .give_nickel(give_nickel),
        .give_dime(give_dime),
        .give_doubledime(give_doubledime),
        .clock(clock),
        .reset(reset)
    );

    initial 
        begin
            clock = 1;
            forever #10 clock = ~clock;
        end

    initial
        begin
            reset = 1;
            nickel = 0;
            dime = 0;
            quarter = 0;
            #10;

            reset = 0;
            nickel = 1;
            #10;

            nickel = 0;
            dime = 1;
            #10;

            dime = 0;
            quarter = 1;
            #10;

            dime = 1;
            quarter = 0;
            #10;

            quarter = 1;
            dime = 0;
            $finish;
        end

        initial begin
            $monitor("Time = %3d, Nickel = %b, Dime = %b, Quarter = %b, Deliver = %b, GiveNickel = %b, GiveDime = %b, GiveDoubleDime = %b",
                    $time, nickel, dime, quarter, deliver, give_nickel, give_dime, give_doubledime);
        end

endmodule