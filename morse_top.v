module morse_top(
    input   clk   ,
    input   rst   ,
    input    sw0,sw1,btn1,btn2,btn3,
    output  led,
    output green,red
    );
    
    wire    clk_div1 ;
    
    morse_main s0(
    .clk    (clk_div1),
	.rst	(rst),
    .sw0   (sw0),
    .sw1   (sw1),
    .btn1   (btn1),
    .btn2   (btn2),
    .btn3   (btn3),
    .out    (led),
    .green  (green),
    .red    (red),
    );
    
    morse_led clk_div_0(
    .clk    (clk),
    .rst    (rst),
    .clk_div    (clk_div1)
    );
    
    
endmodule
