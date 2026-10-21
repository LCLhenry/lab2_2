module running_light #(
    parameter integer CNT_MAX = 25_000_000 - 1
)(
    input  wire       sys_clk,
    input  wire       sys_rst_n,
    output reg  [3:0] led_out
);

    reg [24:0] cnt;

    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (!sys_rst_n) begin
            cnt     <= 25'd0;
            led_out <= 4'b1110;
        end
        else if (cnt == CNT_MAX) begin
            cnt     <= 25'd0;
            led_out <= {led_out[0], led_out[3:1]}; 
        end
        else begin
            cnt <= cnt + 1'b1;
        end
    end
endmodule
