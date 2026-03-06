`timescale 1ns / 1ps

module DFT_16P(
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
    output  wire    [101:0]  Dout_00,
    output  wire    [101:0]  Dout_01,
    output  wire    [101:0]  Dout_02,
    output  wire    [101:0]  Dout_03,
    output  wire    [101:0]  Dout_04,
    output  wire    [101:0]  Dout_05,
    output  wire    [101:0]  Dout_06,
    output  wire    [101:0]  Dout_07,
    output  wire    [101:0]  Dout_08,
    output  wire    [101:0]  Dout_09,
    output  wire    [101:0]  Dout_10,
    output  wire    [101:0]  Dout_11,
    output  wire    [101:0]  Dout_12,
    output  wire    [101:0]  Dout_13,
    output  wire    [101:0]  Dout_14,
    output  wire    [101:0]  Dout_15
);

wire    [67:0]  Dout00;
wire    [67:0]  Dout01;
wire    [67:0]  Dout02;
wire    [67:0]  Dout03;
wire    [67:0]  Dout10;
wire    [67:0]  Dout11;
wire    [67:0]  Dout12;
wire    [67:0]  Dout13;
wire    [67:0]  Dout20;
wire    [67:0]  Dout21;
wire    [67:0]  Dout22;
wire    [67:0]  Dout23;
wire    [67:0]  Dout30;
wire    [67:0]  Dout31;
wire    [67:0]  Dout32;
wire    [67:0]  Dout33;


DFT_4P #(
    .InputWidth (32)
) DFT_4P_00
(
    .clk    (clk),
    .Din0   ({32'd0,Din00}), 
    .Din1   ({32'd0,Din04}), 
    .Din2   ({32'd0,Din08}), 
    .Din3   ({32'd0,Din12}),
    .Dout0  (Dout00),
    .Dout1  (Dout01),
    .Dout2  (Dout02),
    .Dout3  (Dout03)
);

DFT_4P #(
    .InputWidth (32)
) DFT_4P_01
(
    .clk    (clk),
    .Din0   ({32'd0,Din01}), 
    .Din1   ({32'd0,Din05}), 
    .Din2   ({32'd0,Din09}), 
    .Din3   ({32'd0,Din13}),
    .Dout0  (Dout10),
    .Dout1  (Dout11),
    .Dout2  (Dout12),
    .Dout3  (Dout13)
);

DFT_4P #(
    .InputWidth (32)
) DFT_4P_02
(
    .clk    (clk),
    .Din0   ({32'd0,Din02}), 
    .Din1   ({32'd0,Din06}), 
    .Din2   ({32'd0,Din10}), 
    .Din3   ({32'd0,Din14}),
    .Dout0  (Dout20),
    .Dout1  (Dout21),
    .Dout2  (Dout22),
    .Dout3  (Dout23)
);

DFT_4P #(
    .InputWidth (32)
) DFT_4P_03
(
    .clk    (clk),
    .Din0   ({32'd0,Din03}), 
    .Din1   ({32'd0,Din07}), 
    .Din2   ({32'd0,Din11}), 
    .Din3   ({32'd0,Din15}),
    .Dout0  (Dout30),
    .Dout1  (Dout31),
    .Dout2  (Dout32),
    .Dout3  (Dout33)
);


wire    [111:0]  dout_cmpy00;
wire    [111:0]  dout_cmpy01;
wire    [111:0]  dout_cmpy02;
wire    [111:0]  dout_cmpy03;
wire    [111:0]  dout_cmpy10;
wire    [111:0]  dout_cmpy11;
wire    [111:0]  dout_cmpy12;
wire    [111:0]  dout_cmpy13;
wire    [111:0]  dout_cmpy20;
wire    [111:0]  dout_cmpy21;
wire    [111:0]  dout_cmpy22;
wire    [111:0]  dout_cmpy23;
wire    [111:0]  dout_cmpy30;
wire    [111:0]  dout_cmpy31;
wire    [111:0]  dout_cmpy32;
wire    [111:0]  dout_cmpy33;

dft16_cmpy cmpy00 (
  .aclk(clk),                             
  .s_axis_a_tvalid(1'd1),        
  .s_axis_a_tdata({{6{Dout00[67]}}, Dout00[67:34], {6{Dout00[33]}}, Dout00[33:0]}),
  .s_axis_b_tvalid(1'd1),        
  .s_axis_b_tdata({32'h0,32'h7FFFFFFF}),        
  .m_axis_dout_tvalid(), 
  .m_axis_dout_tdata(dout_cmpy00)    
);

dft16_cmpy cmpy01 (
  .aclk(clk),                             
  .s_axis_a_tvalid(1'd1),        
  .s_axis_a_tdata({{6{Dout01[67]}}, Dout01[67:34], {6{Dout01[33]}}, Dout01[33:0]}),         
  .s_axis_b_tvalid(1'd1),        
  .s_axis_b_tdata({32'h0,32'h7FFFFFFF}),        
  .m_axis_dout_tvalid(), 
  .m_axis_dout_tdata(dout_cmpy01)    
);

dft16_cmpy cmpy02 (
  .aclk(clk),                             
  .s_axis_a_tvalid(1'd1),        
  .s_axis_a_tdata({{6{Dout02[67]}}, Dout02[67:34], {6{Dout02[33]}}, Dout02[33:0]}),         
  .s_axis_b_tvalid(1'd1),        
  .s_axis_b_tdata({32'h0,32'h7FFFFFFF}),        
  .m_axis_dout_tvalid(), 
  .m_axis_dout_tdata(dout_cmpy02)    
);

dft16_cmpy cmpy03 (
  .aclk(clk),                             
  .s_axis_a_tvalid(1'd1),        
  .s_axis_a_tdata({{6{Dout03[67]}}, Dout03[67:34], {6{Dout03[33]}}, Dout03[33:0]}),         
  .s_axis_b_tvalid(1'd1),        
  .s_axis_b_tdata({32'h0,32'h7FFFFFFF}),        
  .m_axis_dout_tvalid(), 
  .m_axis_dout_tdata(dout_cmpy03)    
);

dft16_cmpy cmpy10 (
  .aclk(clk),                             
  .s_axis_a_tvalid(1'd1),        
  .s_axis_a_tdata({{6{Dout10[67]}}, Dout10[67:34], {6{Dout10[33]}}, Dout10[33:0]}),         
  .s_axis_b_tvalid(1'd1),        
  .s_axis_b_tdata({32'h0,32'h7FFFFFFF}),        
  .m_axis_dout_tvalid(), 
  .m_axis_dout_tdata(dout_cmpy10)    
);

dft16_cmpy cmpy11 (
  .aclk(clk),                             
  .s_axis_a_tvalid(1'd1),        
  .s_axis_a_tdata({{6{Dout11[67]}}, Dout11[67:34], {6{Dout11[33]}}, Dout11[33:0]}),        
  .s_axis_b_tvalid(1'd1),        
  .s_axis_b_tdata({32'hCF043AB3,32'h7641AF3C}),        
  .m_axis_dout_tvalid(), 
  .m_axis_dout_tdata(dout_cmpy11)    
);

dft16_cmpy cmpy12 (
  .aclk(clk),                             
  .s_axis_a_tvalid(1'd1),        
  .s_axis_a_tdata({{6{Dout12[67]}}, Dout12[67:34], {6{Dout12[33]}}, Dout12[33:0]}),       
  .s_axis_b_tvalid(1'd1),        
  .s_axis_b_tdata({32'hA57D8667,32'h5A827999}),        
  .m_axis_dout_tvalid(), 
  .m_axis_dout_tdata(dout_cmpy12)    
);

dft16_cmpy cmpy13 (
  .aclk(clk),                             
  .s_axis_a_tvalid(1'd1),        
  .s_axis_a_tdata({{6{Dout13[67]}}, Dout13[67:34], {6{Dout13[33]}}, Dout13[33:0]}),         
  .s_axis_b_tvalid(1'd1),        
  .s_axis_b_tdata({32'h89BE50C4,32'h30FBC54D}),        
  .m_axis_dout_tvalid(), 
  .m_axis_dout_tdata(dout_cmpy13)    
);

dft16_cmpy cmpy20 (
  .aclk(clk),                             
  .s_axis_a_tvalid(1'd1),        
  .s_axis_a_tdata({{6{Dout20[67]}}, Dout20[67:34], {6{Dout20[33]}}, Dout20[33:0]}),         
  .s_axis_b_tvalid(1'd1),        
  .s_axis_b_tdata({32'h0,32'h7FFFFFFF}),        
  .m_axis_dout_tvalid(), 
  .m_axis_dout_tdata(dout_cmpy20)    
);

dft16_cmpy cmpy21 (
  .aclk(clk),                             
  .s_axis_a_tvalid(1'd1),        
  .s_axis_a_tdata({{6{Dout21[67]}}, Dout21[67:34], {6{Dout21[33]}}, Dout21[33:0]}),        
  .s_axis_b_tvalid(1'd1),        
  .s_axis_b_tdata({32'hA57D8667,32'h5A827999}),        
  .m_axis_dout_tvalid(), 
  .m_axis_dout_tdata(dout_cmpy21)    
);

dft16_cmpy cmpy22 (
  .aclk(clk),                             
  .s_axis_a_tvalid(1'd1),        
  .s_axis_a_tdata({{6{Dout22[67]}}, Dout22[67:34], {6{Dout22[33]}}, Dout22[33:0]}),      
  .s_axis_b_tvalid(1'd1),        
  .s_axis_b_tdata({32'h80000001,32'h0}),        
  .m_axis_dout_tvalid(), 
  .m_axis_dout_tdata(dout_cmpy22)    
);

dft16_cmpy cmpy23 (
  .aclk(clk),                             
  .s_axis_a_tvalid(1'd1),        
  .s_axis_a_tdata({{6{Dout23[67]}}, Dout23[67:34], {6{Dout23[33]}}, Dout23[33:0]}),         
  .s_axis_b_tvalid(1'd1),        
  .s_axis_b_tdata({32'hA57D8667,32'hA57D8667}),        
  .m_axis_dout_tvalid(), 
  .m_axis_dout_tdata(dout_cmpy23)    
);

dft16_cmpy cmpy30 (
  .aclk(clk),                             
  .s_axis_a_tvalid(1'd1),        
  .s_axis_a_tdata({{6{Dout30[67]}}, Dout30[67:34], {6{Dout30[33]}}, Dout30[33:0]}),     
  .s_axis_b_tvalid(1'd1),        
  .s_axis_b_tdata({32'h0,32'h7FFFFFFF}),        
  .m_axis_dout_tvalid(), 
  .m_axis_dout_tdata(dout_cmpy30)    
);

dft16_cmpy cmpy31 (
  .aclk(clk),                             
  .s_axis_a_tvalid(1'd1),        
  .s_axis_a_tdata({{6{Dout31[67]}}, Dout31[67:34], {6{Dout31[33]}}, Dout31[33:0]}),         
  .s_axis_b_tvalid(1'd1),        
  .s_axis_b_tdata({32'h89BE50C4,32'h30FBC54D}),        
  .m_axis_dout_tvalid(), 
  .m_axis_dout_tdata(dout_cmpy31)    
);

dft16_cmpy cmpy32 (
  .aclk(clk),                             
  .s_axis_a_tvalid(1'd1),        
  .s_axis_a_tdata({{6{Dout32[67]}}, Dout32[67:34], {6{Dout32[33]}}, Dout32[33:0]}),          
  .s_axis_b_tvalid(1'd1),        
  .s_axis_b_tdata({32'hA57D8667,32'hA57D8667}),        
  .m_axis_dout_tvalid(), 
  .m_axis_dout_tdata(dout_cmpy32)    
);

dft16_cmpy cmpy33 (
  .aclk(clk),                             
  .s_axis_a_tvalid(1'd1),        
  .s_axis_a_tdata({{6{Dout33[67]}}, Dout33[67:34], {6{Dout33[33]}}, Dout33[33:0]}),          
  .s_axis_b_tvalid(1'd1),        
  .s_axis_b_tdata({32'h30FBC54D,32'h89BE50C4}),        
  .m_axis_dout_tvalid(), 
  .m_axis_dout_tdata(dout_cmpy33)    
);

wire    [103:0]  Dout00_reg;
wire    [103:0]  Dout01_reg;
wire    [103:0]  Dout02_reg;
wire    [103:0]  Dout03_reg;
wire    [103:0]  Dout10_reg;
wire    [103:0]  Dout11_reg;
wire    [103:0]  Dout12_reg;
wire    [103:0]  Dout13_reg;
wire    [103:0]  Dout20_reg;
wire    [103:0]  Dout21_reg;
wire    [103:0]  Dout22_reg;
wire    [103:0]  Dout23_reg;
wire    [103:0]  Dout30_reg;
wire    [103:0]  Dout31_reg;
wire    [103:0]  Dout32_reg;
wire    [103:0]  Dout33_reg;


DFT_4P #(
    .InputWidth (50)
) DFT_4P_10
(
    .clk    (clk),
    .Din0   ({dout_cmpy00[105:56],dout_cmpy00[49:0]}), 
    .Din1   ({dout_cmpy10[105:56],dout_cmpy10[49:0]}), 
    .Din2   ({dout_cmpy20[105:56],dout_cmpy20[49:0]}), 
    .Din3   ({dout_cmpy30[105:56],dout_cmpy30[49:0]}), 
    .Dout0  (Dout00_reg),
    .Dout1  (Dout01_reg),
    .Dout2  (Dout02_reg),
    .Dout3  (Dout03_reg)
);

DFT_4P #(
    .InputWidth (50)
) DFT_4P_11
(
    .clk    (clk),
    .Din0   ({dout_cmpy01[105:56],dout_cmpy01[49:0]}),  
    .Din1   ({dout_cmpy11[105:56],dout_cmpy11[49:0]}),  
    .Din2   ({dout_cmpy21[105:56],dout_cmpy21[49:0]}),  
    .Din3   ({dout_cmpy31[105:56],dout_cmpy31[49:0]}), 
    .Dout0  (Dout10_reg),
    .Dout1  (Dout11_reg),
    .Dout2  (Dout12_reg),
    .Dout3  (Dout13_reg)
);

DFT_4P #(
    .InputWidth (50)
) DFT_4P_12
(
    .clk    (clk),
    .Din0   ({dout_cmpy02[105:56],dout_cmpy02[49:0]}), 
    .Din1   ({dout_cmpy12[105:56],dout_cmpy12[49:0]}), 
    .Din2   ({dout_cmpy22[105:56],dout_cmpy22[49:0]}), 
    .Din3   ({dout_cmpy32[105:56],dout_cmpy32[49:0]}), 
    .Dout0  (Dout20_reg),
    .Dout1  (Dout21_reg),
    .Dout2  (Dout22_reg),
    .Dout3  (Dout23_reg)
);

DFT_4P #(
    .InputWidth (50)
) DFT_4P_13
(
    .clk    (clk),
    .Din0   ({dout_cmpy03[105:56],dout_cmpy03[49:0]}), 
    .Din1   ({dout_cmpy13[105:56],dout_cmpy13[49:0]}), 
    .Din2   ({dout_cmpy23[105:56],dout_cmpy23[49:0]}), 
    .Din3   ({dout_cmpy33[105:56],dout_cmpy33[49:0]}), 
    .Dout0  (Dout30_reg),
    .Dout1  (Dout31_reg),
    .Dout2  (Dout32_reg),
    .Dout3  (Dout33_reg)
);
assign Dout_00[50:0] = Dout00_reg[50:0];
assign Dout_04[50:0] = Dout01_reg[50:0];
assign Dout_08[50:0] = Dout02_reg[50:0];
assign Dout_12[50:0] = Dout03_reg[50:0];
assign Dout_01[50:0] = Dout10_reg[50:0];
assign Dout_05[50:0] = Dout11_reg[50:0];
assign Dout_09[50:0] = Dout12_reg[50:0];
assign Dout_13[50:0] = Dout13_reg[50:0];
assign Dout_02[50:0] = Dout20_reg[50:0];
assign Dout_06[50:0] = Dout21_reg[50:0];
assign Dout_10[50:0] = Dout22_reg[50:0];
assign Dout_14[50:0] = Dout23_reg[50:0];
assign Dout_03[50:0] = Dout30_reg[50:0];
assign Dout_07[50:0] = Dout31_reg[50:0];
assign Dout_11[50:0] = Dout32_reg[50:0];
assign Dout_15[50:0] = Dout33_reg[50:0];
assign Dout_00[101:51] = Dout00_reg[102:52];
assign Dout_04[101:51] = Dout01_reg[102:52];
assign Dout_08[101:51] = Dout02_reg[102:52];
assign Dout_12[101:51] = Dout03_reg[102:52];
assign Dout_01[101:51] = Dout10_reg[102:52];
assign Dout_05[101:51] = Dout11_reg[102:52];
assign Dout_09[101:51] = Dout12_reg[102:52];
assign Dout_13[101:51] = Dout13_reg[102:52];
assign Dout_02[101:51] = Dout20_reg[102:52];
assign Dout_06[101:51] = Dout21_reg[102:52];
assign Dout_10[101:51] = Dout22_reg[102:52];
assign Dout_14[101:51] = Dout23_reg[102:52];
assign Dout_03[101:51] = Dout30_reg[102:52];
assign Dout_07[101:51] = Dout31_reg[102:52];
assign Dout_11[101:51] = Dout32_reg[102:52];
assign Dout_15[101:51] = Dout33_reg[102:52];





endmodule
