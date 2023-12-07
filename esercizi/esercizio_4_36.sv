// Scrivere in HDL un modulo che realizza il di­stributore automatico di bottigliette di acqua minerale dell’Esercizio 3.26.

/*  Si tratta di una FSM che rappresenta un distributore automatico di bottigliette. La bottiglietta viene erogata ogni 25 centesimi
    e si possono inserire 5, 10 o 25 centesimi. Il distributore eroga anche il resto. Accetta tre input, Nickel, Dime e Quarter e ha quattro
    output, Eroga, RendiNickel, RendiDime e RendiDueDime.
    
    Arrivato all'importo di 25 centesimi, la FSM attiva Eroga e le Rendi necessarie a rendere il resto.
*/

`timescale 1ns/1ps
module vending_machine (
    input logic nickel, dime, quarter, clock, reset,
    output logic deliver, give_nickel, give_dime, give_doubledime
);
    typedef enum logic [3:0] {S0, S1, S2, S3, S4, S5, S6, S7, S8, S9} state; // Gli stati indicano il denaro immesso nel distributore. Ogni 5 centesimi si avanza di uno stato.
    state currentstate, nextstate;

    always @(posedge clock, posedge reset) begin
        if (reset) currentstate <= S0;
        else currentstate <= nextstate;
    end

    always @* begin
        case (currentstate)
            S0: if (nickel) nextstate = S1;
                else if (dime) nextstate = S2;
                else if (quarter) nextstate = S5;
                else nextstate = S0;
            S1: if (nickel) nextstate = S2;
                else if (dime) nextstate = S3;
                else if (quarter) nextstate = S6;
                else nextstate = S1;
            S2: if (nickel) nextstate = S3;
                else if (dime) nextstate = S4;
                else if (quarter) nextstate = S7;
                else nextstate = S2;
            S3: if (nickel) nextstate = S4;
                else if (dime) nextstate = S5;
                else if (quarter) nextstate = S8;
                else nextstate = S3;
            S4: if (nickel) nextstate = S5;
                else if (dime) nextstate = S6;
                else if (quarter) nextstate = S9;
                else nextstate = S4;
            S5: if (nickel) nextstate = S1;
                else if (dime) nextstate = S2;
                else if (quarter) nextstate = S5;
                else nextstate = S0;
            S6: if (nickel) nextstate = S1;
                else if (dime) nextstate = S2;
                else if (quarter) nextstate = S5;
                else nextstate = S0;
            S7: if (nickel) nextstate = S1;
                else if (dime) nextstate = S2;
                else if (quarter) nextstate = S5;
                else nextstate = S0;
            S8: if (nickel) nextstate = S1;
                else if (dime) nextstate = S2;
                else if (quarter) nextstate = S5;
                else nextstate = S0;
            S9: if (nickel) nextstate = S1;
                else if (dime) nextstate = S2;
                else if (quarter) nextstate = S5;
                else nextstate = S0;
            default: nextstate = S0;
        endcase
    end

    always @* begin
        case (currentstate)
            S0: begin deliver = 0; give_nickel = 0; give_dime = 0; give_doubledime = 0; end 
            S1: begin deliver = 0; give_nickel = 0; give_dime = 0; give_doubledime = 0; end 
            S2: begin deliver = 0; give_nickel = 0; give_dime = 0; give_doubledime = 0; end 
            S3: begin deliver = 0; give_nickel = 0; give_dime = 0; give_doubledime = 0; end 
            S4: begin deliver = 0; give_nickel = 0; give_dime = 0; give_doubledime = 0; end 
            S5: begin deliver = 1; give_nickel = 0; give_dime = 0; give_doubledime = 0; end 
            S6: begin deliver = 1; give_nickel = 1; give_dime = 0; give_doubledime = 0; end 
            S7: begin deliver = 1; give_nickel = 0; give_dime = 1; give_doubledime = 0; end 
            S8: begin deliver = 1; give_nickel = 1; give_dime = 1; give_doubledime = 0; end 
            S9: begin deliver = 1; give_nickel = 0; give_dime = 0; give_doubledime = 1; end 
            default: begin deliver = 0; give_nickel = 0; give_dime = 0; give_doubledime = 0; end
        endcase
    end

endmodule