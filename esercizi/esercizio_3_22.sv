// Creare un modulo per l'esercizio 3.22

module esercizio_3_22 (
    input logic a, b, clock, reset,
    output logic q
);

    typedef enum logic [1:0] { S0, S1, S2 } state;
    state currentstate, proxstate;

    always @(posedge clock) begin
        if (reset) begin
            currentstate <= S0;
        end
        else currentstate <= proxstate;
    end

    always @* begin
        case (currentstate)
            S0: proxstate = a ? S1 : S0;
            S1: proxstate = b ? S2 : S0;
            S2: proxstate = S0;
            default: proxstate = S0;
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