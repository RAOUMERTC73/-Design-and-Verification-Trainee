module barrel_bh_tb;

  // Inputs
  reg [7:0] In;
  reg [2:0] n;
  reg Lr;

  // Outputs
  wire [7:0] Out;

  // Instantiate the Barrel Shifter Behavioral module
  barrel_bh dut(
    .Out(Out),
    .In(In),
    .n(n),
    .Lr(Lr)
  );

  // Stimulus
  initial begin
    // Initialize inputs
    In = 8'b10101010;
    n = 3'b001;
    Lr = 0;

    // Test case 1: Left shift
    #20;
    Lr = 1;
    #20;
    
    // Test case 2: Right shift
    n = 3'b010;
    #20;
    Lr = 0;
    #20;
    
    // Test case 3: Another left shift
    n = 3'b101;
    #20;
    Lr = 1;
    #20;
    
    // End simulation
    $finish;
  end

endmodule
