`timescale 1ns / 1ps

module t_ff_tb;

    // Signals
    reg t;
    reg rst_n;
    reg clk;

    wire q;

    // Instantiate the DUT
    t_ff dut (
        .q(q),
        .t(t),
        .rst_n(rst_n),
        .clk(clk)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Initial values
    initial begin
        clk = 0;
        rst_n = 0;
        t = 0;
        #15;
        rst_n = 1;
        #15;
        t = 1;
        #15;
        t = 0;
        #15;

        // Test case 3: Toggle t input 
        repeat(5) begin
            t = 1;
            #5;
            t = 0;
            #5;
        end

        $finish;
    end

endmodule
