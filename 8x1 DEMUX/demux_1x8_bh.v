`timescale 1ns / 1ps

module demux_1x8_bh(
    output reg y0, y1, y2, y3, y4, y5, y6, y7,
    input i,
    input [2:0] s
    );
    always @(*) begin
        y0 = (s == 3'b000) ? i : 1'b0;
        y1 = (s == 3'b001) ? i : 1'b0;
        y2 = (s == 3'b010) ? i : 1'b0;
        y3 = (s == 3'b011) ? i : 1'b0;
        y4 = (s == 3'b100) ? i : 1'b0;
        y5 = (s == 3'b101) ? i : 1'b0;
        y6 = (s == 3'b110) ? i : 1'b0;
        y7 = (s == 3'b111) ? i : 1'b0;
    end
endmodule













