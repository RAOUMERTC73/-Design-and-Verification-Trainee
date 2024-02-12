`timescale 1ns / 1ps

module fs_st(
    output d,bout,
    input a,b,c
    );
wire w1,w2,w3,a_bar;
not n1(a_bar,a);
xor x1(d,a,b,c);
and a1(w1,a_bar,b);
and a2(w2,a_bar,c);
and a3(w3,b,c);                                            
or o1(bout,w1,w2,w3);
endmodule
