module control_unit(
    input clk, rst,
    output reg a_sel, b_sel, PP1_CE, PP2_CE, add, PR_CE, PI_CE
);
    
    parameter S1 = 3'b001,
              S2 = 3'b010,
              S3 = 3'b011,
              S4 = 3'b100,
              S5 = 3'b101;
                 
    reg [2:0] state, next;

    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= S1;
        else
            state <= next;
    end

    always @(*) begin
        next = S1;
        PP1_CE = 0;
        PP2_CE = 0;
        add = 0;
        PR_CE = 0;
        PI_CE = 0;
        a_sel = 0;
        b_sel = 0;
        
        case (state) 
            S1: begin
					if(!rst)
                next = S2;
                PP1_CE = 1;
            end
                
            S2: begin
                next = S3;
                a_sel = 1;
                b_sel = 1;					 
                PP2_CE = 1;
            end
                
            S3: begin
                next = S4;
                b_sel = 1;
                PP1_CE = 1;					
                add = 1;
                PR_CE = 1;
            end
        
            S4: begin
                next = S5;
                a_sel = 1;
                PP2_CE = 1;
            end
        
            S5: begin
                next = S1;
                PI_CE = 1;
            end
        endcase
    end
endmodule
