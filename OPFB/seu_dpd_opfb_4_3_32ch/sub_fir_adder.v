`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/21 12:35:34
// Design Name: 
// Module Name: sub_fir_adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sub_fir_adder(
    input   wire    signed [31:0]  Din0,
    input   wire    signed [31:0]  Din1,
    input   wire    signed [31:0]  Din2,
    input   wire                   clk,
    output  reg     signed [31:0]  Dout
);
reg signed [31:0]    reg0;
reg signed [31:0]    Dout_reg;
always @(posedge clk) begin
    reg0  <= $signed(Din0);
end

always @(posedge clk) begin
    Dout_reg <= $signed(Din1) + $signed(Din2);
    Dout     <= Dout_reg + reg0;
end
endmodule
