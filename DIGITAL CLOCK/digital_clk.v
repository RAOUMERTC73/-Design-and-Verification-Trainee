`timescale 1ns / 1ps

module digital_clk(
    input clk,reset,
    output reg [5:0] sec,
    output reg [5:0] min,
    output reg [4:0] hrs
    );
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            sec <= 0;
            min <= 0;
            hrs <= 0;
        end
        else if (clk == 1'b1) begin
            sec = sec + 1;
            if (sec == 60) begin
                sec <= 0;
                min = min + 1;
                if (min == 60) begin
                    min <= 0;
                    hrs = hrs + 1;
                    if (hrs == 24) begin
                        hrs <= 0;
                    end
                end
            end
        end
    end
    
endmodule
