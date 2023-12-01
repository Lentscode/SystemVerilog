module mux2 (
    input logic s
    input logic d0, d1;
    output logic y,
);
    assign y = s ? d1 : d0;
endmodule

module mux8 (
    input logic [2:0] s,
    input logic [7:0] d,
    output logic y,
);
    mux2 muxprimo(s[0], d[0], d[1], primo);
    mux2 muxsecondo(s[0], d[2], d[3], secondo);
    mux2 muxterzo(s[0], d[4], d[5], terzo);
    mux2 muxquarto(s[0], d[6], d[7], quarto);
    mux2 muxquinto(s[1], primo, secondo, quinto);
    mux2 muxsesto(s[1], terzo, quarto, sesto);
    mux2 muxfinale(s[2], quinto, sesto, finale);
endmodule