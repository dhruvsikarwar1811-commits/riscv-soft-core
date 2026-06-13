module regfile (
    input        clk,
    input        we,
    input  [4:0] rs1, rs2, rd,
    input  [31:0] wdata,
    output [31:0] rdata1, rdata2
);
    reg [31:0] regs [0:31];
    integer i;
    
    initial for (i=0; i<32; i=i+1) regs[i] = 32'd0;
    
    // Write (x0 always 0)
    always @(posedge clk)
        if (we && rd != 5'd0) regs[rd] <= wdata;
    
    // Read (async)
    assign rdata1 = (rs1 == 5'd0) ? 32'd0 : regs[rs1];
    assign rdata2 = (rs2 == 5'd0) ? 32'd0 : regs[rs2];

endmodule
