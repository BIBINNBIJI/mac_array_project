// Converted from SystemVerilog to Verilog

module mac_array_8x8 (
    input clk,
    input rst,
    input [7:0] a0, input [7:0] a1, input [7:0] a2, input [7:0] a3,
    input [7:0] a4, input [7:0] a5, input [7:0] a6, input [7:0] a7,
    input [7:0] b0, input [7:0] b1, input [7:0] b2, input [7:0] b3,
    input [7:0] b4, input [7:0] b5, input [7:0] b6, input [7:0] b7,
    output reg [15:0] mac_out0, output reg [15:0] mac_out1, output reg [15:0] mac_out2, output reg [15:0] mac_out3,
    output reg [15:0] mac_out4, output reg [15:0] mac_out5, output reg [15:0] mac_out6, output reg [15:0] mac_out7
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            mac_out0 <= 16'd0;
            mac_out1 <= 16'd0;
            mac_out2 <= 16'd0;
            mac_out3 <= 16'd0;
            mac_out4 <= 16'd0;
            mac_out5 <= 16'd0;
            mac_out6 <= 16'd0;
            mac_out7 <= 16'd0;
        end else begin
            mac_out0 <= a0 * b0;
            mac_out1 <= a1 * b1;
            mac_out2 <= a2 * b2;
            mac_out3 <= a3 * b3;
            mac_out4 <= a4 * b4;
            mac_out5 <= a5 * b5;
            mac_out6 <= a6 * b6;
            mac_out7 <= a7 * b7;
        end
    end

endmodule