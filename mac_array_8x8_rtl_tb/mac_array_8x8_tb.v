`timescale 1ns/1ps

module mac_array_8x8_tb;

    reg clk;
    reg rst;
    reg [7:0] a[7:0];
    reg [7:0] b[7:0];
    wire [15:0] mac_out[7:0];

    wire [15:0] mac_out0, mac_out1, mac_out2, mac_out3, mac_out4, mac_out5, mac_out6, mac_out7;

    mac_array_8x8 uut (
        .clk(clk), .rst(rst),
        .a0(a[0]), .a1(a[1]), .a2(a[2]), .a3(a[3]),
        .a4(a[4]), .a5(a[5]), .a6(a[6]), .a7(a[7]),
        .b0(b[0]), .b1(b[1]), .b2(b[2]), .b3(b[3]),
        .b4(b[4]), .b5(b[5]), .b6(b[6]), .b7(b[7]),
        .mac_out0(mac_out0), .mac_out1(mac_out1), .mac_out2(mac_out2), .mac_out3(mac_out3),
        .mac_out4(mac_out4), .mac_out5(mac_out5), .mac_out6(mac_out6), .mac_out7(mac_out7)
    );

    assign mac_out[0] = mac_out0;
    assign mac_out[1] = mac_out1;
    assign mac_out[2] = mac_out2;
    assign mac_out[3] = mac_out3;
    assign mac_out[4] = mac_out4;
    assign mac_out[5] = mac_out5;
    assign mac_out[6] = mac_out6;
    assign mac_out[7] = mac_out7;

    initial begin
        $dumpfile("mac_array_8x8_tb.vcd");
        $dumpvars(0, mac_array_8x8_tb);
    end

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 1;
        #10 rst = 0;

        // Test Vectors
        a[0] = 8'd10; b[0] = 8'd3;
        a[1] = 8'd20; b[1] = 8'd4;
        a[2] = 8'd30; b[2] = 8'd5;
        a[3] = 8'd40; b[3] = 8'd6;
        a[4] = 8'd50; b[4] = 8'd7;
        a[5] = 8'd60; b[5] = 8'd8;
        a[6] = 8'd70; b[6] = 8'd9;
        a[7] = 8'd80; b[7] = 8'd10;

        #20;
        $display("MAC Output: %d %d %d %d %d %d %d %d", mac_out[0], mac_out[1], mac_out[2], mac_out[3], mac_out[4], mac_out[5], mac_out[6], mac_out[7]);
        #10 $finish;
    end

endmodule
