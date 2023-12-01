`timescale 10ns/10ns
module traffic_lights_tb;

    logic t_a, t_b, clock, reset;
    logic [1:0] l_a, l_b;

    traffic_lights uut (.t_a(t_a),
                        .t_b(t_b), 
                        .clock(clock), 
                        .reset(reset), 
                        .l_a(l_a), 
                        .l_b(l_b));

    initial
        begin
            clock = 1;
            forever #5 clock = ~clock;
        end

        initial begin
            reset = 1;
            t_a = 1;
            t_b = 0;
            #10;

            reset = 0;
            t_a = 0;
            t_b = 1;
            #20;

            t_b = 0;
            #40;

            t_a = 1;
            t_b = 1;
            #40;
            $finish;

            
        end
        initial 
            begin
                $monitor("Time = %4d, SensorA = %b, SensorB = %b, VialeAteneo = %2b, VialeAccademia = %2b",
                         $time, t_a, t_b, l_a, l_b);

            end
endmodule