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
            S5: nextstate = S0;
            S6: nextstate = S0;
            S7: nextstate = S0;
            S8: nextstate = S0;
            S9: nextstate = S0;
            default: nextstate = S0;
        endcase
    end

    always @* begin
        case (currentstate)
            S0: begin deliver = 1'b0; give_nickel = 1'b0; give_dime = 1'b0; give_doubledime = 1'b0; end 
            S1: begin deliver = 1'b0; give_nickel = 1'b0; give_dime = 1'b0; give_doubledime = 1'b0; end 
            S2: begin deliver = 1'b0; give_nickel = 1'b0; give_dime = 1'b0; give_doubledime = 1'b0; end 
            S3: begin deliver = 1'b0; give_nickel = 1'b0; give_dime = 1'b0; give_doubledime = 1'b0; end 
            S4: begin deliver = 1'b0; give_nickel = 1'b0; give_dime = 1'b0; give_doubledime = 1'b0; end 
            S5: begin deliver = 1'b1; give_nickel = 1'b0; give_dime = 1'b0; give_doubledime = 1'b0; end 
            S6: begin deliver = 1'b1; give_nickel = 1'b1; give_dime = 1'b0; give_doubledime = 1'b0; end 
            S7: begin deliver = 1'b1; give_nickel = 1'b0; give_dime = 1'b1; give_doubledime = 1'b0; end 
            S8: begin deliver = 1'b1; give_nickel = 1'b1; give_dime = 1'b1; give_doubledime = 1'b0; end 
            S9: begin deliver = 1'b1; give_nickel = 1'b0; give_dime = 1'b0; give_doubledime = 1'b1; end 
            default: begin deliver = 1'b0; give_nickel = 1'b0; give_dime = 1'b0; give_doubledime = 1'b0; end
        endcase
    end

endmodule

// Qualcosa che non va negli output, qui il test eseguito:

/*
    Time =   0, Nickel = 0, Dime = 0, Quarter = 0, Deliver = 0, GiveNickel = 0, GiveDime = 0, GiveDoubleDime = 0
    Time =  20, Nickel = 1, Dime = 0, Quarter = 0, Deliver = 0, GiveNickel = 0, GiveDime = 0, GiveDoubleDime = 0
    Time =  40, Nickel = 0, Dime = 1, Quarter = 0, Deliver = 0, GiveNickel = 0, GiveDime = 0, GiveDoubleDime = 0
    Time =  60, Nickel = 0, Dime = 0, Quarter = 1, Deliver = 1, GiveNickel = 1, GiveDime = 1, GiveDoubleDime = 0 (fino a qui giusto)
    Time =  80, Nickel = 0, Dime = 1, Quarter = 0, Deliver = 0, GiveNickel = 0, GiveDime = 0, GiveDoubleDime = 0
    Time = 100, Nickel = 0, Dime = 0, Quarter = 1, Deliver = 1, GiveNickel = 0, GiveDime = 0, GiveDoubleDime = 0 (qui si dovrebbe attivare GiveDime)
    Time = 120, Nickel = 0, Dime = 0, Quarter = 1, Deliver = 0, GiveNickel = 0, GiveDime = 0, GiveDoubleDime = 0 (qui si dovrebbe attivare Deliver)
*/

// Provato a farlo con ChatGPT, ma va ancora peggio
`timescale 1ns/1ps
module vending_machine(
    input logic nickel, dime, quarter, 
    output logic deliver, give_nickel, give_dime, give_doubledime,
    input logic clock, reset
);

    typedef enum logic [4:0] {
        S0, S5, S10, S15, S20, S25, S30, S35, S40, S45, S50
    } state;

    state currentstate, nextstate;
    logic [4:0] amount;

    // Logica di transizione di stato
    always @(posedge clock or posedge reset) begin
        if (reset) 
            currentstate <= S0;
        else 
            currentstate <= nextstate;
    end

    // Logica di calcolo del prossimo stato
    always ()* begin
        nextstate = currentstate; // Default
        amount = currentstate;     // Converti lo stato in importo

        // Aggiorna l'importo e determina il prossimo stato
        if (nickel) amount = amount + 5;
        else if (dime) amount = amount + 10;
        else if (quarter) amount = amount + 25;

        // Determina il prossimo stato in base all'importo
        case (amount)
            5: nextstate = S5;
            10: nextstate = S10;
            15: nextstate = S15;
            20: nextstate = S20;
            25: nextstate = S25; // Eroga e rendi il resto
            30 : nextstate = S30;
            35 : nextstate = S35;
            40 : nextstate = S40;
            45 : nextstate = S45;
            50 : nextstate = S50;
            default: nextstate = S0; // Stato iniziale se supera 50 o errore
        endcase
    end

    // Logica di output
    always ()* begin
        // Resetta tutti gli output
        deliver = 0; give_nickel = 0; give_dime = 0; give_doubledime = 0;

        // Attiva gli output appropriati
        if (currentstate >= S25) begin
            deliver = 1;
            unique case (currentstate)
                S30: give_nickel = 1;
                S35: give_dime = 1;
                S40: begin give_nickel = 1; give_dime = 1; end
                S45: give_doubledime = 1;
                S50: begin give_nickel = 1; give_doubledime = 1; end
            endcase
        end
    end

endmodule
