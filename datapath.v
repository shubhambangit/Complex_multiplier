module datapath(
    input clk, rst,
    input a_sel, b_sel, PP1_CE, PP2_CE, add, PR_CE, PI_CE,
    input [11:0] ar, ai, br, bi,
    output reg [23:0] Pr, Pi
);

    wire [11:0] a_mux, b_mux;
    reg [23:0] PP1, PP2, PPs;
    wire [23:0] pro;
   
    assign a_mux = a_sel ? ai : ar;
    assign b_mux = b_sel ? bi : br;
        
    assign pro = a_mux * b_mux;  

    // Partial Product Registers with Clock Enables
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            PP1 <= 0;
            PP2 <= 0;
        end else begin
            if (PP1_CE) 
                PP1 <= pro;
            if (PP2_CE) 
                PP2 <= pro;
        end
    end

    // Addition/Subtraction with Clock Enable
    always @(*) begin
        if (!add)
            PPs = PP1 + PP2;
        else
            PPs = PP1 - PP2;
    end

    // Output Registers
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            Pr <= 0;
            Pi <= 0;
        end else begin
            if (PR_CE) 
                Pr <= PPs;
            if (PI_CE) 
                Pi <= PPs;
        end
    end

endmodule
