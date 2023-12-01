// Scrivere in HDL un modulo che realizza il controllore semaforico del paragrafo 3.4.1.

/*  L'intento è costruire una FSM capace di rappresentare un semaforo che gestisce un incrocio.
    Gli input "t" sono i sensori che rilevano la presenza di veicoli su una via, mentre gli "l" sono i segnali corrispondenti ai colori:
    - rosso = 00;
    - giallo = 01;
    - verde = 10;

    Gli stati sono 4, codificati in 2 bit.
    - S0, si ha quando t_a = 1 e consegue che l_a = verde, l_b = rosso;
    - S1, si ha quando t_a passa a 0 e consegue che l_a = giallo, l_b = rosso;
    - S2, si ha quando t_b = 1 e consegue che l_a = rosso, l_b = verde;
    - S3, si ha quando t_b passa a 0 e consegue che l_a = rosso, l_b = giallo;
*/

`timescale 10ns/1ps
module traffic_lights (
    input logic t_a, t_b, clock, reset,
    output logic [1:0] l_a, l_b
);
    
    typedef enum logic [1:0] {S0, S1, S2, S3} state;    // definizione stati
    state currentstate, nextstate;

    always @(posedge clock, posedge reset) 
    
    // registro di stato, aggiorna lo stato corrente allo stato prossimo ad ogni fronte di salita del clock
        begin
        if (reset) currentstate <= S0;
        else currentstate <= nextstate;
        end

    // definizione dello stato prossimo in base agli input
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

    // determinazione degli output in base allo stato corrente
    always @* 
        case (currentstate)
            S0: begin l_a = 2'b10; l_b = 2'b00; end
            S1: begin l_a = 2'b01; l_b = 2'b00; end            
            S2: begin l_a = 2'b00; l_b = 2'b10; end
            S3: begin l_a = 2'b00; l_b = 2'b01; end
            default: begin l_a = 2'b10; l_b = 2'b00; end
        endcase
        
    
        
endmodule