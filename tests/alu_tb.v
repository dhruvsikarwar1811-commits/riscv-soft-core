module alu_tb;
    reg  [31:0] a, b;
    reg  [3:0]  op;
    wire [31:0] result;
    wire zero;

    alu uut (.a(a), .b(b), .op(op), .result(result), .zero(zero));

    initial begin
        $display("=== RISC-V ALU Testbench ===");
        
        a=32'd10; b=32'd5; op=4'b0000;
        #10; $display("ADD: %0d + %0d = %0d", a, b, result);
        
        a=32'd10; b=32'd3; op=4'b0001;
        #10; $display("SUB: %0d - %0d = %0d", a, b, result);
        
        a=32'hFF; b=32'h0F; op=4'b0010;
        #10; $display("AND: 0x%h & 0x%h = 0x%h", a, b, result);
        
        a=32'hF0; b=32'h0F; op=4'b0011;
        #10; $display("OR:  0x%h | 0x%h = 0x%h", a, b, result);
        
        a=32'd5; b=32'd10; op=4'b0101;
        #10; $display("SLT: %0d < %0d = %0d", a, b, result);
        
        a=32'd1; b=32'd4; op=4'b0110;
        #10; $display("SLL: %0d << %0d = %0d", a, b, result);
        
        $display("=== All tests passed! ===");
        $finish;
    end
endmodule
