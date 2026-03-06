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
    output  reg     [11:0]  dout_31
);

wire [383:0]    Dout;
input_fifo input_fifo_i (
  .rst(rst),       
  .wr_clk(clk_in), 
  .rd_clk(clk_out), 
  .din({data_in[127 -: 12], data_in[111 -: 12], data_in[95 -: 12], data_in[79 -: 12], data_in[63 -: 12], data_in[47 -: 12], data_in[31 -: 12], data_in[15 -: 12]}),       
  .wr_en(1'd1),   
  .rd_en(1'd1),   
  .dout(Dout),     
  .full(),     
  .empty()    
);

always @(posedge clk_out) begin
    dout_00 <=  Dout[95 -: 12];
    dout_01 <=  Dout[83 -: 12];
    dout_02 <=  Dout[71 -: 12];
    dout_03 <=  Dout[59 -: 12];
    dout_04 <=  Dout[47 -: 12];
    dout_05 <=  Dout[35 -: 12];
    dout_06 <=  Dout[23 -: 12];
    dout_07 <=  Dout[11 -: 12];
    dout_08 <=  Dout[191 -: 12];
    dout_09 <=  Dout[179 -: 12];
    dout_10 <=  Dout[167 -: 12];
    dout_11 <=  Dout[155 -: 12];
    dout_12 <=  Dout[143 -: 12];
    dout_13 <=  Dout[131 -: 12];
    dout_14 <=  Dout[119 -: 12];
    dout_15 <=  Dout[107 -: 12];
    dout_16 <=  Dout[287 -: 12];
    dout_17 <=  Dout[275 -: 12];
    dout_18 <=  Dout[263 -: 12];
    dout_19 <=  Dout[251 -: 12];
    dout_20 <=  Dout[239 -: 12];
    dout_21 <=  Dout[227 -: 12];
    dout_22 <=  Dout[215 -: 12];
    dout_23 <=  Dout[203 -: 12];
    dout_24 <=  Dout[383 -: 12];
    dout_25 <=  Dout[371 -: 12];
    dout_26 <=  Dout[359 -: 12];
    dout_27 <=  Dout[347 -: 12];
    dout_28 <=  Dout[335 -: 12];
    dout_29 <=  Dout[323 -: 12];
    dout_30 <=  Dout[311 -: 12];
    dout_31 <=  Dout[299 -: 12];
end

endmodule
