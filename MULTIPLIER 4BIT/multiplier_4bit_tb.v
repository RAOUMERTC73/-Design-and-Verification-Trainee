module Multiplier_4bit_tb;

    // Signals
    reg [3:0] A, B;
    wire [7:0] P;

    // Instantiate the Multiplier_4bit module
    Multiplier_4bit UUT(
        .A(A),
        .B(B),
        .P(P)
    );

    // Test stimuli
    initial begin
        // Initialize inputs
        A = 4'b0000;
        B = 4'b0000;

        // Apply test vectors
        #10 A = 4'b0001; B = 4'b0010; // 1 * 2 = 2
        #10 A = 4'b0011; B = 4'b0011; // 3 * 3 = 9
        #10 A = 4'b1010; B = 4'b0100; // 10 * 4 = 40

        // Add more test vectors as needed

        // Finish simulation
        #10 $finish;
    end

endmodule
