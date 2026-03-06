`timescale 1ns / 1ps

module gain_ctrl(
    input   wire            clk,
    input   wire            rst,
    input   wire    [7:0]   gain_in,

    input   wire    [75:0]  Din_00,
    input   wire    [75:0]  Din_01,
    input   wire    [75:0]  Din_02,
    input   wire    [75:0]  Din_03,
    input   wire    [75:0]  Din_04,
    input   wire    [75:0]  Din_05,
    input   wire    [75:0]  Din_06,
    input   wire    [75:0]  Din_07,
    input   wire    [75:0]  Din_08,
    input   wire    [75:0]  Din_09,
    input   wire    [75:0]  Din_10,
    input   wire    [75:0]  Din_11,
    input   wire    [75:0]  Din_12,
    input   wire    [75:0]  Din_13,
    input   wire    [75:0]  Din_14,
    input   wire    [75:0]  Din_15,
    input   wire    [75:0]  Din_16,
    input   wire    [75:0]  Din_17,
    input   wire    [75:0]  Din_18,
    input   wire    [75:0]  Din_19,
    input   wire    [75:0]  Din_20,
    input   wire    [75:0]  Din_21,
    input   wire    [75:0]  Din_22,
    input   wire    [75:0]  Din_23,
    input   wire    [75:0]  Din_24,
    input   wire    [75:0]  Din_25,
    input   wire    [75:0]  Din_26,
    input   wire    [75:0]  Din_27,
    input   wire    [75:0]  Din_28,
    input   wire    [75:0]  Din_29,
    input   wire    [75:0]  Din_30,
    input   wire    [75:0]  Din_31,

    output  reg     [37:0]  max_out,

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

assign Dout_00 = {Din_00[(75 - gain_in) -: 16], Din_00[(37 - gain_in) -: 16]};
assign Dout_01 = {Din_31[(75 - gain_in) -: 16], Din_31[(37 - gain_in) -: 16]};
assign Dout_02 = {Din_30[(75 - gain_in) -: 16], Din_30[(37 - gain_in) -: 16]};
assign Dout_03 = {Din_29[(75 - gain_in) -: 16], Din_29[(37 - gain_in) -: 16]};
assign Dout_04 = {Din_28[(75 - gain_in) -: 16], Din_28[(37 - gain_in) -: 16]};
assign Dout_05 = {Din_27[(75 - gain_in) -: 16], Din_27[(37 - gain_in) -: 16]};
assign Dout_06 = {Din_26[(75 - gain_in) -: 16], Din_26[(37 - gain_in) -: 16]};
assign Dout_07 = {Din_25[(75 - gain_in) -: 16], Din_25[(37 - gain_in) -: 16]};
assign Dout_08 = {Din_24[(75 - gain_in) -: 16], Din_24[(37 - gain_in) -: 16]};
assign Dout_09 = {Din_23[(75 - gain_in) -: 16], Din_23[(37 - gain_in) -: 16]};
assign Dout_10 = {Din_22[(75 - gain_in) -: 16], Din_22[(37 - gain_in) -: 16]};
assign Dout_11 = {Din_21[(75 - gain_in) -: 16], Din_21[(37 - gain_in) -: 16]};
assign Dout_12 = {Din_20[(75 - gain_in) -: 16], Din_20[(37 - gain_in) -: 16]};
assign Dout_13 = {Din_19[(75 - gain_in) -: 16], Din_19[(37 - gain_in) -: 16]};
assign Dout_14 = {Din_18[(75 - gain_in) -: 16], Din_18[(37 - gain_in) -: 16]};
assign Dout_15 = {Din_17[(75 - gain_in) -: 16], Din_17[(37 - gain_in) -: 16]};
assign Dout_16 = {Din_16[(75 - gain_in) -: 16], Din_16[(37 - gain_in) -: 16]};
assign Dout_17 = {Din_15[(75 - gain_in) -: 16], Din_15[(37 - gain_in) -: 16]};
assign Dout_18 = {Din_14[(75 - gain_in) -: 16], Din_14[(37 - gain_in) -: 16]};
assign Dout_19 = {Din_13[(75 - gain_in) -: 16], Din_13[(37 - gain_in) -: 16]};
assign Dout_20 = {Din_12[(75 - gain_in) -: 16], Din_12[(37 - gain_in) -: 16]};
assign Dout_21 = {Din_11[(75 - gain_in) -: 16], Din_11[(37 - gain_in) -: 16]};
assign Dout_22 = {Din_10[(75 - gain_in) -: 16], Din_10[(37 - gain_in) -: 16]};
assign Dout_23 = {Din_09[(75 - gain_in) -: 16], Din_09[(37 - gain_in) -: 16]};
assign Dout_24 = {Din_08[(75 - gain_in) -: 16], Din_08[(37 - gain_in) -: 16]};
assign Dout_25 = {Din_07[(75 - gain_in) -: 16], Din_07[(37 - gain_in) -: 16]};
assign Dout_26 = {Din_06[(75 - gain_in) -: 16], Din_06[(37 - gain_in) -: 16]};
assign Dout_27 = {Din_05[(75 - gain_in) -: 16], Din_05[(37 - gain_in) -: 16]};
assign Dout_28 = {Din_04[(75 - gain_in) -: 16], Din_04[(37 - gain_in) -: 16]};
assign Dout_29 = {Din_03[(75 - gain_in) -: 16], Din_03[(37 - gain_in) -: 16]};
assign Dout_30 = {Din_02[(75 - gain_in) -: 16], Din_02[(37 - gain_in) -: 16]};
assign Dout_31 = {Din_01[(75 - gain_in) -: 16], Din_01[(37 - gain_in) -: 16]};

reg     [23:0]  cnt;
reg     [37:0]  max_reg;
reg     [37:0]  temp_out;

always @(posedge clk) begin
    if (rst) begin
        cnt     <= 'd0;
        max_out <= 'd0;
        max_reg <= 'd0;
    end
    else begin
        if (cnt == 24'd8000000)
        begin
            cnt <= 'd0;
            max_out <= max_reg;
            max_reg <= temp_out;
        end
        else begin
            cnt <= cnt + 1'd1;
            max_out <= max_out;
            if (temp_out > max_reg)
                max_reg <= temp_out;
            else
                max_reg <= max_reg;
        end   
    end
end

reg     [37:0]  temp_00R;
reg     [37:0]  temp_00I;
reg     [37:0]  temp_01R;
reg     [37:0]  temp_01I;
reg     [37:0]  temp_02R;
reg     [37:0]  temp_02I;
reg     [37:0]  temp_03R;
reg     [37:0]  temp_03I;
reg     [37:0]  temp_04R;
reg     [37:0]  temp_04I;
reg     [37:0]  temp_05R;
reg     [37:0]  temp_05I;
reg     [37:0]  temp_06R;
reg     [37:0]  temp_06I;
reg     [37:0]  temp_07R;
reg     [37:0]  temp_07I;
reg     [37:0]  temp_08R;
reg     [37:0]  temp_08I;
reg     [37:0]  temp_09R;
reg     [37:0]  temp_09I;
reg     [37:0]  temp_10R;
reg     [37:0]  temp_10I;
reg     [37:0]  temp_11R;
reg     [37:0]  temp_11I;
reg     [37:0]  temp_12R;
reg     [37:0]  temp_12I;
reg     [37:0]  temp_13R;
reg     [37:0]  temp_13I;
reg     [37:0]  temp_14R;
reg     [37:0]  temp_14I;
reg     [37:0]  temp_15R;
reg     [37:0]  temp_15I;
reg     [37:0]  temp_16R;
reg     [37:0]  temp_16I;
reg     [37:0]  temp_17R;
reg     [37:0]  temp_17I;
reg     [37:0]  temp_18R;
reg     [37:0]  temp_18I;
reg     [37:0]  temp_19R;
reg     [37:0]  temp_19I;
reg     [37:0]  temp_20R;
reg     [37:0]  temp_20I;
reg     [37:0]  temp_21R;
reg     [37:0]  temp_21I;
reg     [37:0]  temp_22R;
reg     [37:0]  temp_22I;
reg     [37:0]  temp_23R;
reg     [37:0]  temp_23I;
reg     [37:0]  temp_24R;
reg     [37:0]  temp_24I;
reg     [37:0]  temp_25R;
reg     [37:0]  temp_25I;
reg     [37:0]  temp_26R;
reg     [37:0]  temp_26I;
reg     [37:0]  temp_27R;
reg     [37:0]  temp_27I;
reg     [37:0]  temp_28R;
reg     [37:0]  temp_28I;
reg     [37:0]  temp_29R;
reg     [37:0]  temp_29I;
reg     [37:0]  temp_30R;
reg     [37:0]  temp_30I;
reg     [37:0]  temp_31R;
reg     [37:0]  temp_31I;

always @(posedge clk) begin
    if (rst) begin
        temp_00R  <= 'd0;
        temp_00I  <= 'd0;
        temp_01R  <= 'd0;
        temp_01I  <= 'd0;
        temp_02R  <= 'd0;
        temp_02I  <= 'd0;
        temp_03R  <= 'd0;
        temp_03I  <= 'd0;
        temp_04R  <= 'd0;
        temp_04I  <= 'd0;
        temp_05R  <= 'd0;
        temp_05I  <= 'd0;
        temp_06R  <= 'd0;
        temp_06I  <= 'd0;
        temp_07R  <= 'd0;
        temp_07I  <= 'd0;
        temp_08R  <= 'd0;
        temp_08I  <= 'd0;
        temp_09R  <= 'd0;
        temp_09I  <= 'd0;
        temp_10R  <= 'd0;
        temp_10I  <= 'd0;
        temp_11R  <= 'd0;
        temp_11I  <= 'd0;
        temp_12R  <= 'd0;
        temp_12I  <= 'd0;
        temp_13R  <= 'd0;
        temp_13I  <= 'd0;
        temp_14R  <= 'd0;
        temp_14I  <= 'd0;
        temp_15R  <= 'd0;
        temp_15I  <= 'd0;
        temp_16R  <= 'd0;
        temp_16I  <= 'd0;
        temp_17R  <= 'd0;
        temp_17I  <= 'd0;
        temp_18R  <= 'd0;
        temp_18I  <= 'd0;
        temp_19R  <= 'd0;
        temp_19I  <= 'd0;
        temp_20R  <= 'd0;
        temp_20I  <= 'd0;
        temp_21R  <= 'd0;
        temp_21I  <= 'd0;
        temp_22R  <= 'd0;
        temp_22I  <= 'd0;
        temp_23R  <= 'd0;
        temp_23I  <= 'd0;
        temp_24R  <= 'd0;
        temp_24I  <= 'd0;
        temp_25R  <= 'd0;
        temp_25I  <= 'd0;
        temp_26R  <= 'd0;
        temp_26I  <= 'd0;
        temp_27R  <= 'd0;
        temp_27I  <= 'd0;
        temp_28R  <= 'd0;
        temp_28I  <= 'd0;
        temp_29R  <= 'd0;
        temp_29I  <= 'd0;
        temp_30R  <= 'd0;
        temp_30I  <= 'd0;
        temp_31R  <= 'd0;
        temp_31I  <= 'd0;
    end
    else begin
        if (Din_00[75])
            temp_00I   <= ~Din_00[75:38] + 1;
        else
            temp_00I   <= Din_00[75:38];
        if (Din_00[37])
            temp_00R   <= ~Din_00[37:0] + 1;
        else
            temp_00R   <= Din_00[37:0];

        if (Din_01[75])
            temp_01I   <= ~Din_01[75:38] + 1;
        else
            temp_01I   <= Din_01[75:38];
        if (Din_01[37])
            temp_01R   <= ~Din_01[37:0] + 1;
        else
            temp_01R   <= Din_01[37:0];

        if (Din_02[75])
            temp_02I   <= ~Din_02[75:38] + 1;
        else
            temp_02I   <= Din_02[75:38];
        if (Din_02[37])
            temp_02R   <= ~Din_02[37:0] + 1;
        else
            temp_02R   <= Din_02[37:0];

        if (Din_03[75])
            temp_03I   <= ~Din_03[75:38] + 1;
        else
            temp_03I   <= Din_03[75:38];
        if (Din_03[37])
            temp_03R   <= ~Din_03[37:0] + 1;
        else
            temp_03R   <= Din_03[37:0];

        if (Din_04[75])
            temp_04I   <= ~Din_04[75:38] + 1;
        else
            temp_04I   <= Din_04[75:38];
        if (Din_04[37])
            temp_04R   <= ~Din_04[37:0] + 1;
        else
            temp_04R   <= Din_04[37:0];

        if (Din_05[75])
            temp_05I   <= ~Din_05[75:38] + 1;
        else
            temp_05I   <= Din_05[75:38];
        if (Din_05[37])
            temp_05R   <= ~Din_05[37:0] + 1;
        else
            temp_05R   <= Din_05[37:0];

        if (Din_06[75])
            temp_06I   <= ~Din_06[75:38] + 1;
        else
            temp_06I   <= Din_06[75:38];
        if (Din_06[37])
            temp_06R   <= ~Din_06[37:0] + 1;
        else
            temp_06R   <= Din_06[37:0];

        if (Din_07[75])
            temp_07I   <= ~Din_07[75:38] + 1;
        else
            temp_07I   <= Din_07[75:38];
        if (Din_07[37])
            temp_07R   <= ~Din_07[37:0] + 1;
        else
            temp_07R   <= Din_07[37:0];

        if (Din_08[75])
            temp_08I   <= ~Din_08[75:38] + 1;
        else
            temp_08I   <= Din_08[75:38];
        if (Din_08[37])
            temp_08R   <= ~Din_08[37:0] + 1;
        else
            temp_08R   <= Din_08[37:0];

        if (Din_09[75])
            temp_09I   <= ~Din_09[75:38] + 1;
        else
            temp_09I   <= Din_09[75:38];
        if (Din_09[37])
            temp_09R   <= ~Din_09[37:0] + 1;
        else
            temp_09R   <= Din_09[37:0];

        if (Din_10[75])
            temp_10I   <= ~Din_10[75:38] + 1;
        else
            temp_10I   <= Din_10[75:38];
        if (Din_10[37])
            temp_10R   <= ~Din_10[37:0] + 1;
        else
            temp_10R   <= Din_10[37:0];

        if (Din_11[75])
            temp_11I   <= ~Din_11[75:38] + 1;
        else
            temp_11I   <= Din_11[75:38];
        if (Din_11[37])
            temp_11R   <= ~Din_11[37:0] + 1;
        else
            temp_11R   <= Din_11[37:0];

        if (Din_12[75])
            temp_12I   <= ~Din_12[75:38] + 1;
        else
            temp_12I   <= Din_12[75:38];
        if (Din_12[37])
            temp_12R   <= ~Din_12[37:0] + 1;
        else
            temp_12R   <= Din_12[37:0];

        if (Din_13[75])
            temp_13I   <= ~Din_13[75:38] + 1;
        else
            temp_13I   <= Din_13[75:38];
        if (Din_13[37])
            temp_13R   <= ~Din_13[37:0] + 1;
        else
            temp_13R   <= Din_13[37:0];

        if (Din_14[75])
            temp_14I   <= ~Din_14[75:38] + 1;
        else
            temp_14I   <= Din_14[75:38];
        if (Din_14[37])
            temp_14R   <= ~Din_14[37:0] + 1;
        else
            temp_14R   <= Din_14[37:0];

        if (Din_15[75])
            temp_15I   <= ~Din_15[75:38] + 1;
        else
            temp_15I   <= Din_15[75:38];
        if (Din_15[37])
            temp_15R   <= ~Din_15[37:0] + 1;
        else
            temp_15R   <= Din_15[37:0];

        if (Din_16[75])
            temp_16I   <= ~Din_16[75:38] + 1;
        else
            temp_16I   <= Din_16[75:38];
        if (Din_16[37])
            temp_16R   <= ~Din_16[37:0] + 1;
        else
            temp_16R   <= Din_16[37:0];

        if (Din_17[75])
            temp_17I   <= ~Din_17[75:38] + 1;
        else
            temp_17I   <= Din_17[75:38];
        if (Din_17[37])
            temp_17R   <= ~Din_17[37:0] + 1;
        else
            temp_17R   <= Din_17[37:0];

        if (Din_18[75])
            temp_18I   <= ~Din_18[75:38] + 1;
        else
            temp_18I   <= Din_18[75:38];
        if (Din_18[37])
            temp_18R   <= ~Din_18[37:0] + 1;
        else
            temp_18R   <= Din_18[37:0];

        if (Din_19[75])
            temp_19I   <= ~Din_19[75:38] + 1;
        else
            temp_19I   <= Din_19[75:38];
        if (Din_19[37])
            temp_19R   <= ~Din_19[37:0] + 1;
        else
            temp_19R   <= Din_19[37:0];

        if (Din_20[75])
            temp_20I   <= ~Din_20[75:38] + 1;
        else
            temp_20I   <= Din_20[75:38];
        if (Din_20[37])
            temp_20R   <= ~Din_20[37:0] + 1;
        else
            temp_20R   <= Din_20[37:0];

        if (Din_21[75])
            temp_21I   <= ~Din_21[75:38] + 1;
        else
            temp_21I   <= Din_21[75:38];
        if (Din_21[37])
            temp_21R   <= ~Din_21[37:0] + 1;
        else
            temp_21R   <= Din_21[37:0];

        if (Din_22[75])
            temp_22I   <= ~Din_22[75:38] + 1;
        else
            temp_22I   <= Din_22[75:38];
        if (Din_22[37])
            temp_22R   <= ~Din_22[37:0] + 1;
        else
            temp_22R   <= Din_22[37:0];

        if (Din_23[75])
            temp_23I   <= ~Din_23[75:38] + 1;
        else
            temp_23I   <= Din_23[75:38];
        if (Din_23[37])
            temp_23R   <= ~Din_23[37:0] + 1;
        else
            temp_23R   <= Din_23[37:0];

        if (Din_24[75])
            temp_24I   <= ~Din_24[75:38] + 1;
        else
            temp_24I   <= Din_24[75:38];
        if (Din_24[37])
            temp_24R   <= ~Din_24[37:0] + 1;
        else
            temp_24R   <= Din_24[37:0];

        if (Din_25[75])
            temp_25I   <= ~Din_25[75:38] + 1;
        else
            temp_25I   <= Din_25[75:38];
        if (Din_25[37])
            temp_25R   <= ~Din_25[37:0] + 1;
        else
            temp_25R   <= Din_25[37:0];

        if (Din_26[75])
            temp_26I   <= ~Din_26[75:38] + 1;
        else
            temp_26I   <= Din_26[75:38];
        if (Din_26[37])
            temp_26R   <= ~Din_26[37:0] + 1;
        else
            temp_26R   <= Din_26[37:0];

        if (Din_27[75])
            temp_27I   <= ~Din_27[75:38] + 1;
        else
            temp_27I   <= Din_27[75:38];
        if (Din_27[37])
            temp_27R   <= ~Din_27[37:0] + 1;
        else
            temp_27R   <= Din_27[37:0];

        if (Din_28[75])
            temp_28I   <= ~Din_28[75:38] + 1;
        else
            temp_28I   <= Din_28[75:38];
        if (Din_28[37])
            temp_28R   <= ~Din_28[37:0] + 1;
        else
            temp_28R   <= Din_28[37:0];

        if (Din_29[75])
            temp_29I   <= ~Din_29[75:38] + 1;
        else
            temp_29I   <= Din_29[75:38];
        if (Din_29[37])
            temp_29R   <= ~Din_29[37:0] + 1;
        else
            temp_29R   <= Din_29[37:0];

        if (Din_30[75])
            temp_30I   <= ~Din_30[75:38] + 1;
        else
            temp_30I   <= Din_30[75:38];
        if (Din_30[37])
            temp_30R   <= ~Din_30[37:0] + 1;
        else
            temp_30R   <= Din_30[37:0];

        if (Din_31[75])
            temp_31I   <= ~Din_31[75:38] + 1;
        else
            temp_31I   <= Din_31[75:38];
        if (Din_31[37])
            temp_31R   <= ~Din_31[37:0] + 1;
        else
            temp_31R   <= Din_31[37:0];     
    end
end

reg     [37:0]  temp_00;
reg     [37:0]  temp_01;
reg     [37:0]  temp_02;
reg     [37:0]  temp_03;
reg     [37:0]  temp_04;
reg     [37:0]  temp_05;
reg     [37:0]  temp_06;
reg     [37:0]  temp_07;
reg     [37:0]  temp_08;
reg     [37:0]  temp_09;
reg     [37:0]  temp_10;
reg     [37:0]  temp_11;
reg     [37:0]  temp_12;
reg     [37:0]  temp_13;
reg     [37:0]  temp_14;
reg     [37:0]  temp_15;
reg     [37:0]  temp_16;
reg     [37:0]  temp_17;
reg     [37:0]  temp_18;
reg     [37:0]  temp_19;
reg     [37:0]  temp_20;
reg     [37:0]  temp_21;
reg     [37:0]  temp_22;
reg     [37:0]  temp_23;
reg     [37:0]  temp_24;
reg     [37:0]  temp_25;
reg     [37:0]  temp_26;
reg     [37:0]  temp_27;
reg     [37:0]  temp_28;
reg     [37:0]  temp_29;
reg     [37:0]  temp_30;
reg     [37:0]  temp_31;

always @(posedge clk) begin
    if (rst) begin
        temp_00     <= 'd0;
        temp_01     <= 'd0;
        temp_02     <= 'd0;
        temp_03     <= 'd0;
        temp_04     <= 'd0;
        temp_05     <= 'd0;
        temp_06     <= 'd0;
        temp_07     <= 'd0;
        temp_08     <= 'd0;
        temp_09     <= 'd0;
        temp_10     <= 'd0;
        temp_11     <= 'd0;
        temp_12     <= 'd0;
        temp_13     <= 'd0;
        temp_14     <= 'd0;
        temp_15     <= 'd0;
        temp_16     <= 'd0;
        temp_17     <= 'd0;
        temp_18     <= 'd0;
        temp_19     <= 'd0;
        temp_20     <= 'd0;
        temp_21     <= 'd0;
        temp_22     <= 'd0;
        temp_23     <= 'd0;
        temp_24     <= 'd0;
        temp_25     <= 'd0;
        temp_26     <= 'd0;
        temp_27     <= 'd0;
        temp_28     <= 'd0;
        temp_29     <= 'd0;
        temp_30     <= 'd0;
        temp_31     <= 'd0;
    end
    else begin
        if (temp_00I > temp_00R)
            temp_00 <= temp_00I;
        else
            temp_00 <= temp_00R;

        if (temp_01I > temp_01R)
            temp_01 <= temp_01I;
        else
            temp_01 <= temp_01R;

        if (temp_02I > temp_02R)
            temp_02 <= temp_02I;
        else
            temp_02 <= temp_02R;

        if (temp_03I > temp_03R)
            temp_03 <= temp_03I;
        else
            temp_03 <= temp_03R;

        if (temp_04I > temp_04R)
            temp_04 <= temp_04I;
        else
            temp_04 <= temp_04R;

        if (temp_05I > temp_05R)
            temp_05 <= temp_05I;
        else
            temp_05 <= temp_05R;

        if (temp_06I > temp_06R)
            temp_06 <= temp_06I;
        else
            temp_06 <= temp_06R;

        if (temp_07I > temp_07R)
            temp_07 <= temp_07I;
        else
            temp_07 <= temp_07R;

        if (temp_08I > temp_08R)
            temp_08 <= temp_08I;
        else
            temp_08 <= temp_08R;

        if (temp_09I > temp_09R)
            temp_09 <= temp_09I;
        else
            temp_09 <= temp_09R;

        if (temp_10I > temp_10R)
            temp_10 <= temp_10I;
        else
            temp_10 <= temp_10R;

        if (temp_11I > temp_11R)
            temp_11 <= temp_11I;
        else
            temp_11 <= temp_11R;

        if (temp_12I > temp_12R)
            temp_12 <= temp_12I;
        else
            temp_12 <= temp_12R;

        if (temp_13I > temp_13R)
            temp_13 <= temp_13I;
        else
            temp_13 <= temp_13R;

        if (temp_14I > temp_14R)
            temp_14 <= temp_14I;
        else
            temp_14 <= temp_14R;

        if (temp_15I > temp_15R)
            temp_15 <= temp_15I;
        else
            temp_15 <= temp_15R;

        if (temp_16I > temp_16R)
            temp_16 <= temp_16I;
        else
            temp_16 <= temp_16R;

        if (temp_17I > temp_17R)
            temp_17 <= temp_17I;
        else
            temp_17 <= temp_17R;

        if (temp_18I > temp_18R)
            temp_18 <= temp_18I;
        else
            temp_18 <= temp_18R;

        if (temp_19I > temp_19R)
            temp_19 <= temp_19I;
        else
            temp_19 <= temp_19R;

        if (temp_20I > temp_20R)
            temp_20 <= temp_20I;
        else
            temp_20 <= temp_20R;

        if (temp_21I > temp_21R)
            temp_21 <= temp_21I;
        else
            temp_21 <= temp_21R;

        if (temp_22I > temp_22R)
            temp_22 <= temp_22I;
        else
            temp_22 <= temp_22R;

        if (temp_23I > temp_23R)
            temp_23 <= temp_23I;
        else
            temp_23 <= temp_23R;

        if (temp_24I > temp_24R)
            temp_24 <= temp_24I;
        else
            temp_24 <= temp_24R;

        if (temp_25I > temp_25R)
            temp_25 <= temp_25I;
        else
            temp_25 <= temp_25R;

        if (temp_26I > temp_26R)
            temp_26 <= temp_26I;
        else
            temp_26 <= temp_26R;

        if (temp_27I > temp_27R)
            temp_27 <= temp_27I;
        else
            temp_27 <= temp_27R;

        if (temp_28I > temp_28R)
            temp_28 <= temp_28I;
        else
            temp_28 <= temp_28R;

        if (temp_29I > temp_29R)
            temp_29 <= temp_29I;
        else
            temp_29 <= temp_29R;

        if (temp_30I > temp_30R)
            temp_30 <= temp_30I;
        else
            temp_30 <= temp_30R;

        if (temp_31I > temp_31R)
            temp_31 <= temp_31I;
        else
            temp_31 <= temp_31R;
    end
end

reg     [37:0]  temp_s1_00;
reg     [37:0]  temp_s1_01;
reg     [37:0]  temp_s1_02;
reg     [37:0]  temp_s1_03;
reg     [37:0]  temp_s1_04;
reg     [37:0]  temp_s1_05;
reg     [37:0]  temp_s1_06;
reg     [37:0]  temp_s1_07;
reg     [37:0]  temp_s1_08;
reg     [37:0]  temp_s1_09;
reg     [37:0]  temp_s1_10;
reg     [37:0]  temp_s1_11;
reg     [37:0]  temp_s1_12;
reg     [37:0]  temp_s1_13;
reg     [37:0]  temp_s1_14;
reg     [37:0]  temp_s1_15;

always @(posedge clk) begin
    if (rst) begin
        temp_s1_00  <= 'd0;
        temp_s1_01  <= 'd0;
        temp_s1_02  <= 'd0;
        temp_s1_03  <= 'd0;
        temp_s1_04  <= 'd0;
        temp_s1_05  <= 'd0;
        temp_s1_06  <= 'd0;
        temp_s1_07  <= 'd0;
        temp_s1_08  <= 'd0;
        temp_s1_09  <= 'd0;
        temp_s1_10  <= 'd0;
        temp_s1_11  <= 'd0;
        temp_s1_12  <= 'd0;
        temp_s1_13  <= 'd0;
        temp_s1_14  <= 'd0;
        temp_s1_15  <= 'd0;
    end
    else begin
        if (temp_00 >= temp_01)
            temp_s1_00  <=  temp_00;
        else
            temp_s1_00  <=  temp_01;

        if (temp_02 >= temp_03)
            temp_s1_01  <=  temp_02;
        else
            temp_s1_01  <=  temp_03;

        if (temp_04 >= temp_05)
            temp_s1_02  <=  temp_04;
        else
            temp_s1_02  <=  temp_05;

        if (temp_06 >= temp_07)
            temp_s1_03  <=  temp_06;
        else
            temp_s1_03  <=  temp_07;

        if (temp_08 >= temp_09)
            temp_s1_04  <=  temp_08;
        else
            temp_s1_04  <=  temp_09;

        if (temp_10 >= temp_11)
            temp_s1_05  <=  temp_10;
        else
            temp_s1_05  <=  temp_11;

        if (temp_12 >= temp_13)
            temp_s1_06  <=  temp_12;
        else
            temp_s1_06  <=  temp_13;

        if (temp_14 >= temp_15)
            temp_s1_07  <=  temp_14;
        else
            temp_s1_07  <=  temp_15;

        if (temp_16 >= temp_17)
            temp_s1_08  <=  temp_16;
        else
            temp_s1_08  <=  temp_17;

        if (temp_18 >= temp_19)
            temp_s1_09  <=  temp_18;
        else
            temp_s1_09  <=  temp_19;

        if (temp_20 >= temp_21)
            temp_s1_10  <=  temp_20;
        else
            temp_s1_10  <=  temp_21;

        if (temp_22 >= temp_23)
            temp_s1_11  <=  temp_22;
        else
            temp_s1_11  <=  temp_23;

        if (temp_24 >= temp_25)
            temp_s1_12  <=  temp_24;
        else
            temp_s1_12  <=  temp_25;

        if (temp_26 >= temp_27)
            temp_s1_13  <=  temp_26;
        else
            temp_s1_13  <=  temp_27;

        if (temp_28 >= temp_29)
            temp_s1_14  <=  temp_28;
        else
            temp_s1_14  <=  temp_29;

        if (temp_30 >= temp_31)
            temp_s1_15  <=  temp_30;
        else
            temp_s1_15  <=  temp_31;
    end
end

reg     [37:0]  temp_s2_00;
reg     [37:0]  temp_s2_01;
reg     [37:0]  temp_s2_02;
reg     [37:0]  temp_s2_03;
reg     [37:0]  temp_s2_04;
reg     [37:0]  temp_s2_05;
reg     [37:0]  temp_s2_06;
reg     [37:0]  temp_s2_07;

always @(posedge clk) begin
    if (rst) begin
        temp_s2_00  <= 'd0;
        temp_s2_01  <= 'd0;
        temp_s2_02  <= 'd0;
        temp_s2_03  <= 'd0;
        temp_s2_04  <= 'd0;
        temp_s2_05  <= 'd0;
        temp_s2_06  <= 'd0;
        temp_s2_07  <= 'd0;
    end
    else begin
        if (temp_s1_00 >= temp_s1_01)
            temp_s2_00  <=  temp_s1_00;
        else
            temp_s2_00  <=  temp_s1_01;

        if (temp_s1_02 >= temp_s1_03)
            temp_s2_01  <=  temp_s1_02;
        else
            temp_s2_01  <=  temp_s1_03;

        if (temp_s1_04 >= temp_s1_05)
            temp_s2_02  <=  temp_s1_04;
        else
            temp_s2_02  <=  temp_s1_05;

        if (temp_s1_06 >= temp_s1_07)
            temp_s2_03  <=  temp_s1_06;
        else
            temp_s2_03  <=  temp_s1_07;

        if (temp_s1_08 >= temp_s1_09)
            temp_s2_04  <=  temp_s1_08;
        else
            temp_s2_04  <=  temp_s1_09;

        if (temp_s1_10 >= temp_s1_11)
            temp_s2_05  <=  temp_s1_10;
        else
            temp_s2_05  <=  temp_s1_11;

        if (temp_s1_12 >= temp_s1_13)
            temp_s2_06  <=  temp_s1_12;
        else
            temp_s2_06  <=  temp_s1_13;

        if (temp_s1_14 >= temp_s1_15)
            temp_s2_07  <=  temp_s1_14;
        else
            temp_s2_07  <=  temp_s1_15;
    end
end

reg     [37:0]  temp_s3_00;
reg     [37:0]  temp_s3_01;
reg     [37:0]  temp_s3_02;
reg     [37:0]  temp_s3_03;

always @(posedge clk) begin
    if (rst) begin
        temp_s3_00  <=  'd0;
        temp_s3_01  <=  'd0;
        temp_s3_02  <=  'd0;
        temp_s3_03  <=  'd0;
    end
    else begin
        if (temp_s2_00 >= temp_s2_01)
            temp_s3_00  <=  temp_s2_00;
        else
            temp_s3_00  <=  temp_s2_01;

        if (temp_s2_02 >= temp_s2_03)
            temp_s3_01  <=  temp_s2_02;
        else
            temp_s3_01  <=  temp_s2_03;

        if (temp_s2_04 >= temp_s2_05)
            temp_s3_02  <=  temp_s2_04;
        else
            temp_s3_02  <=  temp_s2_05;

        if (temp_s2_06 >= temp_s2_07)
            temp_s3_03  <=  temp_s2_06;
        else
            temp_s3_03  <=  temp_s2_07;
    end
end

reg     [37:0]  temp_s4_00;
reg     [37:0]  temp_s4_01;

always @(posedge clk) begin
    if (rst) begin
        temp_s4_00  <=  'd0;
        temp_s4_01  <=  'd0;
    end
    else begin
        if (temp_s3_00 >= temp_s3_01)
            temp_s4_00  <=  temp_s3_00;
        else
            temp_s4_00  <=  temp_s3_01;

        if (temp_s3_02 >= temp_s3_03)
            temp_s4_01  <=  temp_s3_02;
        else
            temp_s4_01  <=  temp_s3_03;
    end
end

always @(posedge clk) begin
    if (rst) begin
        temp_out  <=  'd0;
    end
    else begin
        if (temp_s4_00 >= temp_s4_01)
            temp_out  <=  temp_s4_00;
        else
            temp_out  <=  temp_s4_01;
    end
end

endmodule
