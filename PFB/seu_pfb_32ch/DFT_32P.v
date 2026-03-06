`timescale 1ns / 1ps
module DFT_32P(
    input                   clk,
    input   wire    [31:0]  Din00,
    input   wire    [31:0]  Din01,
    input   wire    [31:0]  Din02,
    input   wire    [31:0]  Din03,
    input   wire    [31:0]  Din04,
    input   wire    [31:0]  Din05,
    input   wire    [31:0]  Din06,
    input   wire    [31:0]  Din07,
    input   wire    [31:0]  Din08,
    input   wire    [31:0]  Din09,
    input   wire    [31:0]  Din10,
    input   wire    [31:0]  Din11,
    input   wire    [31:0]  Din12,
    input   wire    [31:0]  Din13,
    input   wire    [31:0]  Din14,
    input   wire    [31:0]  Din15,
    input   wire    [31:0]  Din16,
    input   wire    [31:0]  Din17,
    input   wire    [31:0]  Din18,
    input   wire    [31:0]  Din19,
    input   wire    [31:0]  Din20,
    input   wire    [31:0]  Din21,
    input   wire    [31:0]  Din22,
    input   wire    [31:0]  Din23,
    input   wire    [31:0]  Din24,
    input   wire    [31:0]  Din25,
    input   wire    [31:0]  Din26,
    input   wire    [31:0]  Din27,
    input   wire    [31:0]  Din28,
    input   wire    [31:0]  Din29,
    input   wire    [31:0]  Din30,
    input   wire    [31:0]  Din31,
    output  wire    [75:0]  Dout00,
    output  wire    [75:0]  Dout01,
    output  wire    [75:0]  Dout02,
    output  wire    [75:0]  Dout03,
    output  wire    [75:0]  Dout04,
    output  wire    [75:0]  Dout05,
    output  wire    [75:0]  Dout06,
    output  wire    [75:0]  Dout07,
    output  wire    [75:0]  Dout08,
    output  wire    [75:0]  Dout09,
    output  wire    [75:0]  Dout10,
    output  wire    [75:0]  Dout11,
    output  wire    [75:0]  Dout12,
    output  wire    [75:0]  Dout13,
    output  wire    [75:0]  Dout14,
    output  wire    [75:0]  Dout15,
    output  wire    [75:0]  Dout16,
    output  wire    [75:0]  Dout17,
    output  wire    [75:0]  Dout18,
    output  wire    [75:0]  Dout19,
    output  wire    [75:0]  Dout20,
    output  wire    [75:0]  Dout21,
    output  wire    [75:0]  Dout22,
    output  wire    [75:0]  Dout23,
    output  wire    [75:0]  Dout24,
    output  wire    [75:0]  Dout25,
    output  wire    [75:0]  Dout26,
    output  wire    [75:0]  Dout27,
    output  wire    [75:0]  Dout28,
    output  wire    [75:0]  Dout29,
    output  wire    [75:0]  Dout30,
    output  wire    [75:0]  Dout31
);

wire    [101:0]  Dout_0_00;
wire    [101:0]  Dout_0_01;
wire    [101:0]  Dout_0_02;
wire    [101:0]  Dout_0_03;
wire    [101:0]  Dout_0_04;
wire    [101:0]  Dout_0_05;
wire    [101:0]  Dout_0_06;
wire    [101:0]  Dout_0_07;
wire    [101:0]  Dout_0_08;
wire    [101:0]  Dout_0_09;
wire    [101:0]  Dout_0_10;
wire    [101:0]  Dout_0_11;
wire    [101:0]  Dout_0_12;
wire    [101:0]  Dout_0_13;
wire    [101:0]  Dout_0_14;
wire    [101:0]  Dout_0_15;
wire    [101:0]  Dout_1_00;
wire    [101:0]  Dout_1_01;
wire    [101:0]  Dout_1_02;
wire    [101:0]  Dout_1_03;
wire    [101:0]  Dout_1_04;
wire    [101:0]  Dout_1_05;
wire    [101:0]  Dout_1_06;
wire    [101:0]  Dout_1_07;
wire    [101:0]  Dout_1_08;
wire    [101:0]  Dout_1_09;
wire    [101:0]  Dout_1_10;
wire    [101:0]  Dout_1_11;
wire    [101:0]  Dout_1_12;
wire    [101:0]  Dout_1_13;
wire    [101:0]  Dout_1_14;
wire    [101:0]  Dout_1_15;


DFT_16P DFT_16P_0(
    .clk        (clk),
    .Din00      (Din00),
    .Din01      (Din02),
    .Din02      (Din04),
    .Din03      (Din06),
    .Din04      (Din08),
    .Din05      (Din10),
    .Din06      (Din12),
    .Din07      (Din14),
    .Din08      (Din16),
    .Din09      (Din18),
    .Din10      (Din20),
    .Din11      (Din22),
    .Din12      (Din24),
    .Din13      (Din26),
    .Din14      (Din28),
    .Din15      (Din30),
    .Dout_00    (Dout_0_00),
    .Dout_01    (Dout_0_01),
    .Dout_02    (Dout_0_02),
    .Dout_03    (Dout_0_03),
    .Dout_04    (Dout_0_04),
    .Dout_05    (Dout_0_05),
    .Dout_06    (Dout_0_06),
    .Dout_07    (Dout_0_07),
    .Dout_08    (Dout_0_08),
    .Dout_09    (Dout_0_09),
    .Dout_10    (Dout_0_10),
    .Dout_11    (Dout_0_11),
    .Dout_12    (Dout_0_12),
    .Dout_13    (Dout_0_13),
    .Dout_14    (Dout_0_14),
    .Dout_15    (Dout_0_15)
);

DFT_16P DFT_16P_1(
    .clk        (clk),
    .Din00      (Din01),
    .Din01      (Din03),
    .Din02      (Din05),
    .Din03      (Din07),
    .Din04      (Din09),
    .Din05      (Din11),
    .Din06      (Din13),
    .Din07      (Din15),
    .Din08      (Din17),
    .Din09      (Din19),
    .Din10      (Din21),
    .Din11      (Din23),
    .Din12      (Din25),
    .Din13      (Din27),
    .Din14      (Din29),
    .Din15      (Din31),
    .Dout_00    (Dout_1_00),
    .Dout_01    (Dout_1_01),
    .Dout_02    (Dout_1_02),
    .Dout_03    (Dout_1_03),
    .Dout_04    (Dout_1_04),
    .Dout_05    (Dout_1_05),
    .Dout_06    (Dout_1_06),
    .Dout_07    (Dout_1_07),
    .Dout_08    (Dout_1_08),
    .Dout_09    (Dout_1_09),
    .Dout_10    (Dout_1_10),
    .Dout_11    (Dout_1_11),
    .Dout_12    (Dout_1_12),
    .Dout_13    (Dout_1_13),
    .Dout_14    (Dout_1_14),
    .Dout_15    (Dout_1_15)
);

wire    [79:0]  dout_c_0_00;
wire    [79:0]  dout_c_0_01;
wire    [79:0]  dout_c_0_02;
wire    [79:0]  dout_c_0_03;
wire    [79:0]  dout_c_0_04;
wire    [79:0]  dout_c_0_05;
wire    [79:0]  dout_c_0_06;
wire    [79:0]  dout_c_0_07;
wire    [79:0]  dout_c_0_08;
wire    [79:0]  dout_c_0_09;
wire    [79:0]  dout_c_0_10;
wire    [79:0]  dout_c_0_11;
wire    [79:0]  dout_c_0_12;
wire    [79:0]  dout_c_0_13;
wire    [79:0]  dout_c_0_14;
wire    [79:0]  dout_c_0_15;
wire    [79:0]  dout_c_1_00;
wire    [79:0]  dout_c_1_01;
wire    [79:0]  dout_c_1_02;
wire    [79:0]  dout_c_1_03;
wire    [79:0]  dout_c_1_04;
wire    [79:0]  dout_c_1_05;
wire    [79:0]  dout_c_1_06;
wire    [79:0]  dout_c_1_07;
wire    [79:0]  dout_c_1_08;
wire    [79:0]  dout_c_1_09;
wire    [79:0]  dout_c_1_10;
wire    [79:0]  dout_c_1_11;
wire    [79:0]  dout_c_1_12;
wire    [79:0]  dout_c_1_13;
wire    [79:0]  dout_c_1_14;
wire    [79:0]  dout_c_1_15;

cmpy_0 cmpy_0_00 (
  .aclk(clk),
  .s_axis_a_tvalid(1'd1),
  .s_axis_a_tdata({ {5{Dout_0_00[101]}}, Dout_0_00[101:51], {5{Dout_0_00[50]}}, Dout_0_00[50:0] }),
  .s_axis_b_tvalid(1'd1),
  .s_axis_b_tdata({32'h0,32'h7FFFFFFF}),
  .m_axis_dout_tvalid(),
  .m_axis_dout_tdata(dout_c_0_00)
);
cmpy_0 cmpy_0_01 (
  .aclk(clk),
  .s_axis_a_tvalid(1'd1),
  .s_axis_a_tdata({ {5{Dout_0_01[101]}}, Dout_0_01[101:51], {5{Dout_0_01[50]}}, Dout_0_01[50:0] }),
  .s_axis_b_tvalid(1'd1),
  .s_axis_b_tdata({32'h0,32'h7FFFFFFF}),
  .m_axis_dout_tvalid(),
  .m_axis_dout_tdata(dout_c_0_01)
);
cmpy_0 cmpy_0_02 (
  .aclk(clk),
  .s_axis_a_tvalid(1'd1),
  .s_axis_a_tdata({ {5{Dout_0_02[101]}}, Dout_0_02[101:51], {5{Dout_0_02[50]}}, Dout_0_02[50:0] }),
  .s_axis_b_tvalid(1'd1),
  .s_axis_b_tdata({32'h0,32'h7FFFFFFF}),
  .m_axis_dout_tvalid(),
  .m_axis_dout_tdata(dout_c_0_02)
);
cmpy_0 cmpy_0_03 (
  .aclk(clk),
  .s_axis_a_tvalid(1'd1),
  .s_axis_a_tdata({ {5{Dout_0_03[101]}}, Dout_0_03[101:51], {5{Dout_0_03[50]}}, Dout_0_03[50:0] }),
  .s_axis_b_tvalid(1'd1),
  .s_axis_b_tdata({32'h0,32'h7FFFFFFF}),
  .m_axis_dout_tvalid(),
  .m_axis_dout_tdata(dout_c_0_03)
);
cmpy_0 cmpy_0_04 (
  .aclk(clk),
  .s_axis_a_tvalid(1'd1),
  .s_axis_a_tdata({ {5{Dout_0_04[101]}}, Dout_0_04[101:51], {5{Dout_0_04[50]}}, Dout_0_04[50:0] }),
  .s_axis_b_tvalid(1'd1),
  .s_axis_b_tdata({32'h0,32'h7FFFFFFF}),
  .m_axis_dout_tvalid(),
  .m_axis_dout_tdata(dout_c_0_04)
);
cmpy_0 cmpy_0_05 (
  .aclk(clk),
  .s_axis_a_tvalid(1'd1),
  .s_axis_a_tdata({ {5{Dout_0_05[101]}}, Dout_0_05[101:51], {5{Dout_0_05[50]}}, Dout_0_05[50:0] }),
  .s_axis_b_tvalid(1'd1),
  .s_axis_b_tdata({32'h0,32'h7FFFFFFF}),
  .m_axis_dout_tvalid(),
  .m_axis_dout_tdata(dout_c_0_05)
);
cmpy_0 cmpy_0_06 (
  .aclk(clk),
  .s_axis_a_tvalid(1'd1),
  .s_axis_a_tdata({ {5{Dout_0_06[101]}}, Dout_0_06[101:51], {5{Dout_0_06[50]}}, Dout_0_06[50:0] }),
  .s_axis_b_tvalid(1'd1),
  .s_axis_b_tdata({32'h0,32'h7FFFFFFF}),
  .m_axis_dout_tvalid(),
  .m_axis_dout_tdata(dout_c_0_06)
);
cmpy_0 cmpy_0_07 (
  .aclk(clk),
  .s_axis_a_tvalid(1'd1),
  .s_axis_a_tdata({ {5{Dout_0_07[101]}}, Dout_0_07[101:51], {5{Dout_0_07[50]}}, Dout_0_07[50:0] }),
  .s_axis_b_tvalid(1'd1),
  .s_axis_b_tdata({32'h0,32'h7FFFFFFF}),
  .m_axis_dout_tvalid(),
  .m_axis_dout_tdata(dout_c_0_07)
);
cmpy_0 cmpy_0_08 (
  .aclk(clk),
  .s_axis_a_tvalid(1'd1),
  .s_axis_a_tdata({ {5{Dout_0_08[101]}}, Dout_0_08[101:51], {5{Dout_0_08[50]}}, Dout_0_08[50:0] }),
  .s_axis_b_tvalid(1'd1),
  .s_axis_b_tdata({32'h0,32'h7FFFFFFF}),
  .m_axis_dout_tvalid(),
  .m_axis_dout_tdata(dout_c_0_08)
);
cmpy_0 cmpy_0_09 (
  .aclk(clk),
  .s_axis_a_tvalid(1'd1),
  .s_axis_a_tdata({ {5{Dout_0_09[101]}}, Dout_0_09[101:51], {5{Dout_0_09[50]}}, Dout_0_09[50:0] }),
  .s_axis_b_tvalid(1'd1),
  .s_axis_b_tdata({32'h0,32'h7FFFFFFF}),
  .m_axis_dout_tvalid(),
  .m_axis_dout_tdata(dout_c_0_09)
);
cmpy_0 cmpy_0_10 (
  .aclk(clk),
  .s_axis_a_tvalid(1'd1),
  .s_axis_a_tdata({ {5{Dout_0_10[101]}}, Dout_0_10[101:51], {5{Dout_0_10[50]}}, Dout_0_10[50:0] }),
  .s_axis_b_tvalid(1'd1),
  .s_axis_b_tdata({32'h0,32'h7FFFFFFF}),
  .m_axis_dout_tvalid(),
  .m_axis_dout_tdata(dout_c_0_10)
);
cmpy_0 cmpy_0_11 (
  .aclk(clk),
  .s_axis_a_tvalid(1'd1),
  .s_axis_a_tdata({ {5{Dout_0_11[101]}}, Dout_0_11[101:51], {5{Dout_0_11[50]}}, Dout_0_11[50:0] }),
  .s_axis_b_tvalid(1'd1),
  .s_axis_b_tdata({32'h0,32'h7FFFFFFF}),
  .m_axis_dout_tvalid(),
  .m_axis_dout_tdata(dout_c_0_11)
);
cmpy_0 cmpy_0_12 (
  .aclk(clk),
  .s_axis_a_tvalid(1'd1),
  .s_axis_a_tdata({ {5{Dout_0_12[101]}}, Dout_0_12[101:51], {5{Dout_0_12[50]}}, Dout_0_12[50:0] }),
  .s_axis_b_tvalid(1'd1),
  .s_axis_b_tdata({32'h0,32'h7FFFFFFF}),
  .m_axis_dout_tvalid(),
  .m_axis_dout_tdata(dout_c_0_12)
);
cmpy_0 cmpy_0_13 (
  .aclk(clk),
  .s_axis_a_tvalid(1'd1),
  .s_axis_a_tdata({ {5{Dout_0_13[101]}}, Dout_0_13[101:51], {5{Dout_0_13[50]}}, Dout_0_13[50:0] }),
  .s_axis_b_tvalid(1'd1),
  .s_axis_b_tdata({32'h0,32'h7FFFFFFF}),
  .m_axis_dout_tvalid(),
  .m_axis_dout_tdata(dout_c_0_13)
);
cmpy_0 cmpy_0_14 (
  .aclk(clk),
  .s_axis_a_tvalid(1'd1),
  .s_axis_a_tdata({ {5{Dout_0_14[101]}}, Dout_0_14[101:51], {5{Dout_0_14[50]}}, Dout_0_14[50:0] }),
  .s_axis_b_tvalid(1'd1),
  .s_axis_b_tdata({32'h0,32'h7FFFFFFF}),
  .m_axis_dout_tvalid(),
  .m_axis_dout_tdata(dout_c_0_14)
);
cmpy_0 cmpy_0_15 (
  .aclk(clk),
  .s_axis_a_tvalid(1'd1),
  .s_axis_a_tdata({ {5{Dout_0_15[101]}}, Dout_0_15[101:51], {5{Dout_0_15[50]}}, Dout_0_15[50:0] }),
  .s_axis_b_tvalid(1'd1),
  .s_axis_b_tdata({32'h0,32'h7FFFFFFF}),
  .m_axis_dout_tvalid(),
  .m_axis_dout_tdata(dout_c_0_15)
);
cmpy_0 cmpy_1_00 (
  .aclk(clk),
  .s_axis_a_tvalid(1'd1),
  .s_axis_a_tdata({ {5{Dout_1_00[101]}}, Dout_1_00[101:51], {5{Dout_1_00[50]}}, Dout_1_00[50:0] }),
  .s_axis_b_tvalid(1'd1),
  .s_axis_b_tdata({32'h0,32'h7FFFFFFF}),
  .m_axis_dout_tvalid(),
  .m_axis_dout_tdata(dout_c_1_00)
);
cmpy_0 cmpy_1_01 (
  .aclk(clk),
  .s_axis_a_tvalid(1'd1),
  .s_axis_a_tdata({ {5{Dout_1_01[101]}}, Dout_1_01[101:51], {5{Dout_1_01[50]}}, Dout_1_01[50:0] }),
  .s_axis_b_tvalid(1'd1),
  .s_axis_b_tdata({32'hE70747C4,32'h7D8A5F3F}),
  .m_axis_dout_tvalid(),
  .m_axis_dout_tdata(dout_c_1_01)
);
cmpy_0 cmpy_1_02 (
  .aclk(clk),
  .s_axis_a_tvalid(1'd1),
  .s_axis_a_tdata({ {5{Dout_1_02[101]}}, Dout_1_02[101:51], {5{Dout_1_02[50]}}, Dout_1_02[50:0] }),
  .s_axis_b_tvalid(1'd1),
  .s_axis_b_tdata({32'hCF043AB3,32'h7641AF3C}),
  .m_axis_dout_tvalid(),
  .m_axis_dout_tdata(dout_c_1_02)
);
cmpy_0 cmpy_1_03 (
  .aclk(clk),
  .s_axis_a_tvalid(1'd1),
  .s_axis_a_tdata({ {5{Dout_1_03[101]}}, Dout_1_03[101:51], {5{Dout_1_03[50]}}, Dout_1_03[50:0] }),
  .s_axis_b_tvalid(1'd1),
  .s_axis_b_tdata({32'hB8E3131A,32'H6A6D98A3}),
  .m_axis_dout_tvalid(),
  .m_axis_dout_tdata(dout_c_1_03)
);
cmpy_0 cmpy_1_04 (
  .aclk(clk),
  .s_axis_a_tvalid(1'd1),
  .s_axis_a_tdata({ {5{Dout_1_04[101]}}, Dout_1_04[101:51], {5{Dout_1_04[50]}}, Dout_1_04[50:0] }),
  .s_axis_b_tvalid(1'd1),
  .s_axis_b_tdata({32'hA57D8667,32'h5A827999}),
  .m_axis_dout_tvalid(),
  .m_axis_dout_tdata(dout_c_1_04)
);
cmpy_0 cmpy_1_05 (
  .aclk(clk),
  .s_axis_a_tvalid(1'd1),
  .s_axis_a_tdata({ {5{Dout_1_05[101]}}, Dout_1_05[101:51], {5{Dout_1_05[50]}}, Dout_1_05[50:0] }),
  .s_axis_b_tvalid(1'd1),
  .s_axis_b_tdata({32'h9592675D,32'h471CECE6}),
  .m_axis_dout_tvalid(),
  .m_axis_dout_tdata(dout_c_1_05)
);
cmpy_0 cmpy_1_06 (
  .aclk(clk),
  .s_axis_a_tvalid(1'd1),
  .s_axis_a_tdata({ {5{Dout_1_06[101]}}, Dout_1_06[101:51], {5{Dout_1_06[50]}}, Dout_1_06[50:0] }),
  .s_axis_b_tvalid(1'd1),
  .s_axis_b_tdata({32'h89BE50C4,32'h30FBC54D}),
  .m_axis_dout_tvalid(),
  .m_axis_dout_tdata(dout_c_1_06)
);
cmpy_0 cmpy_1_07 (
  .aclk(clk),
  .s_axis_a_tvalid(1'd1),
  .s_axis_a_tdata({ {5{Dout_1_07[101]}}, Dout_1_07[101:51], {5{Dout_1_07[50]}}, Dout_1_07[50:0] }),
  .s_axis_b_tvalid(1'd1),
  .s_axis_b_tdata({32'h8275A0C1,32'h18F8B83C}),
  .m_axis_dout_tvalid(),
  .m_axis_dout_tdata(dout_c_1_07)
);
cmpy_0 cmpy_1_08 (
  .aclk(clk),
  .s_axis_a_tvalid(1'd1),
  .s_axis_a_tdata({ {5{Dout_1_08[101]}}, Dout_1_08[101:51], {5{Dout_1_08[50]}}, Dout_1_08[50:0] }),
  .s_axis_b_tvalid(1'd1),
  .s_axis_b_tdata({32'h80000001,32'h0}),
  .m_axis_dout_tvalid(),
  .m_axis_dout_tdata(dout_c_1_08)
);
cmpy_0 cmpy_1_09 (
  .aclk(clk),
  .s_axis_a_tvalid(1'd1),
  .s_axis_a_tdata({ {5{Dout_1_09[101]}}, Dout_1_09[101:51], {5{Dout_1_09[50]}}, Dout_1_09[50:0] }),
  .s_axis_b_tvalid(1'd1),
  .s_axis_b_tdata({32'h8275A0C1,32'hE70747C4}),
  .m_axis_dout_tvalid(),
  .m_axis_dout_tdata(dout_c_1_09)
);
cmpy_0 cmpy_1_10 (
  .aclk(clk),
  .s_axis_a_tvalid(1'd1),
  .s_axis_a_tdata({ {5{Dout_1_10[101]}}, Dout_1_10[101:51], {5{Dout_1_10[50]}}, Dout_1_10[50:0] }),
  .s_axis_b_tvalid(1'd1),
  .s_axis_b_tdata({32'h89BE50C4,32'hCF043AB3}),
  .m_axis_dout_tvalid(),
  .m_axis_dout_tdata(dout_c_1_10)
);
cmpy_0 cmpy_1_11 (
  .aclk(clk),
  .s_axis_a_tvalid(1'd1),
  .s_axis_a_tdata({ {5{Dout_1_11[101]}}, Dout_1_11[101:51], {5{Dout_1_11[50]}}, Dout_1_11[50:0] }),
  .s_axis_b_tvalid(1'd1),
  .s_axis_b_tdata({32'h9592675D,32'hB8E3131A}),
  .m_axis_dout_tvalid(),
  .m_axis_dout_tdata(dout_c_1_11)
);
cmpy_0 cmpy_1_12 (
  .aclk(clk),
  .s_axis_a_tvalid(1'd1),
  .s_axis_a_tdata({ {5{Dout_1_12[101]}}, Dout_1_12[101:51], {5{Dout_1_12[50]}}, Dout_1_12[50:0] }),
  .s_axis_b_tvalid(1'd1),
  .s_axis_b_tdata({32'hA57D8667,32'hA57D8667}),
  .m_axis_dout_tvalid(),
  .m_axis_dout_tdata(dout_c_1_12)
);
cmpy_0 cmpy_1_13 (
  .aclk(clk),
  .s_axis_a_tvalid(1'd1),
  .s_axis_a_tdata({ {5{Dout_1_13[101]}}, Dout_1_13[101:51], {5{Dout_1_13[50]}}, Dout_1_13[50:0] }),
  .s_axis_b_tvalid(1'd1),
  .s_axis_b_tdata({32'hB8E3131A,32'h9592675D}),
  .m_axis_dout_tvalid(),
  .m_axis_dout_tdata(dout_c_1_13)
);
cmpy_0 cmpy_1_14 (
  .aclk(clk),
  .s_axis_a_tvalid(1'd1),
  .s_axis_a_tdata({ {5{Dout_1_14[101]}}, Dout_1_14[101:51], {5{Dout_1_14[50]}}, Dout_1_14[50:0] }),
  .s_axis_b_tvalid(1'd1),
  .s_axis_b_tdata({32'hCF043AB3,32'h89BE50C4}),
  .m_axis_dout_tvalid(),
  .m_axis_dout_tdata(dout_c_1_14)
);
cmpy_0 cmpy_1_15 (
  .aclk(clk),
  .s_axis_a_tvalid(1'd1),
  .s_axis_a_tdata({ {5{Dout_1_15[101]}}, Dout_1_15[101:51], {5{Dout_1_15[50]}}, Dout_1_15[50:0] }),
  .s_axis_b_tvalid(1'd1),
  .s_axis_b_tdata({32'hE70747C4,32'h8275A0C1}),
  .m_axis_dout_tvalid(),
  .m_axis_dout_tdata(dout_c_1_15)
);

reg signed    [40:0]  Dout00_R;
reg signed    [40:0]  Dout00_I;
reg signed    [40:0]  Dout01_R;
reg signed    [40:0]  Dout01_I;
reg signed    [40:0]  Dout02_R;
reg signed    [40:0]  Dout02_I;
reg signed    [40:0]  Dout03_R;
reg signed    [40:0]  Dout03_I;
reg signed    [40:0]  Dout04_R;
reg signed    [40:0]  Dout04_I;
reg signed    [40:0]  Dout05_R;
reg signed    [40:0]  Dout05_I;
reg signed    [40:0]  Dout06_R;
reg signed    [40:0]  Dout06_I;
reg signed    [40:0]  Dout07_R;
reg signed    [40:0]  Dout07_I;
reg signed    [40:0]  Dout08_R;
reg signed    [40:0]  Dout08_I;
reg signed    [40:0]  Dout09_R;
reg signed    [40:0]  Dout09_I;
reg signed    [40:0]  Dout10_R;
reg signed    [40:0]  Dout10_I;
reg signed    [40:0]  Dout11_R;
reg signed    [40:0]  Dout11_I;
reg signed    [40:0]  Dout12_R;
reg signed    [40:0]  Dout12_I;
reg signed    [40:0]  Dout13_R;
reg signed    [40:0]  Dout13_I;
reg signed    [40:0]  Dout14_R;
reg signed    [40:0]  Dout14_I;
reg signed    [40:0]  Dout15_R;
reg signed    [40:0]  Dout15_I;
reg signed    [40:0]  Dout16_R;
reg signed    [40:0]  Dout16_I;
reg signed    [40:0]  Dout17_R;
reg signed    [40:0]  Dout17_I;
reg signed    [40:0]  Dout18_R;
reg signed    [40:0]  Dout18_I;
reg signed    [40:0]  Dout19_R;
reg signed    [40:0]  Dout19_I;
reg signed    [40:0]  Dout20_R;
reg signed    [40:0]  Dout20_I;
reg signed    [40:0]  Dout21_R;
reg signed    [40:0]  Dout21_I;
reg signed    [40:0]  Dout22_R;
reg signed    [40:0]  Dout22_I;
reg signed    [40:0]  Dout23_R;
reg signed    [40:0]  Dout23_I;
reg signed    [40:0]  Dout24_R;
reg signed    [40:0]  Dout24_I;
reg signed    [40:0]  Dout25_R;
reg signed    [40:0]  Dout25_I;
reg signed    [40:0]  Dout26_R;
reg signed    [40:0]  Dout26_I;
reg signed    [40:0]  Dout27_R;
reg signed    [40:0]  Dout27_I;
reg signed    [40:0]  Dout28_R;
reg signed    [40:0]  Dout28_I;
reg signed    [40:0]  Dout29_R;
reg signed    [40:0]  Dout29_I;
reg signed    [40:0]  Dout30_R;
reg signed    [40:0]  Dout30_I;
reg signed    [40:0]  Dout31_R;
reg signed    [40:0]  Dout31_I;

always @(posedge clk) begin
    Dout00_I    <= $signed(dout_c_0_00[79:40]) + $signed(dout_c_1_00[79:40]);
    Dout01_I    <= $signed(dout_c_0_01[79:40]) + $signed(dout_c_1_01[79:40]);
    Dout02_I    <= $signed(dout_c_0_02[79:40]) + $signed(dout_c_1_02[79:40]);
    Dout03_I    <= $signed(dout_c_0_03[79:40]) + $signed(dout_c_1_03[79:40]);
    Dout04_I    <= $signed(dout_c_0_04[79:40]) + $signed(dout_c_1_04[79:40]);
    Dout05_I    <= $signed(dout_c_0_05[79:40]) + $signed(dout_c_1_05[79:40]);
    Dout06_I    <= $signed(dout_c_0_06[79:40]) + $signed(dout_c_1_06[79:40]);
    Dout07_I    <= $signed(dout_c_0_07[79:40]) + $signed(dout_c_1_07[79:40]);
    Dout08_I    <= $signed(dout_c_0_08[79:40]) + $signed(dout_c_1_08[79:40]);
    Dout09_I    <= $signed(dout_c_0_09[79:40]) + $signed(dout_c_1_09[79:40]);
    Dout10_I    <= $signed(dout_c_0_10[79:40]) + $signed(dout_c_1_10[79:40]);
    Dout11_I    <= $signed(dout_c_0_11[79:40]) + $signed(dout_c_1_11[79:40]);
    Dout12_I    <= $signed(dout_c_0_12[79:40]) + $signed(dout_c_1_12[79:40]);
    Dout13_I    <= $signed(dout_c_0_13[79:40]) + $signed(dout_c_1_13[79:40]);
    Dout14_I    <= $signed(dout_c_0_14[79:40]) + $signed(dout_c_1_14[79:40]);
    Dout15_I    <= $signed(dout_c_0_15[79:40]) + $signed(dout_c_1_15[79:40]);
    Dout16_I    <= $signed(dout_c_0_00[79:40]) - $signed(dout_c_1_00[79:40]);
    Dout17_I    <= $signed(dout_c_0_01[79:40]) - $signed(dout_c_1_01[79:40]);
    Dout18_I    <= $signed(dout_c_0_02[79:40]) - $signed(dout_c_1_02[79:40]);
    Dout19_I    <= $signed(dout_c_0_03[79:40]) - $signed(dout_c_1_03[79:40]);
    Dout20_I    <= $signed(dout_c_0_04[79:40]) - $signed(dout_c_1_04[79:40]);
    Dout21_I    <= $signed(dout_c_0_05[79:40]) - $signed(dout_c_1_05[79:40]);
    Dout22_I    <= $signed(dout_c_0_06[79:40]) - $signed(dout_c_1_06[79:40]);
    Dout23_I    <= $signed(dout_c_0_07[79:40]) - $signed(dout_c_1_07[79:40]);
    Dout24_I    <= $signed(dout_c_0_08[79:40]) - $signed(dout_c_1_08[79:40]);
    Dout25_I    <= $signed(dout_c_0_09[79:40]) - $signed(dout_c_1_09[79:40]);
    Dout26_I    <= $signed(dout_c_0_10[79:40]) - $signed(dout_c_1_10[79:40]);
    Dout27_I    <= $signed(dout_c_0_11[79:40]) - $signed(dout_c_1_11[79:40]);
    Dout28_I    <= $signed(dout_c_0_12[79:40]) - $signed(dout_c_1_12[79:40]);
    Dout29_I    <= $signed(dout_c_0_13[79:40]) - $signed(dout_c_1_13[79:40]);
    Dout30_I    <= $signed(dout_c_0_14[79:40]) - $signed(dout_c_1_14[79:40]);
    Dout31_I    <= $signed(dout_c_0_15[79:40]) - $signed(dout_c_1_15[79:40]);
    Dout00_R    <= $signed(dout_c_0_00[39:0]) + $signed(dout_c_1_00[39:0]);
    Dout01_R    <= $signed(dout_c_0_01[39:0]) + $signed(dout_c_1_01[39:0]);
    Dout02_R    <= $signed(dout_c_0_02[39:0]) + $signed(dout_c_1_02[39:0]);
    Dout03_R    <= $signed(dout_c_0_03[39:0]) + $signed(dout_c_1_03[39:0]);
    Dout04_R    <= $signed(dout_c_0_04[39:0]) + $signed(dout_c_1_04[39:0]);
    Dout05_R    <= $signed(dout_c_0_05[39:0]) + $signed(dout_c_1_05[39:0]);
    Dout06_R    <= $signed(dout_c_0_06[39:0]) + $signed(dout_c_1_06[39:0]);
    Dout07_R    <= $signed(dout_c_0_07[39:0]) + $signed(dout_c_1_07[39:0]);
    Dout08_R    <= $signed(dout_c_0_08[39:0]) + $signed(dout_c_1_08[39:0]);
    Dout09_R    <= $signed(dout_c_0_09[39:0]) + $signed(dout_c_1_09[39:0]);
    Dout10_R    <= $signed(dout_c_0_10[39:0]) + $signed(dout_c_1_10[39:0]);
    Dout11_R    <= $signed(dout_c_0_11[39:0]) + $signed(dout_c_1_11[39:0]);
    Dout12_R    <= $signed(dout_c_0_12[39:0]) + $signed(dout_c_1_12[39:0]);
    Dout13_R    <= $signed(dout_c_0_13[39:0]) + $signed(dout_c_1_13[39:0]);
    Dout14_R    <= $signed(dout_c_0_14[39:0]) + $signed(dout_c_1_14[39:0]);
    Dout15_R    <= $signed(dout_c_0_15[39:0]) + $signed(dout_c_1_15[39:0]);
    Dout16_R    <= $signed(dout_c_0_00[39:0]) - $signed(dout_c_1_00[39:0]);
    Dout17_R    <= $signed(dout_c_0_01[39:0]) - $signed(dout_c_1_01[39:0]);
    Dout18_R    <= $signed(dout_c_0_02[39:0]) - $signed(dout_c_1_02[39:0]);
    Dout19_R    <= $signed(dout_c_0_03[39:0]) - $signed(dout_c_1_03[39:0]);
    Dout20_R    <= $signed(dout_c_0_04[39:0]) - $signed(dout_c_1_04[39:0]);
    Dout21_R    <= $signed(dout_c_0_05[39:0]) - $signed(dout_c_1_05[39:0]);
    Dout22_R    <= $signed(dout_c_0_06[39:0]) - $signed(dout_c_1_06[39:0]);
    Dout23_R    <= $signed(dout_c_0_07[39:0]) - $signed(dout_c_1_07[39:0]);
    Dout24_R    <= $signed(dout_c_0_08[39:0]) - $signed(dout_c_1_08[39:0]);
    Dout25_R    <= $signed(dout_c_0_09[39:0]) - $signed(dout_c_1_09[39:0]);
    Dout26_R    <= $signed(dout_c_0_10[39:0]) - $signed(dout_c_1_10[39:0]);
    Dout27_R    <= $signed(dout_c_0_11[39:0]) - $signed(dout_c_1_11[39:0]);
    Dout28_R    <= $signed(dout_c_0_12[39:0]) - $signed(dout_c_1_12[39:0]);
    Dout29_R    <= $signed(dout_c_0_13[39:0]) - $signed(dout_c_1_13[39:0]);
    Dout30_R    <= $signed(dout_c_0_14[39:0]) - $signed(dout_c_1_14[39:0]);
    Dout31_R    <= $signed(dout_c_0_15[39:0]) - $signed(dout_c_1_15[39:0]);
    
end

assign Dout00 = {Dout00_I[38:1],Dout00_R[38:1]};
assign Dout01 = {Dout01_I[38:1],Dout01_R[38:1]};
assign Dout02 = {Dout02_I[38:1],Dout02_R[38:1]};
assign Dout03 = {Dout03_I[38:1],Dout03_R[38:1]};
assign Dout04 = {Dout04_I[38:1],Dout04_R[38:1]};
assign Dout05 = {Dout05_I[38:1],Dout05_R[38:1]};
assign Dout06 = {Dout06_I[38:1],Dout06_R[38:1]};
assign Dout07 = {Dout07_I[38:1],Dout07_R[38:1]};
assign Dout08 = {Dout08_I[38:1],Dout08_R[38:1]};
assign Dout09 = {Dout09_I[38:1],Dout09_R[38:1]};
assign Dout10 = {Dout10_I[38:1],Dout10_R[38:1]};
assign Dout11 = {Dout11_I[38:1],Dout11_R[38:1]};
assign Dout12 = {Dout12_I[38:1],Dout12_R[38:1]};
assign Dout13 = {Dout13_I[38:1],Dout13_R[38:1]};
assign Dout14 = {Dout14_I[38:1],Dout14_R[38:1]};
assign Dout15 = {Dout15_I[38:1],Dout15_R[38:1]};
assign Dout16 = {Dout16_I[38:1],Dout16_R[38:1]};
assign Dout17 = {Dout17_I[38:1],Dout17_R[38:1]};
assign Dout18 = {Dout18_I[38:1],Dout18_R[38:1]};
assign Dout19 = {Dout19_I[38:1],Dout19_R[38:1]};
assign Dout20 = {Dout20_I[38:1],Dout20_R[38:1]};
assign Dout21 = {Dout21_I[38:1],Dout21_R[38:1]};
assign Dout22 = {Dout22_I[38:1],Dout22_R[38:1]};
assign Dout23 = {Dout23_I[38:1],Dout23_R[38:1]};
assign Dout24 = {Dout24_I[38:1],Dout24_R[38:1]};
assign Dout25 = {Dout25_I[38:1],Dout25_R[38:1]};
assign Dout26 = {Dout26_I[38:1],Dout26_R[38:1]};
assign Dout27 = {Dout27_I[38:1],Dout27_R[38:1]};
assign Dout28 = {Dout28_I[38:1],Dout28_R[38:1]};
assign Dout29 = {Dout29_I[38:1],Dout29_R[38:1]};
assign Dout30 = {Dout30_I[38:1],Dout30_R[38:1]};
assign Dout31 = {Dout31_I[38:1],Dout31_R[38:1]};
endmodule
