`timescale 1ns / 1ps

module inputCommutator(
    input   wire            clk_in,
    input   wire            clk_out,
    input   wire            rst,
    input   wire    [127:0] data_in,
    output  reg     [11:0]  dout_00,
    output  reg     [11:0]  dout_01,
    output  reg     [11:0]  dout_02,
    output  reg     [11:0]  dout_03,
    output  reg     [11:0]  dout_04,
    output  reg     [11:0]  dout_05,
    output  reg     [11:0]  dout_06,
    output  reg     [11:0]  dout_07,
    output  reg     [11:0]  dout_08,
    output  reg     [11:0]  dout_09,
    output  reg     [11:0]  dout_10,
    output  reg     [11:0]  dout_11,
    output  reg     [11:0]  dout_12,
    output  reg     [11:0]  dout_13,
    output  reg     [11:0]  dout_14,
    output  reg     [11:0]  dout_15,
    output  reg     [11:0]  dout_16,
    output  reg     [11:0]  dout_17,
    output  reg     [11:0]  dout_18,
    output  reg     [11:0]  dout_19,
    output  reg     [11:0]  dout_20,
    output  reg     [11:0]  dout_21,
    output  reg     [11:0]  dout_22,
    output  reg     [11:0]  dout_23,
    output  reg     [11:0]  dout_24,
    output  reg     [11:0]  dout_25,
    output  reg     [11:0]  dout_26,
    output  reg     [11:0]  dout_27,
    output  reg     [11:0]  dout_28,
    output  reg     [11:0]  dout_29,
    output  reg     [11:0]  dout_30,
    output  reg     [11:0]  dout_31,
    output  reg     [11:0]  dout_32,
    output  reg     [11:0]  dout_33,
    output  reg     [11:0]  dout_34,
    output  reg     [11:0]  dout_35,
    output  reg     [11:0]  dout_36,
    output  reg     [11:0]  dout_37,
    output  reg     [11:0]  dout_38,
    output  reg     [11:0]  dout_39,
    output  reg     [11:0]  dout_40,
    output  reg     [11:0]  dout_41,
    output  reg     [11:0]  dout_42,
    output  reg     [11:0]  dout_43,
    output  reg     [11:0]  dout_44,
    output  reg     [11:0]  dout_45,
    output  reg     [11:0]  dout_46,
    output  reg     [11:0]  dout_47,
    output  reg     [11:0]  dout_48,
    output  reg     [11:0]  dout_49,
    output  reg     [11:0]  dout_50,
    output  reg     [11:0]  dout_51,
    output  reg     [11:0]  dout_52,
    output  reg     [11:0]  dout_53,
    output  reg     [11:0]  dout_54,
    output  reg     [11:0]  dout_55,
    output  reg     [11:0]  dout_56,
    output  reg     [11:0]  dout_57,
    output  reg     [11:0]  dout_58,
    output  reg     [11:0]  dout_59,
    output  reg     [11:0]  dout_60,
    output  reg     [11:0]  dout_61,
    output  reg     [11:0]  dout_62,
    output  reg     [11:0]  dout_63,
    output  reg     [11:0]  dout_64,
    output  reg     [11:0]  dout_65,
    output  reg     [11:0]  dout_66,
    output  reg     [11:0]  dout_67,
    output  reg     [11:0]  dout_68,
    output  reg     [11:0]  dout_69,
    output  reg     [11:0]  dout_70,
    output  reg     [11:0]  dout_71,
    output  reg     [11:0]  dout_72,
    output  reg     [11:0]  dout_73,
    output  reg     [11:0]  dout_74,
    output  reg     [11:0]  dout_75,
    output  reg     [11:0]  dout_76,
    output  reg     [11:0]  dout_77,
    output  reg     [11:0]  dout_78,
    output  reg     [11:0]  dout_79,
    output  reg     [11:0]  dout_80,
    output  reg     [11:0]  dout_81,
    output  reg     [11:0]  dout_82,
    output  reg     [11:0]  dout_83,
    output  reg     [11:0]  dout_84,
    output  reg     [11:0]  dout_85,
    output  reg     [11:0]  dout_86,
    output  reg     [11:0]  dout_87,
    output  reg     [11:0]  dout_88,
    output  reg     [11:0]  dout_89,
    output  reg     [11:0]  dout_90,
    output  reg     [11:0]  dout_91,
    output  reg     [11:0]  dout_92,
    output  reg     [11:0]  dout_93,
    output  reg     [11:0]  dout_94,
    output  reg     [11:0]  dout_95
);

reg             rd_en;
wire [383:0]    Din;
wire            fifo_empty;
input_fifo input_fifo_i (
  .rst(rst),       
  .wr_clk(clk_in), 
  .rd_clk(clk_out), 
  .din({data_in[127 -: 12], data_in[111 -: 12], data_in[95 -: 12], data_in[79 -: 12], data_in[63 -: 12], data_in[47 -: 12], data_in[31 -: 12], data_in[15 -: 12]}),       
  .wr_en(1'd1),   
  .rd_en(rd_en),   
  .dout(Din),     
  .full(),     
  .empty(fifo_empty)    
);

reg [3:0]       counter;
reg [287:0]     din_reg;
reg [287:0]     cir_reg;
always @(posedge clk_out) begin
    if (rst | fifo_empty) begin
        counter <= 4'd0;
    end 
    else begin
        if (counter < 6)
            counter <= counter + 1'd1;
        else
            counter <= 4'd3;
    end
end

always @(posedge clk_out) begin
    if (rst) begin
        rd_en        <= 1'b0;
        din_reg      <= 288'd0;
        cir_reg      <= 288'd0;
    end
    else begin
        case (counter)
            3:
            begin
                rd_en           <= 1'b1;
                din_reg         <= { Din[191 -: 96],
                                     Din[287 -: 96],
                                     Din[383 -: 96]};
                cir_reg[95:0]   <=   Din[ 95 -: 96];
            end
            4:
            begin
                rd_en           <= 1'b0;
                din_reg         <= {Din[287 -: 96],
                                    Din[383 -: 96],
                                    cir_reg[95:0]};
                cir_reg[191:0]  <= {Din[ 95 -: 96],
                                    Din[191 -: 96]};
            end
            5:
            begin
                rd_en        <= 1'b1;
                din_reg      <= {Din[383 -: 96], 
                                 cir_reg[191:0]};
                cir_reg      <= {Din[ 95 -: 96],
                                 Din[191 -: 96],
                                 Din[287 -: 96]};
            end
            6:
            begin
                rd_en        <= 1'b1;
                din_reg      <= cir_reg;
                cir_reg      <= cir_reg;
            end
            default:
            begin
                rd_en        <= 1'b0;
                din_reg      <= 288'd0;
                cir_reg      <= 288'd0;
            end
        endcase
    end
end

always @(posedge clk_out) begin
    dout_00 <=  din_reg[287:276];
    dout_01 <=  din_reg[275:264];
    dout_02 <=  din_reg[263:252];
    dout_03 <=  din_reg[251:240];
    dout_04 <=  din_reg[239:228];
    dout_05 <=  din_reg[227:216];
    dout_06 <=  din_reg[215:204];
    dout_07 <=  din_reg[203:192];
    dout_08 <=  din_reg[191:180];
    dout_09 <=  din_reg[179:168];
    dout_10 <=  din_reg[167:156];
    dout_11 <=  din_reg[155:144];
    dout_12 <=  din_reg[143:132];
    dout_13 <=  din_reg[131:120];
    dout_14 <=  din_reg[119:108];
    dout_15 <=  din_reg[107: 96];
    dout_16 <=  din_reg[ 95: 84];
    dout_17 <=  din_reg[ 83: 72];
    dout_18 <=  din_reg[ 71: 60];
    dout_19 <=  din_reg[ 59: 48];
    dout_20 <=  din_reg[ 47: 36];
    dout_21 <=  din_reg[ 35: 24];
    dout_22 <=  din_reg[ 23: 12];
    dout_23 <=  din_reg[ 11:  0];
    dout_24 <=  dout_00;
    dout_25 <=  dout_01;
    dout_26 <=  dout_02;
    dout_27 <=  dout_03;
    dout_28 <=  dout_04;
    dout_29 <=  dout_05;
    dout_30 <=  dout_06;
    dout_31 <=  dout_07;
    dout_32 <=  dout_08;
    dout_33 <=  dout_09;
    dout_34 <=  dout_10;
    dout_35 <=  dout_11;
    dout_36 <=  dout_12;
    dout_37 <=  dout_13;
    dout_38 <=  dout_14;
    dout_39 <=  dout_15;
    dout_40 <=  dout_16;
    dout_41 <=  dout_17;
    dout_42 <=  dout_18;
    dout_43 <=  dout_19;
    dout_44 <=  dout_20;
    dout_45 <=  dout_21;
    dout_46 <=  dout_22;
    dout_47 <=  dout_23;
    dout_48 <=  dout_24;
    dout_49 <=  dout_25;
    dout_50 <=  dout_26;
    dout_51 <=  dout_27;
    dout_52 <=  dout_28;
    dout_53 <=  dout_29;
    dout_54 <=  dout_30;
    dout_55 <=  dout_31;
    dout_56 <=  dout_32;
    dout_57 <=  dout_33;
    dout_58 <=  dout_34;
    dout_59 <=  dout_35;
    dout_60 <=  dout_36;
    dout_61 <=  dout_37;
    dout_62 <=  dout_38;
    dout_63 <=  dout_39;
    dout_64 <=  dout_40;
    dout_65 <=  dout_41;
    dout_66 <=  dout_42;
    dout_67 <=  dout_43;
    dout_68 <=  dout_44;
    dout_69 <=  dout_45;
    dout_70 <=  dout_46;
    dout_71 <=  dout_47;
    dout_72 <=  dout_48;
    dout_73 <=  dout_49;
    dout_74 <=  dout_50;
    dout_75 <=  dout_51;
    dout_76 <=  dout_52;
    dout_77 <=  dout_53;
    dout_78 <=  dout_54;
    dout_79 <=  dout_55;
    dout_80 <=  dout_56;
    dout_81 <=  dout_57;
    dout_82 <=  dout_58;
    dout_83 <=  dout_59;
    dout_84 <=  dout_60;
    dout_85 <=  dout_61;
    dout_86 <=  dout_62;
    dout_87 <=  dout_63;
    dout_88 <=  dout_64;
    dout_89 <=  dout_65;
    dout_90 <=  dout_66;
    dout_91 <=  dout_67;
    dout_92 <=  dout_68;
    dout_93 <=  dout_69;
    dout_94 <=  dout_70;
    dout_95 <=  dout_71;
end

endmodule
