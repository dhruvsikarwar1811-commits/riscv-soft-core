module cpu (
    input clk, rst,
    output reg [31:0] pc
);
    reg  [31:0] instr_mem [0:255];
    wire [31:0] instr;
    wire [6:0]  opcode;
    wire [4:0]  rd, rs1, rs2;
    wire [2:0]  funct3;
    wire [6:0]  funct7;
    wire [31:0] rdata1, rdata2, alu_out;
    wire [3:0]  alu_op;
    wire        zero;

    assign instr  = instr_mem[pc[9:2]];
    assign opcode = instr[6:0];
    assign rd     = instr[11:7];
    assign funct3 = instr[14:12];
    assign rs1    = instr[19:15];
    assign rs2    = instr[24:20];
    assign funct7 = instr[31:25];
    assign alu_op = {funct7[5], funct3};

    regfile rf (.clk(clk), .we(opcode==7'b0110011),
                .rs1(rs1), .rs2(rs2), .rd(rd),
                .wdata(alu_out),
                .rdata1(rdata1), .rdata2(rdata2));

    alu alu0 (.a(rdata1), .b(rdata2),
              .op(alu_op), .result(alu_out), .zero(zero));

    always @(posedge clk or posedge rst) begin
        if (rst) pc <= 32'd0;
        else     pc <= pc + 32'd4;
    end

    initial begin
        instr_mem[0] = 32'h00000033;
        instr_mem[1] = 32'h00000133;
        instr_mem[2] = 32'h002081B3;
    end
endmodule
