`timescale 1ns / 1ps

module encoder_8x3_tb;
    wire [2:0]y;
    reg [7:0]i;
    encoder_8x3_bh dut(y,i);
   
      // Testbench initial block
    initial begin
        // Assign input values to test the priority encoder
        
        // Test Case 1: Input value = 1 (Binary: 00000001)
        i = 8'b00000001;
        #100;

        // Test Case 2: Input value = 2 (Binary: 00000010)
        i = 8'b00000010;
        #100;

        // Test Case 3: Input value = 3 (Binary: 00000011)
        i = 8'b00000100;
        #100;

        // Test Case 4: Input value = 4 (Binary: 00000100)
        i = 8'b00001000;
        #100;

        // Test Case 5: Input value = 5 (Binary: 00000101)
        i = 8'b00010000;
        #1000;
		    // Test Case 6: Input value = 6 (Binary: 00000110)
        i = 8'b00100000;
        #100;

        // Test Case 7: Input value = 7 (Binary: 00000111)
        i = 8'b01000000;
        #100;

        // Test Case 8: Input value = 8 (Binary: 00001000)
        i = 8'b10000000;
        #1000;


        // Terminate simulation
        $finish();
    end
    
endmodule
