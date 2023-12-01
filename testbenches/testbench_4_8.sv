`timescale 1ns / 1ps

module mux8_tb;

    // Inputs
    logic [2:0] s;
    logic [7:0] d;

    // Output
    wire y;

    // Istanza del modulo mux8
    mux8 uut (
        .s(s), 
        .d(d), 
        .y(y)
    );

    // Procedura di test
    initial begin
        // Inizializza gli ingressi
        s = 0;
        d = 8'b00000000;

        // Aggiungi ritardi e varia gli ingressi per testare diversi scenari
        #10;
        d = 8'b10101010; // Cambia gli ingressi
        s = 3'b000;      // Testa diverse posizioni del selettore
        #10;
        s = 3'b001;
        #10;
        s = 3'b010;
        #10;
        s = 3'b011;
        #10;
        s = 3'b100;
        #10;
        s = 3'b101;
        #10;
        s = 3'b110;
        #10;
        s = 3'b111;

        // Aggiungi altri casi di test se necessario

        #10;
        $finish; // Termina la simulazione
    end

    // Monitoraggio opzionale dei segnali
    initial begin
        $monitor("Time = %3d, Selector = %b, Inputs = %b, Output = %b", $time, s, d, y);
    end

endmodule
