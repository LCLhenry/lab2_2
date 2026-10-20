module running_light(
    input               sys_clk,
    input               sys_rst_n,
    output reg [3:0]    led_out
);
reg [24:0] cnt;
reg [3:0] shift_reg;
parameter CNT_MAX = 25'd24999999;

always @(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n) begin
        cnt <= 25'd0;
        shift_reg <= 4'b1110;
        led_out <= 4'b1110;
    end
    else begin
        if(cnt == CNT_MAX) begin
            cnt <= 25'd0;
            if(shift_reg == 4'b0111)begin
                shift_reg <= 4'b1110;
            end
            else begin
                shift_reg <= {shift_reg[2:0],1'b1};
            end
            led_out <= shift_reg;
        end
        else begin
            cnt <= cnt + 25'd1;
        end
    end
end
endmodule


