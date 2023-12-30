module esercitazione3 (
    input logic x,
    input logic clock, reset,
    output logic q
);

    typedef enum logic [1:0] { S0, S1, S2, S3 } state;
    state currentstate, nextstate;

    always @(posedge clock) begin
        if (reset) begin
            currentstate <= S0;
        end
        else currentstate <= nextstate;
    end

    always @* begin
        case (currentstate)
            S0: if (x) begin
                nextstate = S1;
            end else begin
                nextstate = S0;
            end
            S1: if (x) begin
                nextstate = S3;
            end else begin
                nextstate = S2;
            end
            S2: if (x) begin
                nextstate = S1;
            end else begin
                nextstate = S0;
            end
            S3: if (x) begin
                nextstate = S3;
            end else begin
                nextstate = S2;
            end
            default: nextstate = S0;
        endcase
    end

    always @* begin
        case (currentstate)
            S0: q = 0; 
            S1: q = 0; 
            S2: q = 1; 
            S3: q = 1; 
            default: q = 0; 
        endcase
    end
    
endmodule