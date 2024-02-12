`timescale 1ns / 1ps

module bcd_to_7segment_decoder(bcd,seven);

//Declare inputs,outputs and internal variables.

input [3:0]bcd;// 4-bit BCD input

output reg [6:0]seven;// 7-segment display output

//always block for converting bcd digit into 7 segment format
always @(bcd)
    begin  // 7-segment is anode in fpqa
        case (bcd) //case statement
            0 : seven = 7'b0000001;
            1 : seven = 7'b1001111;
            2 : seven = 7'b0010010;
            3 : seven = 7'b0000110;
            4 : seven = 7'b1001100;
            5 : seven = 7'b0100100;
            6 : seven = 7'b0100000;
            7 : seven = 7'b0001111;
            8 : seven = 7'b0000000;
            9 : seven = 7'b0000100;
            //switch off 7 segment character when the bcd digit is not a decimal number.
            default : seven = 7'b1111111; 
        endcase
    end
endmodule
