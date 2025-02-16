module top(
    input rst, clk,
    input [11:0] ar, ai, br, bi,
    output [23:0] Pi, Pr
);
    
    wire PP1_CE, PP2_CE, a_sel, b_sel, add, PI_CE, PR_CE;
    
    control_unit uut1(
        .clk(clk),
        .rst(rst),
        .a_sel(a_sel),
        .b_sel(b_sel),
        .PP1_CE(PP1_CE),
        .PP2_CE(PP2_CE),
        .add(add),
        .PR_CE(PR_CE),
        .PI_CE(PI_CE)
    );
    
    datapath uut2(
        .clk(clk),
        .rst(rst),
        .a_sel(a_sel),
        .b_sel(b_sel),
        .PP1_CE(PP1_CE),
        .PP2_CE(PP2_CE),
        .add(add),
        .PR_CE(PR_CE),
        .PI_CE(PI_CE),
        .ar(ar),
        .ai(ai),
        .br(br),
        .bi(bi),
        .Pr(Pr),
        .Pi(Pi)
    );

endmodule
