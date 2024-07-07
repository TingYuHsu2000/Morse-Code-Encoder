`timescale 1ns/1ns 
//`include "morse_code.v"
module morse_tb;
//將morse_led中的62500000改成2、31250000改成1，不然需要計算的次數太多無法模擬

    reg clk;
    reg rst;
    reg sw0,sw1,btn1,btn2,btn3;
    wire led,red,green;

    led_morsecode led_morsecode1 (
        .clk(clk),
        .rst(rst),
        .sw0(sw0),
        .sw1(sw1),
        .btn1(btn1),
        .btn2(btn2),
        .btn3(btn3),
        .led(led),
        .red(red),
        .green(green)
    );



    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100 MHz clock
    end

    //reg char_in ;

    // Test sequence
    initial begin
        rst = 1;
        //char_in = ;
        sw0 = 0;
        sw1 = 0;
        btn1 = 0;
        btn2 = 0;
        btn3 = 0;
        #5 
        rst = 10;

        // Test character "A"
        {sw1,sw0,btn3,btn2,btn1} = 5'b00001;
        #200;
        
        // idle
        {sw1,sw0,btn3,btn2,btn1} = 5'b00000;
        #200;
        // Test character "B"
        {sw1,sw0,btn3,btn2,btn1} = 5'b00010;
        #200;
        // idle
        {sw1,sw0,btn3,btn2,btn1} = 5'b00000;
        #200;

        // Wait and finish
        #10;
        $finish;
    end

    // Monitor the signals
    initial
        $monitor("Time: %0d, led: %b", $time, led);

endmodule