module cpu_tb;
    reg clk, rst;
    wire [31:0] pc;

    cpu uut (.clk(clk), .rst(rst), .pc(pc));

    always #5 clk = ~clk;

    initial begin
        clk=0; rst=1;
        #10 rst=0;
        $display("=== RISC-V CPU Simulation ===");
        repeat(5) begin
            #10 $display("PC = 0x%08h", pc);
        end
        $display("=== CPU running! ===");
        $finish;
    end
endmodule
