module dflop(input            clk, 
            input               d, 
            output              q);

  always @(posedge clk)
    q <= d;
endmodule