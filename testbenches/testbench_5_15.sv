module comparator_by_flags1_tb;

    logic N, C, V, Z;
    logic MaU, MiU, Mag, Min;

    comparator_by_flags1 dut (
        .N(N), .C(C), .V(V), .Z(Z),
        .MaU(MaU), .MiU(MiU), .Mag(Mag), .Min(Min)
    );

    initial begin
        N = 0; C = 0; V = 0; Z = 0;
        #10;
        N = 1; C = 0; V = 0; Z = 1;
        #10;
        N = 1; C = 1; V = 0; Z = 1;
        #10;
        N = 1; C = 0; V = 1; Z = 0;
        #10;
        N = 0; C = 0; V = 0; Z = 1;
        #10;
        N = 0; C = 1; V = 0; Z = 0;
        #10;
        N = 0; C = 0; V = 1; Z = 0;
        #10;
        $finish;
    end

    initial begin
        $monitor("Time=%3d, N=%b, C=%b, V=%b, Z=%b, MaU=%b, MiU=%b, Mag=%b, Min=%b", 
                $time, N, C, V, Z, MaU, MiU, Mag, Min);
    end
endmodule