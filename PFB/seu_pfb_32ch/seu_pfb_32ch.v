`timescale 1ns / 1ps

module seu_pfb_32ch(
    input   wire            clk_adc,
    input   wire            rst,
    input   wire    [127:0] data_adc,
    input   wire    [7:0]   gain_in,

    output  wire            clk_out,
    output  wire            clk_10M,
    output  wire    [37:0]  max_out,

    output  wire    [31:0]  Dout_00,
    output  wire    [31:0]  Dout_01,
    output  wire    [31:0]  Dout_02,
    output  wire    [31:0]  Dout_03,
    output  wire    [31:0]  Dout_04,
    output  wire    [31:0]  Dout_05,
    output  wire    [31:0]  Dout_06,
    output  wire    [31:0]  Dout_07,
    output  wire    [31:0]  Dout_08,
    output  wire    [31:0]  Dout_09,
    output  wire    [31:0]  Dout_10,
    output  wire    [31:0]  Dout_11,
    output  wire    [31:0]  Dout_12,
    output  wire    [31:0]  Dout_13,
    output  wire    [31:0]  Dout_14,
    output  wire    [31:0]  Dout_15,
    output  wire    [31:0]  Dout_16,
    output  wire    [31:0]  Dout_17,
    output  wire    [31:0]  Dout_18,
    output  wire    [31:0]  Dout_19,
    output  wire    [31:0]  Dout_20,
    output  wire    [31:0]  Dout_21,
    output  wire    [31:0]  Dout_22,
    output  wire    [31:0]  Dout_23,
    output  wire    [31:0]  Dout_24,
    output  wire    [31:0]  Dout_25,
    output  wire    [31:0]  Dout_26,
    output  wire    [31:0]  Dout_27,
    output  wire    [31:0]  Dout_28,
    output  wire    [31:0]  Dout_29,
    output  wire    [31:0]  Dout_30,
    output  wire    [31:0]  Dout_31
);

wire    clk_dsp;
clk_wiz clk_wiz_i
(
    .clk_dsp(clk_dsp),     
    .clk_10M(clk_10M),    
    .clk_in1(clk_adc)      
);

assign clk_out = clk_dsp;

wire    [11:0]  inputCommutator_dout_00;
wire    [11:0]  inputCommutator_dout_01;
wire    [11:0]  inputCommutator_dout_02;
wire    [11:0]  inputCommutator_dout_03;
wire    [11:0]  inputCommutator_dout_04;
wire    [11:0]  inputCommutator_dout_05;
wire    [11:0]  inputCommutator_dout_06;
wire    [11:0]  inputCommutator_dout_07;
wire    [11:0]  inputCommutator_dout_08;
wire    [11:0]  inputCommutator_dout_09;
wire    [11:0]  inputCommutator_dout_10;
wire    [11:0]  inputCommutator_dout_11;
wire    [11:0]  inputCommutator_dout_12;
wire    [11:0]  inputCommutator_dout_13;
wire    [11:0]  inputCommutator_dout_14;
wire    [11:0]  inputCommutator_dout_15;
wire    [11:0]  inputCommutator_dout_16;
wire    [11:0]  inputCommutator_dout_17;
wire    [11:0]  inputCommutator_dout_18;
wire    [11:0]  inputCommutator_dout_19;
wire    [11:0]  inputCommutator_dout_20;
wire    [11:0]  inputCommutator_dout_21;
wire    [11:0]  inputCommutator_dout_22;
wire    [11:0]  inputCommutator_dout_23;
wire    [11:0]  inputCommutator_dout_24;
wire    [11:0]  inputCommutator_dout_25;
wire    [11:0]  inputCommutator_dout_26;
wire    [11:0]  inputCommutator_dout_27;
wire    [11:0]  inputCommutator_dout_28;
wire    [11:0]  inputCommutator_dout_29;
wire    [11:0]  inputCommutator_dout_30;
wire    [11:0]  inputCommutator_dout_31;

inputCommutator  u_inputCommutator(
    .clk_in                  ( clk_adc   ),
    .clk_out                 ( clk_dsp   ),
    .data_in                 ( data_adc  ),
    .rst                     ( rst       ),

    .dout_00                 ( inputCommutator_dout_00   ),
    .dout_01                 ( inputCommutator_dout_01   ),
    .dout_02                 ( inputCommutator_dout_02   ),
    .dout_03                 ( inputCommutator_dout_03   ),
    .dout_04                 ( inputCommutator_dout_04   ),
    .dout_05                 ( inputCommutator_dout_05   ),
    .dout_06                 ( inputCommutator_dout_06   ),
    .dout_07                 ( inputCommutator_dout_07   ),
    .dout_08                 ( inputCommutator_dout_08   ),
    .dout_09                 ( inputCommutator_dout_09   ),
    .dout_10                 ( inputCommutator_dout_10   ),
    .dout_11                 ( inputCommutator_dout_11   ),
    .dout_12                 ( inputCommutator_dout_12   ),
    .dout_13                 ( inputCommutator_dout_13   ),
    .dout_14                 ( inputCommutator_dout_14   ),
    .dout_15                 ( inputCommutator_dout_15   ),
    .dout_16                 ( inputCommutator_dout_16   ),
    .dout_17                 ( inputCommutator_dout_17   ),
    .dout_18                 ( inputCommutator_dout_18   ),
    .dout_19                 ( inputCommutator_dout_19   ),
    .dout_20                 ( inputCommutator_dout_20   ),
    .dout_21                 ( inputCommutator_dout_21   ),
    .dout_22                 ( inputCommutator_dout_22   ),
    .dout_23                 ( inputCommutator_dout_23   ),
    .dout_24                 ( inputCommutator_dout_24   ),
    .dout_25                 ( inputCommutator_dout_25   ),
    .dout_26                 ( inputCommutator_dout_26   ),
    .dout_27                 ( inputCommutator_dout_27   ),
    .dout_28                 ( inputCommutator_dout_28   ),
    .dout_29                 ( inputCommutator_dout_29   ),
    .dout_30                 ( inputCommutator_dout_30   ),
    .dout_31                 ( inputCommutator_dout_31   )
);

 wire [31:0]   FIR_Dout_00;
 wire [31:0]   FIR_Dout_01;
 wire [31:0]   FIR_Dout_02;
 wire [31:0]   FIR_Dout_03;
 wire [31:0]   FIR_Dout_04;
 wire [31:0]   FIR_Dout_05;
 wire [31:0]   FIR_Dout_06;
 wire [31:0]   FIR_Dout_07;
 wire [31:0]   FIR_Dout_08;
 wire [31:0]   FIR_Dout_09;
 wire [31:0]   FIR_Dout_10;
 wire [31:0]   FIR_Dout_11;
 wire [31:0]   FIR_Dout_12;
 wire [31:0]   FIR_Dout_13;
 wire [31:0]   FIR_Dout_14;
 wire [31:0]   FIR_Dout_15;
 wire [31:0]   FIR_Dout_16;
 wire [31:0]   FIR_Dout_17;
 wire [31:0]   FIR_Dout_18;
 wire [31:0]   FIR_Dout_19;
 wire [31:0]   FIR_Dout_20;
 wire [31:0]   FIR_Dout_21;
 wire [31:0]   FIR_Dout_22;
 wire [31:0]   FIR_Dout_23;
 wire [31:0]   FIR_Dout_24;
 wire [31:0]   FIR_Dout_25;
 wire [31:0]   FIR_Dout_26;
 wire [31:0]   FIR_Dout_27;
 wire [31:0]   FIR_Dout_28;
 wire [31:0]   FIR_Dout_29;
 wire [31:0]   FIR_Dout_30;
 wire [31:0]   FIR_Dout_31;
  
fir_block fir_block_i(
    .dout_00(FIR_Dout_00),
    .dout_01(FIR_Dout_01),
    .dout_02(FIR_Dout_02),
    .dout_03(FIR_Dout_03),
    .dout_04(FIR_Dout_04),
    .dout_05(FIR_Dout_05),
    .dout_06(FIR_Dout_06),
    .dout_07(FIR_Dout_07),
    .dout_08(FIR_Dout_08),
    .dout_09(FIR_Dout_09),
    .dout_10(FIR_Dout_10),
    .dout_11(FIR_Dout_11),
    .dout_12(FIR_Dout_12),
    .dout_13(FIR_Dout_13),
    .dout_14(FIR_Dout_14),
    .dout_15(FIR_Dout_15),
    .dout_16(FIR_Dout_16),
    .dout_17(FIR_Dout_17),
    .dout_18(FIR_Dout_18),
    .dout_19(FIR_Dout_19),
    .dout_20(FIR_Dout_20),
    .dout_21(FIR_Dout_21),
    .dout_22(FIR_Dout_22),
    .dout_23(FIR_Dout_23),
    .dout_24(FIR_Dout_24),
    .dout_25(FIR_Dout_25),
    .dout_26(FIR_Dout_26),
    .dout_27(FIR_Dout_27),
    .dout_28(FIR_Dout_28),
    .dout_29(FIR_Dout_29),
    .dout_30(FIR_Dout_30),
    .dout_31(FIR_Dout_31),
    .clk(clk_dsp),
    .din_00({ {4{inputCommutator_dout_00[11]}} ,inputCommutator_dout_00 }),
    .din_01({ {4{inputCommutator_dout_01[11]}} ,inputCommutator_dout_01 }),
    .din_02({ {4{inputCommutator_dout_02[11]}} ,inputCommutator_dout_02 }),
    .din_03({ {4{inputCommutator_dout_03[11]}} ,inputCommutator_dout_03 }),
    .din_04({ {4{inputCommutator_dout_04[11]}} ,inputCommutator_dout_04 }),
    .din_05({ {4{inputCommutator_dout_05[11]}} ,inputCommutator_dout_05 }),
    .din_06({ {4{inputCommutator_dout_06[11]}} ,inputCommutator_dout_06 }),
    .din_07({ {4{inputCommutator_dout_07[11]}} ,inputCommutator_dout_07 }),
    .din_08({ {4{inputCommutator_dout_08[11]}} ,inputCommutator_dout_08 }),
    .din_09({ {4{inputCommutator_dout_09[11]}} ,inputCommutator_dout_09 }),
    .din_10({ {4{inputCommutator_dout_10[11]}} ,inputCommutator_dout_10 }),
    .din_11({ {4{inputCommutator_dout_11[11]}} ,inputCommutator_dout_11 }),
    .din_12({ {4{inputCommutator_dout_12[11]}} ,inputCommutator_dout_12 }),
    .din_13({ {4{inputCommutator_dout_13[11]}} ,inputCommutator_dout_13 }),
    .din_14({ {4{inputCommutator_dout_14[11]}} ,inputCommutator_dout_14 }),
    .din_15({ {4{inputCommutator_dout_15[11]}} ,inputCommutator_dout_15 }),
    .din_16({ {4{inputCommutator_dout_16[11]}} ,inputCommutator_dout_16 }),
    .din_17({ {4{inputCommutator_dout_17[11]}} ,inputCommutator_dout_17 }),
    .din_18({ {4{inputCommutator_dout_18[11]}} ,inputCommutator_dout_18 }),
    .din_19({ {4{inputCommutator_dout_19[11]}} ,inputCommutator_dout_19 }),
    .din_20({ {4{inputCommutator_dout_20[11]}} ,inputCommutator_dout_20 }),
    .din_21({ {4{inputCommutator_dout_21[11]}} ,inputCommutator_dout_21 }),
    .din_22({ {4{inputCommutator_dout_22[11]}} ,inputCommutator_dout_22 }),
    .din_23({ {4{inputCommutator_dout_23[11]}} ,inputCommutator_dout_23 }),
    .din_24({ {4{inputCommutator_dout_24[11]}} ,inputCommutator_dout_24 }),
    .din_25({ {4{inputCommutator_dout_25[11]}} ,inputCommutator_dout_25 }),
    .din_26({ {4{inputCommutator_dout_26[11]}} ,inputCommutator_dout_26 }),
    .din_27({ {4{inputCommutator_dout_27[11]}} ,inputCommutator_dout_27 }),
    .din_28({ {4{inputCommutator_dout_28[11]}} ,inputCommutator_dout_28 }),
    .din_29({ {4{inputCommutator_dout_29[11]}} ,inputCommutator_dout_29 }),
    .din_30({ {4{inputCommutator_dout_30[11]}} ,inputCommutator_dout_30 }),
    .din_31({ {4{inputCommutator_dout_31[11]}} ,inputCommutator_dout_31 })
);

wire    [75:0]  DFTOUT_00;
wire    [75:0]  DFTOUT_01;
wire    [75:0]  DFTOUT_02;
wire    [75:0]  DFTOUT_03;
wire    [75:0]  DFTOUT_04;
wire    [75:0]  DFTOUT_05;
wire    [75:0]  DFTOUT_06;
wire    [75:0]  DFTOUT_07;
wire    [75:0]  DFTOUT_08;
wire    [75:0]  DFTOUT_09;
wire    [75:0]  DFTOUT_10;
wire    [75:0]  DFTOUT_11;
wire    [75:0]  DFTOUT_12;
wire    [75:0]  DFTOUT_13;
wire    [75:0]  DFTOUT_14;
wire    [75:0]  DFTOUT_15;
wire    [75:0]  DFTOUT_16;
wire    [75:0]  DFTOUT_17;
wire    [75:0]  DFTOUT_18;
wire    [75:0]  DFTOUT_19;
wire    [75:0]  DFTOUT_20;
wire    [75:0]  DFTOUT_21;
wire    [75:0]  DFTOUT_22;
wire    [75:0]  DFTOUT_23;
wire    [75:0]  DFTOUT_24;
wire    [75:0]  DFTOUT_25;
wire    [75:0]  DFTOUT_26;
wire    [75:0]  DFTOUT_27;
wire    [75:0]  DFTOUT_28;
wire    [75:0]  DFTOUT_29;
wire    [75:0]  DFTOUT_30;
wire    [75:0]  DFTOUT_31;

DFT_32P DFT_32P_i(
    .clk(clk_dsp),
    .Din00(FIR_Dout_00),
    .Din01(FIR_Dout_01),
    .Din02(FIR_Dout_02),
    .Din03(FIR_Dout_03),
    .Din04(FIR_Dout_04),
    .Din05(FIR_Dout_05),
    .Din06(FIR_Dout_06),
    .Din07(FIR_Dout_07),
    .Din08(FIR_Dout_08),
    .Din09(FIR_Dout_09),
    .Din10(FIR_Dout_10),
    .Din11(FIR_Dout_11),
    .Din12(FIR_Dout_12),
    .Din13(FIR_Dout_13),
    .Din14(FIR_Dout_14),
    .Din15(FIR_Dout_15),
    .Din16(FIR_Dout_16),
    .Din17(FIR_Dout_17),
    .Din18(FIR_Dout_18),
    .Din19(FIR_Dout_19),
    .Din20(FIR_Dout_20),
    .Din21(FIR_Dout_21),
    .Din22(FIR_Dout_22),
    .Din23(FIR_Dout_23),
    .Din24(FIR_Dout_24),
    .Din25(FIR_Dout_25),
    .Din26(FIR_Dout_26),
    .Din27(FIR_Dout_27),
    .Din28(FIR_Dout_28),
    .Din29(FIR_Dout_29),
    .Din30(FIR_Dout_30),
    .Din31(FIR_Dout_31),
    .Dout00(DFTOUT_00),
    .Dout01(DFTOUT_01),
    .Dout02(DFTOUT_02),
    .Dout03(DFTOUT_03),
    .Dout04(DFTOUT_04),
    .Dout05(DFTOUT_05),
    .Dout06(DFTOUT_06),
    .Dout07(DFTOUT_07),
    .Dout08(DFTOUT_08),
    .Dout09(DFTOUT_09),
    .Dout10(DFTOUT_10),
    .Dout11(DFTOUT_11),
    .Dout12(DFTOUT_12),
    .Dout13(DFTOUT_13),
    .Dout14(DFTOUT_14),
    .Dout15(DFTOUT_15),
    .Dout16(DFTOUT_16),
    .Dout17(DFTOUT_17),
    .Dout18(DFTOUT_18),
    .Dout19(DFTOUT_19),
    .Dout20(DFTOUT_20),
    .Dout21(DFTOUT_21),
    .Dout22(DFTOUT_22),
    .Dout23(DFTOUT_23),
    .Dout24(DFTOUT_24),
    .Dout25(DFTOUT_25),
    .Dout26(DFTOUT_26),
    .Dout27(DFTOUT_27),
    .Dout28(DFTOUT_28),
    .Dout29(DFTOUT_29),
    .Dout30(DFTOUT_30),
    .Dout31(DFTOUT_31)
);

gain_ctrl u_gain_ctrl(
    .clk            (clk_dsp),
    .rst            (rst),
    .gain_in        (gain_in),

    .Din_00         (DFTOUT_00),
    .Din_01         (DFTOUT_01),
    .Din_02         (DFTOUT_02),
    .Din_03         (DFTOUT_03),
    .Din_04         (DFTOUT_04),
    .Din_05         (DFTOUT_05),
    .Din_06         (DFTOUT_06),
    .Din_07         (DFTOUT_07),
    .Din_08         (DFTOUT_08),
    .Din_09         (DFTOUT_09),
    .Din_10         (DFTOUT_10),
    .Din_11         (DFTOUT_11),
    .Din_12         (DFTOUT_12),
    .Din_13         (DFTOUT_13),
    .Din_14         (DFTOUT_14),
    .Din_15         (DFTOUT_15),
    .Din_16         (DFTOUT_16),
    .Din_17         (DFTOUT_17),
    .Din_18         (DFTOUT_18),
    .Din_19         (DFTOUT_19),
    .Din_20         (DFTOUT_20),
    .Din_21         (DFTOUT_21),
    .Din_22         (DFTOUT_22),
    .Din_23         (DFTOUT_23),
    .Din_24         (DFTOUT_24),
    .Din_25         (DFTOUT_25),
    .Din_26         (DFTOUT_26),
    .Din_27         (DFTOUT_27),
    .Din_28         (DFTOUT_28),
    .Din_29         (DFTOUT_29),
    .Din_30         (DFTOUT_30),
    .Din_31         (DFTOUT_31),

    .max_out        (max_out),

    .Dout_00        (Dout_00),
    .Dout_01        (Dout_01),
    .Dout_02        (Dout_02),
    .Dout_03        (Dout_03),
    .Dout_04        (Dout_04),
    .Dout_05        (Dout_05),
    .Dout_06        (Dout_06),
    .Dout_07        (Dout_07),
    .Dout_08        (Dout_08),
    .Dout_09        (Dout_09),
    .Dout_10        (Dout_10),
    .Dout_11        (Dout_11),
    .Dout_12        (Dout_12),
    .Dout_13        (Dout_13),
    .Dout_14        (Dout_14),
    .Dout_15        (Dout_15),
    .Dout_16        (Dout_16),
    .Dout_17        (Dout_17),
    .Dout_18        (Dout_18),
    .Dout_19        (Dout_19),
    .Dout_20        (Dout_20),
    .Dout_21        (Dout_21),
    .Dout_22        (Dout_22),
    .Dout_23        (Dout_23),
    .Dout_24        (Dout_24),
    .Dout_25        (Dout_25),
    .Dout_26        (Dout_26),
    .Dout_27        (Dout_27),
    .Dout_28        (Dout_28),
    .Dout_29        (Dout_29),
    .Dout_30        (Dout_30),
    .Dout_31        (Dout_31)
);

endmodule
