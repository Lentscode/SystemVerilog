// Scrivere in HDL un modulo a partire dalla FSM con diagramma degli stati mostrato nella Figura 3.69 re­lativa all’Esercizio 3.22.
module esercizio_4_32 (
    input logic a, b,
    input logic clock, reset,
    output logic q
);

    typedef enum logic [1:0] { S0, S1, S2 } state;
    state currentstate, nextstate;

    always @(posedge clock) begin
        if (reset) begin
            currentstate <= S0;
        end
        else currentstate <= nextstate;
    end

    always @* begin
        case (currentstate)
            S0: if (a) begin
                nextstate = S1
            end else begin
                nextstate = S0;
            end 
            S1: if (b) begin
                nextstate = S2;
            end else begin
                nextstate = S0;
            end
            S2: nextstate = S0;
            default: nextstate = S0;
        endcase
    end

    always @* begin
        case (currentstate)
            S0: q = 0; 
            S1: q = 0;
            S2: q = 1;
            default: q = 0;
        endcase
    end
    
endmodule