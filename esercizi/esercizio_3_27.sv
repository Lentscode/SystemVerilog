module contatore_gray (
    input logic reset, clk,
    output logic [2:0] y
);

    typedef enum logic [2:0] { S0, S1, S2, S3, S4, S5, S6, S7 } state;
    state currentstate, nextstate;

    always @(posedge clk) begin
        if (reset) begin
            currentstate <= S0;
        end
        else currentstate <= nextstate;
    end

    always @* begin
        case (currentstate)
            S0: nextstate = S1; 
            S1: nextstate = S3; 
            S2: nextstate = S6; 
            S3: nextstate = S2; 
            S4: nextstate = S0; 
            S5: nextstate = S4; 
            S6: nextstate = S7; 
            S7: nextstate = S5; 
            default: nextstate = S0;
        endcase
    end

    always @* begin
        case (currentstate)
            S0: y = 3'b000; 
            S1: y = 3'b001; 
            S2: y = 3'b010; 
            S3: y = 3'b011; 
            S4: y = 3'b100; 
            S5: y = 3'b101; 
            S6: y = 3'b110; 
            S7: y = 3'b111; 
            default: y = 3'b000;
        endcase
    end
    
endmodule