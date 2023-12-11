// Costruire un’unità di confronto per numeri senza segno, che confronta i due numeri A e B. Gli ingressi dell’unità sono i segnali flag ALU (N, Z, C e V) dell’ALU della Figura 5.16, quando l’ALU esegue la sottrazione A – B. Le uscite dell’unità sono MaU, MiU, Mag e Min che indicano che A è maggiore o uguale (MaU), minore o uguale (MiU), maggiore (Mag) o minore (Min) di B.

module comparator_by_flags1 (
    input logic N, C, V, Z,
    output logic MaU, MiU, Mag, Min
);
    
    assign MaU = ~C | Z;
    assign MiU = C | Z;
    assign Mag = ~C & ~Z;
    assign Min = C & ~Z;
    

endmodule