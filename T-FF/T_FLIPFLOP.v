`timescale 1ns / 1ps

module t_ff(
    output reg q,
    input t,
    input rst_n,
    input clk
    );

    always @(posedge clk or  negedge rst_n)
    begin
        if (!rst_n)
        begin
            q <= 0;
        end
        else
        begin
            q <= ~t;
        end
    end
endmodule