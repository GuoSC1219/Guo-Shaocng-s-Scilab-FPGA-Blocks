`timescale 1ns / 1ps

module DFT_4P
#(
    parameter   InputWidth = 16
)
(
    input                                       clk,

    input   wire    [InputWidth * 2 - 1 : 0]    Din0, 
    input   wire    [InputWidth * 2 - 1 : 0]    Din1, 
    input   wire    [InputWidth * 2 - 1 : 0]    Din2, 
    input   wire    [InputWidth * 2 - 1 : 0]    Din3,

    output  wire    [(InputWidth + 2) * 2 - 1 : 0]   Dout0,
    output  wire    [(InputWidth + 2) * 2 - 1 : 0]   Dout1,
    output  wire    [(InputWidth + 2) * 2 - 1 : 0]   Dout2,
    output  wire    [(InputWidth + 2) * 2 - 1 : 0]   Dout3
);

reg signed  [InputWidth - 1 : 0]  inReal0;
reg signed  [InputWidth - 1 : 0]  inReal1;
reg signed  [InputWidth - 1 : 0]  inReal2;
reg signed  [InputWidth - 1 : 0]  inReal3;
reg signed  [InputWidth - 1 : 0]  inImag0;
reg signed  [InputWidth - 1 : 0]  inImag1;
reg signed  [InputWidth - 1 : 0]  inImag2;
reg signed  [InputWidth - 1 : 0]  inImag3;

reg signed  [InputWidth + 1 : 0]  outReal0;
reg signed  [InputWidth + 1 : 0]  outReal1;
reg signed  [InputWidth + 1 : 0]  outReal2;
reg signed  [InputWidth + 1 : 0]  outReal3;
reg signed  [InputWidth + 1 : 0]  outImag0;
reg signed  [InputWidth + 1 : 0]  outImag1;
reg signed  [InputWidth + 1 : 0]  outImag2;
reg signed  [InputWidth + 1 : 0]  outImag3;

reg signed  [InputWidth : 0]  regReal0_0;
reg signed  [InputWidth : 0]  regReal1_0;
reg signed  [InputWidth : 0]  regReal2_0;
reg signed  [InputWidth : 0]  regReal3_0;
reg signed  [InputWidth : 0]  regImag0_0;
reg signed  [InputWidth : 0]  regImag1_0;
reg signed  [InputWidth : 0]  regImag2_0;
reg signed  [InputWidth : 0]  regImag3_0;
reg signed  [InputWidth : 0]  regReal0_1;
reg signed  [InputWidth : 0]  regReal1_1;
reg signed  [InputWidth : 0]  regReal2_1;
reg signed  [InputWidth : 0]  regReal3_1;
reg signed  [InputWidth : 0]  regImag0_1;
reg signed  [InputWidth : 0]  regImag1_1;
reg signed  [InputWidth : 0]  regImag2_1;
reg signed  [InputWidth : 0]  regImag3_1;

assign Dout0 = {outImag0, outReal0};
assign Dout1 = {outImag1, outReal1};
assign Dout2 = {outImag2, outReal2};
assign Dout3 = {outImag3, outReal3};

always @(posedge clk) 
begin
    inReal0 <= $signed(Din0[InputWidth - 1 : 0]);
    inImag0 <= $signed(Din0[InputWidth * 2 - 1 : InputWidth]);

    inReal1 <= $signed(Din1[InputWidth - 1 : 0]);
    inImag1 <= $signed(Din1[InputWidth * 2 - 1 : InputWidth]);

    inReal2 <= $signed(Din2[InputWidth - 1 : 0]);
    inImag2 <= $signed(Din2[InputWidth * 2 - 1 : InputWidth]);

    inReal3 <= $signed(Din3[InputWidth - 1 : 0]);
    inImag3 <= $signed(Din3[InputWidth * 2 - 1 : InputWidth]);
end

always @(posedge clk) 
begin
    regReal0_0 <= inReal0 + inReal1;
    regReal1_0 <= inReal0 - inReal2;
    regReal2_0 <= inReal0 - inReal1;
    regReal3_0 <= inReal0 - inImag1;
    regImag0_0 <= inImag0 + inImag1;
    regImag1_0 <= inImag0 - inReal1;
    regImag2_0 <= inImag0 - inImag1;
    regImag3_0 <= inReal1 - inImag2;
    regReal0_1 <= inReal2 + inReal3;
    regReal1_1 <= inImag1 - inImag3;
    regReal2_1 <= inReal2 - inReal3;
    regReal3_1 <= inImag3 - inReal2;
    regImag0_1 <= inImag2 + inImag3;
    regImag1_1 <= inReal3 - inImag2;
    regImag2_1 <= inImag2 - inImag3;
    regImag3_1 <= inImag0 - inReal3;
end

always @(posedge clk) 
begin
    outReal0 <= regReal0_0 + regReal0_1;
    outImag0 <= regImag0_0 + regImag0_1;

    outReal1 <= regReal1_0 + regReal1_1;
    outImag1 <= regImag1_0 + regImag1_1;

    outReal2 <= regReal2_0 + regReal2_1;
    outImag2 <= regImag2_0 + regImag2_1;

    outReal3 <= regReal3_0 + regReal3_1;
    outImag3 <= regImag3_0 + regImag3_1;
end
endmodule
