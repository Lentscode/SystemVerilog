// Scrivere in HDL un modulo che realizza il controllore semaforico del paragrafo 3.4.1.
`timescale 10ns/1ps
module traffic_lights (
    input logic t_a, t_b, clock, reset,
    output logic [1:0] l_a, l_b
);
    
    typedef enum logic [1:0] {S0, S1, S2, S3} state;
    state currentstate, nextstate;

    always @(posedge clock, posedge reset) 
    
        begin
        if (reset) currentstate <= S0;
        else currentstate <= nextstate;
        end

    always @*
        case (currentstate)
            S0: if (t_a) nextstate = S0;
                else nextstate = S1;
            S1: nextstate = S2;
            S2: if (t_b) nextstate = S2;
                else nextstate = S3;
            S3: nextstate = S0;
            default: nextstate = S0;
        endcase

    always @* 
        case (currentstate)
            S0: begin l_a = 2'b10; l_b = 2'b00; end
            S1: begin l_a = 2'b01; l_b = 2'b00; end            
            S2: begin l_a = 2'b00; l_b = 2'b10; end
            S3: begin l_a = 2'b00; l_b = 2'b01; end
            default: begin l_a = 2'b10; l_b = 2'b00; end
        endcase
        
    
        
endmodule