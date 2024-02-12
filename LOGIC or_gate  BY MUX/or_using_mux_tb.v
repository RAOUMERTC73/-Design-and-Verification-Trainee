module or_using_mux_tb;
    reg a, b;
    wire y;
    or_using_mux uut(a,b,y);
    initial begin
        a = 0; b = 0;
        #100; 
        a = 0 ; b =1;
        #100;
        a = 1; b = 0;
        #100;
        a = 1; b = 1;
        #100;
        $finish;
    end
    initial $monitor("a=%b b=%b y=%b",a,b,y);
endmodule
