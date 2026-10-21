`timescale 1ns / 1ps

module tb_running_light();

    reg sys_clk;
    reg sys_rst_n;
    wire [3:0] led_out;

    running_light #( .CNT_MAX(4) ) u_running_light (
        .sys_clk   (sys_clk),
        .sys_rst_n (sys_rst_n),
        .led_out   (led_out)
    );

    initial begin
        sys_clk = 0;
        forever #10 sys_clk = ~sys_clk; 
    end

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_running_light);

        sys_rst_n = 0;
        #50;
        sys_rst_n = 1;
        #500;
        
        sys_rst_n = 0;
        #30;
        sys_rst_n = 1;
        #200;

        $finish;
    end

endmodule