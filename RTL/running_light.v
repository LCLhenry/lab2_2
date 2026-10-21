`timescale 1ns / 1ns

module running_light (
    input  wire sys_clk,
    input  wire sys_rst_n,
    output reg  led0,
    output reg  led1,
    output reg  led2,
    output reg  led3
);

reg [24:0] cnt;
parameter CNT_MAX = 25'd24999999;

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (!sys_rst_n) begin
        cnt  <= 25'd0;
        led0 <= 1'b0;
        led1 <= 1'b1;
        led2 <= 1'b1;
        led3 <= 1'b1;
    end
    else if (cnt == CNT_MAX) begin
        cnt <= 25'd0;
        {led3, led2, led1, led0} <= ({led3, led2, led1, led0} << 1) | ({led3, led2, led1, led0} >> 3);
    end
    else begin
        cnt <= cnt + 25'd1;
    end
end

endmodule


