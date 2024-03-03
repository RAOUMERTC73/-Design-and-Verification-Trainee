module counter_tb;

  // Signals
  reg clk =0;
  reg reset;
  wire [7:0] q; // Assuming 8-bit counter
  // Instantiate the counter module
  counter dut (
    .clk(clk),
    .reset(reset),
    .q(q)
  );
  // Clock generation
  always #5 clk = ~clk; // Assuming a 10ns clock period

  // Reset generation
  initial begin
    reset = 1;
    #20; // Reset for 20 ns
    reset = 0;
  end
  // Stimulus
  initial begin
    // Allow some time for reset to take effect
    #30;
    // Apply additional stimuli here if needed
    // For example, toggling the reset signal
    #100;
    reset = 1;
    #10;
    reset = 0;
   // Run simulation for desired time
    #200;
    // End simulation
    $finish;
  end

endmodule
