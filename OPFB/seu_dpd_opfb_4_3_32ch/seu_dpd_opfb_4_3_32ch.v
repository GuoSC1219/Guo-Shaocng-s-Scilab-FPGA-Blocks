`timescale 1ns / 1ps

module seu_dpd_opfb_4_3_32ch
(
    input   wire            clk_adc,


    output  wire            clk_10M,
    input   wire            rst,
    input   wire    [127:0] data_adc,
    input   wire    [7:0]   gain_in,
    
    output  wire            clk_out,
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

wire clk_dsp;
assign clk_out = clk_dsp;
clk_wiz clk_wiz_i(
    .clk_out(clk_dsp), 
    .clk_10M(clk_10M),   
    .clk_in(clk_adc)      
);

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
wire    [11:0]  inputCommutator_dout_32;
wire    [11:0]  inputCommutator_dout_33;
wire    [11:0]  inputCommutator_dout_34;
wire    [11:0]  inputCommutator_dout_35;
wire    [11:0]  inputCommutator_dout_36;
wire    [11:0]  inputCommutator_dout_37;
wire    [11:0]  inputCommutator_dout_38;
wire    [11:0]  inputCommutator_dout_39;
wire    [11:0]  inputCommutator_dout_40;
wire    [11:0]  inputCommutator_dout_41;
wire    [11:0]  inputCommutator_dout_42;
wire    [11:0]  inputCommutator_dout_43;
wire    [11:0]  inputCommutator_dout_44;
wire    [11:0]  inputCommutator_dout_45;
wire    [11:0]  inputCommutator_dout_46;
wire    [11:0]  inputCommutator_dout_47;
wire    [11:0]  inputCommutator_dout_48;
wire    [11:0]  inputCommutator_dout_49;
wire    [11:0]  inputCommutator_dout_50;
wire    [11:0]  inputCommutator_dout_51;
wire    [11:0]  inputCommutator_dout_52;
wire    [11:0]  inputCommutator_dout_53;
wire    [11:0]  inputCommutator_dout_54;
wire    [11:0]  inputCommutator_dout_55;
wire    [11:0]  inputCommutator_dout_56;
wire    [11:0]  inputCommutator_dout_57;
wire    [11:0]  inputCommutator_dout_58;
wire    [11:0]  inputCommutator_dout_59;
wire    [11:0]  inputCommutator_dout_60;
wire    [11:0]  inputCommutator_dout_61;
wire    [11:0]  inputCommutator_dout_62;
wire    [11:0]  inputCommutator_dout_63;
wire    [11:0]  inputCommutator_dout_64;
wire    [11:0]  inputCommutator_dout_65;
wire    [11:0]  inputCommutator_dout_66;
wire    [11:0]  inputCommutator_dout_67;
wire    [11:0]  inputCommutator_dout_68;
wire    [11:0]  inputCommutator_dout_69;
wire    [11:0]  inputCommutator_dout_70;
wire    [11:0]  inputCommutator_dout_71;
wire    [11:0]  inputCommutator_dout_72;
wire    [11:0]  inputCommutator_dout_73;
wire    [11:0]  inputCommutator_dout_74;
wire    [11:0]  inputCommutator_dout_75;
wire    [11:0]  inputCommutator_dout_76;
wire    [11:0]  inputCommutator_dout_77;
wire    [11:0]  inputCommutator_dout_78;
wire    [11:0]  inputCommutator_dout_79;
wire    [11:0]  inputCommutator_dout_80;
wire    [11:0]  inputCommutator_dout_81;
wire    [11:0]  inputCommutator_dout_82;
wire    [11:0]  inputCommutator_dout_83;
wire    [11:0]  inputCommutator_dout_84;
wire    [11:0]  inputCommutator_dout_85;
wire    [11:0]  inputCommutator_dout_86;
wire    [11:0]  inputCommutator_dout_87;
wire    [11:0]  inputCommutator_dout_88;
wire    [11:0]  inputCommutator_dout_89;
wire    [11:0]  inputCommutator_dout_90;
wire    [11:0]  inputCommutator_dout_91;
wire    [11:0]  inputCommutator_dout_92;
wire    [11:0]  inputCommutator_dout_93;
wire    [11:0]  inputCommutator_dout_94;
wire    [11:0]  inputCommutator_dout_95;

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
    .dout_31                 ( inputCommutator_dout_31   ),
    .dout_32                 ( inputCommutator_dout_32   ),
    .dout_33                 ( inputCommutator_dout_33   ),
    .dout_34                 ( inputCommutator_dout_34   ),
    .dout_35                 ( inputCommutator_dout_35   ),
    .dout_36                 ( inputCommutator_dout_36   ),
    .dout_37                 ( inputCommutator_dout_37   ),
    .dout_38                 ( inputCommutator_dout_38   ),
    .dout_39                 ( inputCommutator_dout_39   ),
    .dout_40                 ( inputCommutator_dout_40   ),
    .dout_41                 ( inputCommutator_dout_41   ),
    .dout_42                 ( inputCommutator_dout_42   ),
    .dout_43                 ( inputCommutator_dout_43   ),
    .dout_44                 ( inputCommutator_dout_44   ),
    .dout_45                 ( inputCommutator_dout_45   ),
    .dout_46                 ( inputCommutator_dout_46   ),
    .dout_47                 ( inputCommutator_dout_47   ),
    .dout_48                 ( inputCommutator_dout_48   ),
    .dout_49                 ( inputCommutator_dout_49   ),
    .dout_50                 ( inputCommutator_dout_50   ),
    .dout_51                 ( inputCommutator_dout_51   ),
    .dout_52                 ( inputCommutator_dout_52   ),
    .dout_53                 ( inputCommutator_dout_53   ),
    .dout_54                 ( inputCommutator_dout_54   ),
    .dout_55                 ( inputCommutator_dout_55   ),
    .dout_56                 ( inputCommutator_dout_56   ),
    .dout_57                 ( inputCommutator_dout_57   ),
    .dout_58                 ( inputCommutator_dout_58   ),
    .dout_59                 ( inputCommutator_dout_59   ),
    .dout_60                 ( inputCommutator_dout_60   ),
    .dout_61                 ( inputCommutator_dout_61   ),
    .dout_62                 ( inputCommutator_dout_62   ),
    .dout_63                 ( inputCommutator_dout_63   ),
    .dout_64                 ( inputCommutator_dout_64   ),
    .dout_65                 ( inputCommutator_dout_65   ),
    .dout_66                 ( inputCommutator_dout_66   ),
    .dout_67                 ( inputCommutator_dout_67   ),
    .dout_68                 ( inputCommutator_dout_68   ),
    .dout_69                 ( inputCommutator_dout_69   ),
    .dout_70                 ( inputCommutator_dout_70   ),
    .dout_71                 ( inputCommutator_dout_71   ),
    .dout_72                 ( inputCommutator_dout_72   ),
    .dout_73                 ( inputCommutator_dout_73   ),
    .dout_74                 ( inputCommutator_dout_74   ),
    .dout_75                 ( inputCommutator_dout_75   ),
    .dout_76                 ( inputCommutator_dout_76   ),
    .dout_77                 ( inputCommutator_dout_77   ),
    .dout_78                 ( inputCommutator_dout_78   ),
    .dout_79                 ( inputCommutator_dout_79   ),
    .dout_80                 ( inputCommutator_dout_80   ),
    .dout_81                 ( inputCommutator_dout_81   ),
    .dout_82                 ( inputCommutator_dout_82   ),
    .dout_83                 ( inputCommutator_dout_83   ),
    .dout_84                 ( inputCommutator_dout_84   ),
    .dout_85                 ( inputCommutator_dout_85   ),
    .dout_86                 ( inputCommutator_dout_86   ),
    .dout_87                 ( inputCommutator_dout_87   ),
    .dout_88                 ( inputCommutator_dout_88   ),
    .dout_89                 ( inputCommutator_dout_89   ),
    .dout_90                 ( inputCommutator_dout_90   ),
    .dout_91                 ( inputCommutator_dout_91   ),
    .dout_92                 ( inputCommutator_dout_92   ),
    .dout_93                 ( inputCommutator_dout_93   ),
    .dout_94                 ( inputCommutator_dout_94   ),
    .dout_95                 ( inputCommutator_dout_95   )
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
    .Dout_00(FIR_Dout_00),
    .Dout_01(FIR_Dout_01),
    .Dout_02(FIR_Dout_02),
    .Dout_03(FIR_Dout_03),
    .Dout_04(FIR_Dout_04),
    .Dout_05(FIR_Dout_05),
    .Dout_06(FIR_Dout_06),
    .Dout_07(FIR_Dout_07),
    .Dout_08(FIR_Dout_08),
    .Dout_09(FIR_Dout_09),
    .Dout_10(FIR_Dout_10),
    .Dout_11(FIR_Dout_11),
    .Dout_12(FIR_Dout_12),
    .Dout_13(FIR_Dout_13),
    .Dout_14(FIR_Dout_14),
    .Dout_15(FIR_Dout_15),
    .Dout_16(FIR_Dout_16),
    .Dout_17(FIR_Dout_17),
    .Dout_18(FIR_Dout_18),
    .Dout_19(FIR_Dout_19),
    .Dout_20(FIR_Dout_20),
    .Dout_21(FIR_Dout_21),
    .Dout_22(FIR_Dout_22),
    .Dout_23(FIR_Dout_23),
    .Dout_24(FIR_Dout_24),
    .Dout_25(FIR_Dout_25),
    .Dout_26(FIR_Dout_26),
    .Dout_27(FIR_Dout_27),
    .Dout_28(FIR_Dout_28),
    .Dout_29(FIR_Dout_29),
    .Dout_30(FIR_Dout_30),
    .Dout_31(FIR_Dout_31),
    .clk(clk_dsp),
    .din_00_0({ {4{inputCommutator_dout_00[11]}} ,inputCommutator_dout_00 }),
    .din_00_1({ {4{inputCommutator_dout_32[11]}} ,inputCommutator_dout_32 }),
    .din_00_2({ {4{inputCommutator_dout_64[11]}} ,inputCommutator_dout_64 }),
    .din_01_0({ {4{inputCommutator_dout_01[11]}} ,inputCommutator_dout_01 }),
    .din_01_1({ {4{inputCommutator_dout_33[11]}} ,inputCommutator_dout_33 }),
    .din_01_2({ {4{inputCommutator_dout_65[11]}} ,inputCommutator_dout_65 }),
    .din_02_0({ {4{inputCommutator_dout_02[11]}} ,inputCommutator_dout_02 }),
    .din_02_1({ {4{inputCommutator_dout_34[11]}} ,inputCommutator_dout_34 }),
    .din_02_2({ {4{inputCommutator_dout_66[11]}} ,inputCommutator_dout_66 }),
    .din_03_0({ {4{inputCommutator_dout_03[11]}} ,inputCommutator_dout_03 }),
    .din_03_1({ {4{inputCommutator_dout_35[11]}} ,inputCommutator_dout_35 }),
    .din_03_2({ {4{inputCommutator_dout_67[11]}} ,inputCommutator_dout_67 }),
    .din_04_0({ {4{inputCommutator_dout_04[11]}} ,inputCommutator_dout_04 }),
    .din_04_1({ {4{inputCommutator_dout_36[11]}} ,inputCommutator_dout_36 }),
    .din_04_2({ {4{inputCommutator_dout_68[11]}} ,inputCommutator_dout_68 }),
    .din_05_0({ {4{inputCommutator_dout_05[11]}} ,inputCommutator_dout_05 }),
    .din_05_1({ {4{inputCommutator_dout_37[11]}} ,inputCommutator_dout_37 }),
    .din_05_2({ {4{inputCommutator_dout_69[11]}} ,inputCommutator_dout_69 }),
    .din_06_0({ {4{inputCommutator_dout_06[11]}} ,inputCommutator_dout_06 }),
    .din_06_1({ {4{inputCommutator_dout_38[11]}} ,inputCommutator_dout_38 }),
    .din_06_2({ {4{inputCommutator_dout_70[11]}} ,inputCommutator_dout_70 }),
    .din_07_0({ {4{inputCommutator_dout_07[11]}} ,inputCommutator_dout_07 }),
    .din_07_1({ {4{inputCommutator_dout_39[11]}} ,inputCommutator_dout_39 }),
    .din_07_2({ {4{inputCommutator_dout_71[11]}} ,inputCommutator_dout_71 }),
    .din_08_0({ {4{inputCommutator_dout_08[11]}} ,inputCommutator_dout_08 }),
    .din_08_1({ {4{inputCommutator_dout_40[11]}} ,inputCommutator_dout_40 }),
    .din_08_2({ {4{inputCommutator_dout_72[11]}} ,inputCommutator_dout_72 }),
    .din_09_0({ {4{inputCommutator_dout_09[11]}} ,inputCommutator_dout_09 }),
    .din_09_1({ {4{inputCommutator_dout_41[11]}} ,inputCommutator_dout_41 }),
    .din_09_2({ {4{inputCommutator_dout_73[11]}} ,inputCommutator_dout_73 }),
    .din_10_0({ {4{inputCommutator_dout_10[11]}} ,inputCommutator_dout_10 }),
    .din_10_1({ {4{inputCommutator_dout_42[11]}} ,inputCommutator_dout_42 }),
    .din_10_2({ {4{inputCommutator_dout_74[11]}} ,inputCommutator_dout_74 }),
    .din_11_0({ {4{inputCommutator_dout_11[11]}} ,inputCommutator_dout_11 }),
    .din_11_1({ {4{inputCommutator_dout_43[11]}} ,inputCommutator_dout_43 }),
    .din_11_2({ {4{inputCommutator_dout_75[11]}} ,inputCommutator_dout_75 }),
    .din_12_0({ {4{inputCommutator_dout_12[11]}} ,inputCommutator_dout_12 }),
    .din_12_1({ {4{inputCommutator_dout_44[11]}} ,inputCommutator_dout_44 }),
    .din_12_2({ {4{inputCommutator_dout_76[11]}} ,inputCommutator_dout_76 }),
    .din_13_0({ {4{inputCommutator_dout_13[11]}} ,inputCommutator_dout_13 }),
    .din_13_1({ {4{inputCommutator_dout_45[11]}} ,inputCommutator_dout_45 }),
    .din_13_2({ {4{inputCommutator_dout_77[11]}} ,inputCommutator_dout_77 }),
    .din_14_0({ {4{inputCommutator_dout_14[11]}} ,inputCommutator_dout_14 }),
    .din_14_1({ {4{inputCommutator_dout_46[11]}} ,inputCommutator_dout_46 }),
    .din_14_2({ {4{inputCommutator_dout_78[11]}} ,inputCommutator_dout_78 }),
    .din_15_0({ {4{inputCommutator_dout_15[11]}} ,inputCommutator_dout_15 }),
    .din_15_1({ {4{inputCommutator_dout_47[11]}} ,inputCommutator_dout_47 }),
    .din_15_2({ {4{inputCommutator_dout_79[11]}} ,inputCommutator_dout_79 }),
    .din_16_0({ {4{inputCommutator_dout_16[11]}} ,inputCommutator_dout_16 }),
    .din_16_1({ {4{inputCommutator_dout_48[11]}} ,inputCommutator_dout_48 }),
    .din_16_2({ {4{inputCommutator_dout_80[11]}} ,inputCommutator_dout_80 }),
    .din_17_0({ {4{inputCommutator_dout_17[11]}} ,inputCommutator_dout_17 }),
    .din_17_1({ {4{inputCommutator_dout_49[11]}} ,inputCommutator_dout_49 }),
    .din_17_2({ {4{inputCommutator_dout_81[11]}} ,inputCommutator_dout_81 }),
    .din_18_0({ {4{inputCommutator_dout_18[11]}} ,inputCommutator_dout_18 }),
    .din_18_1({ {4{inputCommutator_dout_50[11]}} ,inputCommutator_dout_50 }),
    .din_18_2({ {4{inputCommutator_dout_82[11]}} ,inputCommutator_dout_82 }),
    .din_19_0({ {4{inputCommutator_dout_19[11]}} ,inputCommutator_dout_19 }),
    .din_19_1({ {4{inputCommutator_dout_51[11]}} ,inputCommutator_dout_51 }),
    .din_19_2({ {4{inputCommutator_dout_83[11]}} ,inputCommutator_dout_83 }),
    .din_20_0({ {4{inputCommutator_dout_20[11]}} ,inputCommutator_dout_20 }),
    .din_20_1({ {4{inputCommutator_dout_52[11]}} ,inputCommutator_dout_52 }),
    .din_20_2({ {4{inputCommutator_dout_84[11]}} ,inputCommutator_dout_84 }),
    .din_21_0({ {4{inputCommutator_dout_21[11]}} ,inputCommutator_dout_21 }),
    .din_21_1({ {4{inputCommutator_dout_53[11]}} ,inputCommutator_dout_53 }),
    .din_21_2({ {4{inputCommutator_dout_85[11]}} ,inputCommutator_dout_85 }),
    .din_22_0({ {4{inputCommutator_dout_22[11]}} ,inputCommutator_dout_22 }),
    .din_22_1({ {4{inputCommutator_dout_54[11]}} ,inputCommutator_dout_54 }),
    .din_22_2({ {4{inputCommutator_dout_86[11]}} ,inputCommutator_dout_86 }),
    .din_23_0({ {4{inputCommutator_dout_23[11]}} ,inputCommutator_dout_23 }),
    .din_23_1({ {4{inputCommutator_dout_55[11]}} ,inputCommutator_dout_55 }),
    .din_23_2({ {4{inputCommutator_dout_87[11]}} ,inputCommutator_dout_87 }),
    .din_24_0({ {4{inputCommutator_dout_24[11]}} ,inputCommutator_dout_24 }),
    .din_24_1({ {4{inputCommutator_dout_56[11]}} ,inputCommutator_dout_56 }),
    .din_24_2({ {4{inputCommutator_dout_88[11]}} ,inputCommutator_dout_88 }),
    .din_25_0({ {4{inputCommutator_dout_25[11]}} ,inputCommutator_dout_25 }),
    .din_25_1({ {4{inputCommutator_dout_57[11]}} ,inputCommutator_dout_57 }),
    .din_25_2({ {4{inputCommutator_dout_89[11]}} ,inputCommutator_dout_89 }),
    .din_26_0({ {4{inputCommutator_dout_26[11]}} ,inputCommutator_dout_26 }),
    .din_26_1({ {4{inputCommutator_dout_58[11]}} ,inputCommutator_dout_58 }),
    .din_26_2({ {4{inputCommutator_dout_90[11]}} ,inputCommutator_dout_90 }),
    .din_27_0({ {4{inputCommutator_dout_27[11]}} ,inputCommutator_dout_27 }),
    .din_27_1({ {4{inputCommutator_dout_59[11]}} ,inputCommutator_dout_59 }),
    .din_27_2({ {4{inputCommutator_dout_91[11]}} ,inputCommutator_dout_91 }),
    .din_28_0({ {4{inputCommutator_dout_28[11]}} ,inputCommutator_dout_28 }),
    .din_28_1({ {4{inputCommutator_dout_60[11]}} ,inputCommutator_dout_60 }),
    .din_28_2({ {4{inputCommutator_dout_92[11]}} ,inputCommutator_dout_92 }),
    .din_29_0({ {4{inputCommutator_dout_29[11]}} ,inputCommutator_dout_29 }),
    .din_29_1({ {4{inputCommutator_dout_61[11]}} ,inputCommutator_dout_61 }),
    .din_29_2({ {4{inputCommutator_dout_93[11]}} ,inputCommutator_dout_93 }),
    .din_30_0({ {4{inputCommutator_dout_30[11]}} ,inputCommutator_dout_30 }),
    .din_30_1({ {4{inputCommutator_dout_62[11]}} ,inputCommutator_dout_62 }),
    .din_30_2({ {4{inputCommutator_dout_94[11]}} ,inputCommutator_dout_94 }),
    .din_31_0({ {4{inputCommutator_dout_31[11]}} ,inputCommutator_dout_31 }),
    .din_31_1({ {4{inputCommutator_dout_63[11]}} ,inputCommutator_dout_63 }),
    .din_31_2({ {4{inputCommutator_dout_95[11]}} ,inputCommutator_dout_95 })
);

  wire [31:0]   CS_Dout_00;
  wire [31:0]   CS_Dout_01;
  wire [31:0]   CS_Dout_02;
  wire [31:0]   CS_Dout_03;
  wire [31:0]   CS_Dout_04;
  wire [31:0]   CS_Dout_05;
  wire [31:0]   CS_Dout_06;
  wire [31:0]   CS_Dout_07;
  wire [31:0]   CS_Dout_08;
  wire [31:0]   CS_Dout_09;
  wire [31:0]   CS_Dout_10;
  wire [31:0]   CS_Dout_11;
  wire [31:0]   CS_Dout_12;
  wire [31:0]   CS_Dout_13;
  wire [31:0]   CS_Dout_14;
  wire [31:0]   CS_Dout_15;
  wire [31:0]   CS_Dout_16;
  wire [31:0]   CS_Dout_17;
  wire [31:0]   CS_Dout_18;
  wire [31:0]   CS_Dout_19;
  wire [31:0]   CS_Dout_20;
  wire [31:0]   CS_Dout_21;
  wire [31:0]   CS_Dout_22;
  wire [31:0]   CS_Dout_23;
  wire [31:0]   CS_Dout_24;
  wire [31:0]   CS_Dout_25;
  wire [31:0]   CS_Dout_26;
  wire [31:0]   CS_Dout_27;
  wire [31:0]   CS_Dout_28;
  wire [31:0]   CS_Dout_29;
  wire [31:0]   CS_Dout_30;
  wire [31:0]   CS_Dout_31;


circular_shift circular_shift_i(
    .clk (clk_dsp),
    .rst (rst),

    .Din00  (FIR_Dout_00),
    .Din01  (FIR_Dout_01),
    .Din02  (FIR_Dout_02),
    .Din03  (FIR_Dout_03),
    .Din04  (FIR_Dout_04),
    .Din05  (FIR_Dout_05),
    .Din06  (FIR_Dout_06),
    .Din07  (FIR_Dout_07),
    .Din08  (FIR_Dout_08),
    .Din09  (FIR_Dout_09),
    .Din10  (FIR_Dout_10),
    .Din11  (FIR_Dout_11),
    .Din12  (FIR_Dout_12),
    .Din13  (FIR_Dout_13),
    .Din14  (FIR_Dout_14),
    .Din15  (FIR_Dout_15),
    .Din16  (FIR_Dout_16),
    .Din17  (FIR_Dout_17),
    .Din18  (FIR_Dout_18),
    .Din19  (FIR_Dout_19),
    .Din20  (FIR_Dout_20),
    .Din21  (FIR_Dout_21),
    .Din22  (FIR_Dout_22),
    .Din23  (FIR_Dout_23),
    .Din24  (FIR_Dout_24),
    .Din25  (FIR_Dout_25),
    .Din26  (FIR_Dout_26),
    .Din27  (FIR_Dout_27),
    .Din28  (FIR_Dout_28),
    .Din29  (FIR_Dout_29),
    .Din30  (FIR_Dout_30),
    .Din31  (FIR_Dout_31),


    .Dout00(CS_Dout_00),
    .Dout01(CS_Dout_01),
    .Dout02(CS_Dout_02),
    .Dout03(CS_Dout_03),
    .Dout04(CS_Dout_04),
    .Dout05(CS_Dout_05),
    .Dout06(CS_Dout_06),
    .Dout07(CS_Dout_07),
    .Dout08(CS_Dout_08),
    .Dout09(CS_Dout_09),
    .Dout10(CS_Dout_10),
    .Dout11(CS_Dout_11),
    .Dout12(CS_Dout_12),
    .Dout13(CS_Dout_13),
    .Dout14(CS_Dout_14),
    .Dout15(CS_Dout_15),
    .Dout16(CS_Dout_16),
    .Dout17(CS_Dout_17),
    .Dout18(CS_Dout_18),
    .Dout19(CS_Dout_19),
    .Dout20(CS_Dout_20),
    .Dout21(CS_Dout_21),
    .Dout22(CS_Dout_22),
    .Dout23(CS_Dout_23),
    .Dout24(CS_Dout_24),
    .Dout25(CS_Dout_25),
    .Dout26(CS_Dout_26),
    .Dout27(CS_Dout_27),
    .Dout28(CS_Dout_28),
    .Dout29(CS_Dout_29),
    .Dout30(CS_Dout_30),
    .Dout31(CS_Dout_31)
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
    .Din00(CS_Dout_00),
    .Din01(CS_Dout_01),
    .Din02(CS_Dout_02),
    .Din03(CS_Dout_03),
    .Din04(CS_Dout_04),
    .Din05(CS_Dout_05),
    .Din06(CS_Dout_06),
    .Din07(CS_Dout_07),
    .Din08(CS_Dout_08),
    .Din09(CS_Dout_09),
    .Din10(CS_Dout_10),
    .Din11(CS_Dout_11),
    .Din12(CS_Dout_12),
    .Din13(CS_Dout_13),
    .Din14(CS_Dout_14),
    .Din15(CS_Dout_15),
    .Din16(CS_Dout_16),
    .Din17(CS_Dout_17),
    .Din18(CS_Dout_18),
    .Din19(CS_Dout_19),
    .Din20(CS_Dout_20),
    .Din21(CS_Dout_21),
    .Din22(CS_Dout_22),
    .Din23(CS_Dout_23),
    .Din24(CS_Dout_24),
    .Din25(CS_Dout_25),
    .Din26(CS_Dout_26),
    .Din27(CS_Dout_27),
    .Din28(CS_Dout_28),
    .Din29(CS_Dout_29),
    .Din30(CS_Dout_30),
    .Din31(CS_Dout_31),
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
