`timescale 1ns/1ns
module tb_running_light;

reg sys_clk;
reg sys_rst_n;
wire [3:0] led_out;

running_light dut(
    .sys_clk(sys_clk),
    .sys_rst_n(sys_rst_n),
    .led_out(led_out)
);

initial begin
    sys_clk = 1'b0;
end
always #10 sys_clk = ~sys_clk;

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, tb_running_light);

    sys_rst_n = 1'b0;
    #20;
    sys_rst_n = 1'b1;

    #2000; 
    $finish;
end
endmodule