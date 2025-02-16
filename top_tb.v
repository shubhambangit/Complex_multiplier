`timescale 1ns / 1ps

module top_tb;

    // Testbench Signals
    reg clk, rst;
    reg [11:0] ar, ai, br, bi;
    wire [23:0] Pr, Pi;

    // Instantiate the DUT (Device Under Test)
    top uut (
        .clk(clk),
        .rst(rst),
        .ar(ar),
        .ai(ai),
        .br(br),
        .bi(bi),
        .Pr(Pr),
        .Pi(Pi)
    );

    // Clock Generation (50 MHz -> 20ns period)
    always #5 clk = ~clk;  

    // Test Sequence
    initial begin
        $dumpfile("top_tb.vcd");  
        $dumpvars(0, top_tb);  

        // Initialize signals
        clk = 1;
        rst = 1;		  
        ar = 0;
        ai = 0;
        br = 0;
        bi = 0;#10;
        rst=0;
        // Apply test vectors
        #60;
        ar = 12'd15; ai = 12'd10;
        br = 12'd5;  bi = 12'd3;

        #60;
        ar = 12'd8;  ai = 12'd2;
        br = 12'd4;  bi = 12'd7;

        #60;
        ar = 12'd20; ai = 12'd14;
        br = 12'd6;  bi = 12'd9;

        #60;
        
        // End Simulation
        $stop;
    end

    // Monitor changes
    initial begin
        $monitor("Time=%0t | ar=%d, ai=%d, br=%d, bi=%d | Pr=%d, Pi=%d",
                 $time, ar, ai, br, bi, Pr, Pi);
    end

endmodule
