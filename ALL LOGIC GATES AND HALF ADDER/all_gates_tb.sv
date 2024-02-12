`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/07/2024 10:23:10 PM
// Design Name: 
// Module Name: gates_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
// 4.3: gates_tb
// 4.3: gates_tb

module gates_tb;

   // Inputs
   reg a, b;
   
   // Outputs
   wire y1, y2, y3, y4, y5;

   // Instantiate the gates module
   gates uut (
      .a(a),
      .b(b),
      .y1(y1),
      .y2(y2),
      .y3(y3),
      .y4(y4),
      .y5(y5)
   );


   // Stimulus
   initial begin
      $monitor("Time=%0t a=%b b=%b y1=%b y2=%b y3=%b y4=%b y5=%b", $time, a, b, y1, y2, y3, y4, y5);
  // Test case 4
       a = 1'b0;
       b = 1'b0;
       #200;
      // Test case 1
      a = 1'b0;
      b = 1'b1;
      #200;

      // Test case 2
      a = 1'b1;
      b = 1'b0;
      #200;

      // Test case 3
      a = 1'b1;
      b = 1'b1;
      #200;
   
      $stop;
   end
   
    
endmodule
