`timescale 1ns / 1ps

module seu_mac4to1_mux(
    input   wire            Ethernet_clk,
    input   wire            Ethernet_rst,
    input   wire            pl_rst,

    input   wire    [63:0]  UDP_IP_dout0,
    input   wire            UDP_IP_end0,
    input   wire            UDP_IP_start0,
    output  reg             mac_ack0,

    input   wire    [63:0]  UDP_IP_dout1,
    input   wire            UDP_IP_end1,
    input   wire            UDP_IP_start1,
    output  reg             mac_ack1,

    input   wire    [63:0]  UDP_IP_dout2,
    input   wire            UDP_IP_end2,
    input   wire            UDP_IP_start2,
    output  reg             mac_ack2,

    input   wire    [63:0]  UDP_IP_dout3,
    input   wire            UDP_IP_end3,
    input   wire            UDP_IP_start3,
    output  reg             mac_ack3,

    output  reg     [7:0]   xgmii_txc,
    output  reg     [63:0]  xgmii_txd
    );

function [31:0] CRC32_D64;

  input [63:0] Data;
  input [31:0] crc;
  reg [63:0] d;
  reg [31:0] c;
  reg [31:0] newcrc;
  begin
    d = Data;
    c = crc;

    newcrc[0] = d[63] ^ d[61] ^ d[60] ^ d[58] ^ d[55] ^ d[54] ^ d[53] ^ d[50] ^ d[48] ^ d[47] ^ d[45] ^ d[44] ^ d[37] ^ d[34] ^ d[32] ^ d[31] ^ d[30] ^ d[29] ^ d[28] ^ d[26] ^ d[25] ^ d[24] ^ d[16] ^ d[12] ^ d[10] ^ d[9] ^ d[6] ^ d[0] ^ c[0] ^ c[2] ^ c[5] ^ c[12] ^ c[13] ^ c[15] ^ c[16] ^ c[18] ^ c[21] ^ c[22] ^ c[23] ^ c[26] ^ c[28] ^ c[29] ^ c[31];
    newcrc[1] = d[63] ^ d[62] ^ d[60] ^ d[59] ^ d[58] ^ d[56] ^ d[53] ^ d[51] ^ d[50] ^ d[49] ^ d[47] ^ d[46] ^ d[44] ^ d[38] ^ d[37] ^ d[35] ^ d[34] ^ d[33] ^ d[28] ^ d[27] ^ d[24] ^ d[17] ^ d[16] ^ d[13] ^ d[12] ^ d[11] ^ d[9] ^ d[7] ^ d[6] ^ d[1] ^ d[0] ^ c[1] ^ c[2] ^ c[3] ^ c[5] ^ c[6] ^ c[12] ^ c[14] ^ c[15] ^ c[17] ^ c[18] ^ c[19] ^ c[21] ^ c[24] ^ c[26] ^ c[27] ^ c[28] ^ c[30] ^ c[31];
    newcrc[2] = d[59] ^ d[58] ^ d[57] ^ d[55] ^ d[53] ^ d[52] ^ d[51] ^ d[44] ^ d[39] ^ d[38] ^ d[37] ^ d[36] ^ d[35] ^ d[32] ^ d[31] ^ d[30] ^ d[26] ^ d[24] ^ d[18] ^ d[17] ^ d[16] ^ d[14] ^ d[13] ^ d[9] ^ d[8] ^ d[7] ^ d[6] ^ d[2] ^ d[1] ^ d[0] ^ c[0] ^ c[3] ^ c[4] ^ c[5] ^ c[6] ^ c[7] ^ c[12] ^ c[19] ^ c[20] ^ c[21] ^ c[23] ^ c[25] ^ c[26] ^ c[27];
    newcrc[3] = d[60] ^ d[59] ^ d[58] ^ d[56] ^ d[54] ^ d[53] ^ d[52] ^ d[45] ^ d[40] ^ d[39] ^ d[38] ^ d[37] ^ d[36] ^ d[33] ^ d[32] ^ d[31] ^ d[27] ^ d[25] ^ d[19] ^ d[18] ^ d[17] ^ d[15] ^ d[14] ^ d[10] ^ d[9] ^ d[8] ^ d[7] ^ d[3] ^ d[2] ^ d[1] ^ c[0] ^ c[1] ^ c[4] ^ c[5] ^ c[6] ^ c[7] ^ c[8] ^ c[13] ^ c[20] ^ c[21] ^ c[22] ^ c[24] ^ c[26] ^ c[27] ^ c[28];
    newcrc[4] = d[63] ^ d[59] ^ d[58] ^ d[57] ^ d[50] ^ d[48] ^ d[47] ^ d[46] ^ d[45] ^ d[44] ^ d[41] ^ d[40] ^ d[39] ^ d[38] ^ d[33] ^ d[31] ^ d[30] ^ d[29] ^ d[25] ^ d[24] ^ d[20] ^ d[19] ^ d[18] ^ d[15] ^ d[12] ^ d[11] ^ d[8] ^ d[6] ^ d[4] ^ d[3] ^ d[2] ^ d[0] ^ c[1] ^ c[6] ^ c[7] ^ c[8] ^ c[9] ^ c[12] ^ c[13] ^ c[14] ^ c[15] ^ c[16] ^ c[18] ^ c[25] ^ c[26] ^ c[27] ^ c[31];
    newcrc[5] = d[63] ^ d[61] ^ d[59] ^ d[55] ^ d[54] ^ d[53] ^ d[51] ^ d[50] ^ d[49] ^ d[46] ^ d[44] ^ d[42] ^ d[41] ^ d[40] ^ d[39] ^ d[37] ^ d[29] ^ d[28] ^ d[24] ^ d[21] ^ d[20] ^ d[19] ^ d[13] ^ d[10] ^ d[7] ^ d[6] ^ d[5] ^ d[4] ^ d[3] ^ d[1] ^ d[0] ^ c[5] ^ c[7] ^ c[8] ^ c[9] ^ c[10] ^ c[12] ^ c[14] ^ c[17] ^ c[18] ^ c[19] ^ c[21] ^ c[22] ^ c[23] ^ c[27] ^ c[29] ^ c[31];
    newcrc[6] = d[62] ^ d[60] ^ d[56] ^ d[55] ^ d[54] ^ d[52] ^ d[51] ^ d[50] ^ d[47] ^ d[45] ^ d[43] ^ d[42] ^ d[41] ^ d[40] ^ d[38] ^ d[30] ^ d[29] ^ d[25] ^ d[22] ^ d[21] ^ d[20] ^ d[14] ^ d[11] ^ d[8] ^ d[7] ^ d[6] ^ d[5] ^ d[4] ^ d[2] ^ d[1] ^ c[6] ^ c[8] ^ c[9] ^ c[10] ^ c[11] ^ c[13] ^ c[15] ^ c[18] ^ c[19] ^ c[20] ^ c[22] ^ c[23] ^ c[24] ^ c[28] ^ c[30];
    newcrc[7] = d[60] ^ d[58] ^ d[57] ^ d[56] ^ d[54] ^ d[52] ^ d[51] ^ d[50] ^ d[47] ^ d[46] ^ d[45] ^ d[43] ^ d[42] ^ d[41] ^ d[39] ^ d[37] ^ d[34] ^ d[32] ^ d[29] ^ d[28] ^ d[25] ^ d[24] ^ d[23] ^ d[22] ^ d[21] ^ d[16] ^ d[15] ^ d[10] ^ d[8] ^ d[7] ^ d[5] ^ d[3] ^ d[2] ^ d[0] ^ c[0] ^ c[2] ^ c[5] ^ c[7] ^ c[9] ^ c[10] ^ c[11] ^ c[13] ^ c[14] ^ c[15] ^ c[18] ^ c[19] ^ c[20] ^ c[22] ^ c[24] ^ c[25] ^ c[26] ^ c[28];
    newcrc[8] = d[63] ^ d[60] ^ d[59] ^ d[57] ^ d[54] ^ d[52] ^ d[51] ^ d[50] ^ d[46] ^ d[45] ^ d[43] ^ d[42] ^ d[40] ^ d[38] ^ d[37] ^ d[35] ^ d[34] ^ d[33] ^ d[32] ^ d[31] ^ d[28] ^ d[23] ^ d[22] ^ d[17] ^ d[12] ^ d[11] ^ d[10] ^ d[8] ^ d[4] ^ d[3] ^ d[1] ^ d[0] ^ c[0] ^ c[1] ^ c[2] ^ c[3] ^ c[5] ^ c[6] ^ c[8] ^ c[10] ^ c[11] ^ c[13] ^ c[14] ^ c[18] ^ c[19] ^ c[20] ^ c[22] ^ c[25] ^ c[27] ^ c[28] ^ c[31];
    newcrc[9] = d[61] ^ d[60] ^ d[58] ^ d[55] ^ d[53] ^ d[52] ^ d[51] ^ d[47] ^ d[46] ^ d[44] ^ d[43] ^ d[41] ^ d[39] ^ d[38] ^ d[36] ^ d[35] ^ d[34] ^ d[33] ^ d[32] ^ d[29] ^ d[24] ^ d[23] ^ d[18] ^ d[13] ^ d[12] ^ d[11] ^ d[9] ^ d[5] ^ d[4] ^ d[2] ^ d[1] ^ c[0] ^ c[1] ^ c[2] ^ c[3] ^ c[4] ^ c[6] ^ c[7] ^ c[9] ^ c[11] ^ c[12] ^ c[14] ^ c[15] ^ c[19] ^ c[20] ^ c[21] ^ c[23] ^ c[26] ^ c[28] ^ c[29];
    newcrc[10] = d[63] ^ d[62] ^ d[60] ^ d[59] ^ d[58] ^ d[56] ^ d[55] ^ d[52] ^ d[50] ^ d[42] ^ d[40] ^ d[39] ^ d[36] ^ d[35] ^ d[33] ^ d[32] ^ d[31] ^ d[29] ^ d[28] ^ d[26] ^ d[19] ^ d[16] ^ d[14] ^ d[13] ^ d[9] ^ d[5] ^ d[3] ^ d[2] ^ d[0] ^ c[0] ^ c[1] ^ c[3] ^ c[4] ^ c[7] ^ c[8] ^ c[10] ^ c[18] ^ c[20] ^ c[23] ^ c[24] ^ c[26] ^ c[27] ^ c[28] ^ c[30] ^ c[31];
    newcrc[11] = d[59] ^ d[58] ^ d[57] ^ d[56] ^ d[55] ^ d[54] ^ d[51] ^ d[50] ^ d[48] ^ d[47] ^ d[45] ^ d[44] ^ d[43] ^ d[41] ^ d[40] ^ d[36] ^ d[33] ^ d[31] ^ d[28] ^ d[27] ^ d[26] ^ d[25] ^ d[24] ^ d[20] ^ d[17] ^ d[16] ^ d[15] ^ d[14] ^ d[12] ^ d[9] ^ d[4] ^ d[3] ^ d[1] ^ d[0] ^ c[1] ^ c[4] ^ c[8] ^ c[9] ^ c[11] ^ c[12] ^ c[13] ^ c[15] ^ c[16] ^ c[18] ^ c[19] ^ c[22] ^ c[23] ^ c[24] ^ c[25] ^ c[26] ^ c[27];
    newcrc[12] = d[63] ^ d[61] ^ d[59] ^ d[57] ^ d[56] ^ d[54] ^ d[53] ^ d[52] ^ d[51] ^ d[50] ^ d[49] ^ d[47] ^ d[46] ^ d[42] ^ d[41] ^ d[31] ^ d[30] ^ d[27] ^ d[24] ^ d[21] ^ d[18] ^ d[17] ^ d[15] ^ d[13] ^ d[12] ^ d[9] ^ d[6] ^ d[5] ^ d[4] ^ d[2] ^ d[1] ^ d[0] ^ c[9] ^ c[10] ^ c[14] ^ c[15] ^ c[17] ^ c[18] ^ c[19] ^ c[20] ^ c[21] ^ c[22] ^ c[24] ^ c[25] ^ c[27] ^ c[29] ^ c[31];
    newcrc[13] = d[62] ^ d[60] ^ d[58] ^ d[57] ^ d[55] ^ d[54] ^ d[53] ^ d[52] ^ d[51] ^ d[50] ^ d[48] ^ d[47] ^ d[43] ^ d[42] ^ d[32] ^ d[31] ^ d[28] ^ d[25] ^ d[22] ^ d[19] ^ d[18] ^ d[16] ^ d[14] ^ d[13] ^ d[10] ^ d[7] ^ d[6] ^ d[5] ^ d[3] ^ d[2] ^ d[1] ^ c[0] ^ c[10] ^ c[11] ^ c[15] ^ c[16] ^ c[18] ^ c[19] ^ c[20] ^ c[21] ^ c[22] ^ c[23] ^ c[25] ^ c[26] ^ c[28] ^ c[30];
    newcrc[14] = d[63] ^ d[61] ^ d[59] ^ d[58] ^ d[56] ^ d[55] ^ d[54] ^ d[53] ^ d[52] ^ d[51] ^ d[49] ^ d[48] ^ d[44] ^ d[43] ^ d[33] ^ d[32] ^ d[29] ^ d[26] ^ d[23] ^ d[20] ^ d[19] ^ d[17] ^ d[15] ^ d[14] ^ d[11] ^ d[8] ^ d[7] ^ d[6] ^ d[4] ^ d[3] ^ d[2] ^ c[0] ^ c[1] ^ c[11] ^ c[12] ^ c[16] ^ c[17] ^ c[19] ^ c[20] ^ c[21] ^ c[22] ^ c[23] ^ c[24] ^ c[26] ^ c[27] ^ c[29] ^ c[31];
    newcrc[15] = d[62] ^ d[60] ^ d[59] ^ d[57] ^ d[56] ^ d[55] ^ d[54] ^ d[53] ^ d[52] ^ d[50] ^ d[49] ^ d[45] ^ d[44] ^ d[34] ^ d[33] ^ d[30] ^ d[27] ^ d[24] ^ d[21] ^ d[20] ^ d[18] ^ d[16] ^ d[15] ^ d[12] ^ d[9] ^ d[8] ^ d[7] ^ d[5] ^ d[4] ^ d[3] ^ c[1] ^ c[2] ^ c[12] ^ c[13] ^ c[17] ^ c[18] ^ c[20] ^ c[21] ^ c[22] ^ c[23] ^ c[24] ^ c[25] ^ c[27] ^ c[28] ^ c[30];
    newcrc[16] = d[57] ^ d[56] ^ d[51] ^ d[48] ^ d[47] ^ d[46] ^ d[44] ^ d[37] ^ d[35] ^ d[32] ^ d[30] ^ d[29] ^ d[26] ^ d[24] ^ d[22] ^ d[21] ^ d[19] ^ d[17] ^ d[13] ^ d[12] ^ d[8] ^ d[5] ^ d[4] ^ d[0] ^ c[0] ^ c[3] ^ c[5] ^ c[12] ^ c[14] ^ c[15] ^ c[16] ^ c[19] ^ c[24] ^ c[25];
    newcrc[17] = d[58] ^ d[57] ^ d[52] ^ d[49] ^ d[48] ^ d[47] ^ d[45] ^ d[38] ^ d[36] ^ d[33] ^ d[31] ^ d[30] ^ d[27] ^ d[25] ^ d[23] ^ d[22] ^ d[20] ^ d[18] ^ d[14] ^ d[13] ^ d[9] ^ d[6] ^ d[5] ^ d[1] ^ c[1] ^ c[4] ^ c[6] ^ c[13] ^ c[15] ^ c[16] ^ c[17] ^ c[20] ^ c[25] ^ c[26];
    newcrc[18] = d[59] ^ d[58] ^ d[53] ^ d[50] ^ d[49] ^ d[48] ^ d[46] ^ d[39] ^ d[37] ^ d[34] ^ d[32] ^ d[31] ^ d[28] ^ d[26] ^ d[24] ^ d[23] ^ d[21] ^ d[19] ^ d[15] ^ d[14] ^ d[10] ^ d[7] ^ d[6] ^ d[2] ^ c[0] ^ c[2] ^ c[5] ^ c[7] ^ c[14] ^ c[16] ^ c[17] ^ c[18] ^ c[21] ^ c[26] ^ c[27];
    newcrc[19] = d[60] ^ d[59] ^ d[54] ^ d[51] ^ d[50] ^ d[49] ^ d[47] ^ d[40] ^ d[38] ^ d[35] ^ d[33] ^ d[32] ^ d[29] ^ d[27] ^ d[25] ^ d[24] ^ d[22] ^ d[20] ^ d[16] ^ d[15] ^ d[11] ^ d[8] ^ d[7] ^ d[3] ^ c[0] ^ c[1] ^ c[3] ^ c[6] ^ c[8] ^ c[15] ^ c[17] ^ c[18] ^ c[19] ^ c[22] ^ c[27] ^ c[28];
    newcrc[20] = d[61] ^ d[60] ^ d[55] ^ d[52] ^ d[51] ^ d[50] ^ d[48] ^ d[41] ^ d[39] ^ d[36] ^ d[34] ^ d[33] ^ d[30] ^ d[28] ^ d[26] ^ d[25] ^ d[23] ^ d[21] ^ d[17] ^ d[16] ^ d[12] ^ d[9] ^ d[8] ^ d[4] ^ c[1] ^ c[2] ^ c[4] ^ c[7] ^ c[9] ^ c[16] ^ c[18] ^ c[19] ^ c[20] ^ c[23] ^ c[28] ^ c[29];
    newcrc[21] = d[62] ^ d[61] ^ d[56] ^ d[53] ^ d[52] ^ d[51] ^ d[49] ^ d[42] ^ d[40] ^ d[37] ^ d[35] ^ d[34] ^ d[31] ^ d[29] ^ d[27] ^ d[26] ^ d[24] ^ d[22] ^ d[18] ^ d[17] ^ d[13] ^ d[10] ^ d[9] ^ d[5] ^ c[2] ^ c[3] ^ c[5] ^ c[8] ^ c[10] ^ c[17] ^ c[19] ^ c[20] ^ c[21] ^ c[24] ^ c[29] ^ c[30];
    newcrc[22] = d[62] ^ d[61] ^ d[60] ^ d[58] ^ d[57] ^ d[55] ^ d[52] ^ d[48] ^ d[47] ^ d[45] ^ d[44] ^ d[43] ^ d[41] ^ d[38] ^ d[37] ^ d[36] ^ d[35] ^ d[34] ^ d[31] ^ d[29] ^ d[27] ^ d[26] ^ d[24] ^ d[23] ^ d[19] ^ d[18] ^ d[16] ^ d[14] ^ d[12] ^ d[11] ^ d[9] ^ d[0] ^ c[2] ^ c[3] ^ c[4] ^ c[5] ^ c[6] ^ c[9] ^ c[11] ^ c[12] ^ c[13] ^ c[15] ^ c[16] ^ c[20] ^ c[23] ^ c[25] ^ c[26] ^ c[28] ^ c[29] ^ c[30];
    newcrc[23] = d[62] ^ d[60] ^ d[59] ^ d[56] ^ d[55] ^ d[54] ^ d[50] ^ d[49] ^ d[47] ^ d[46] ^ d[42] ^ d[39] ^ d[38] ^ d[36] ^ d[35] ^ d[34] ^ d[31] ^ d[29] ^ d[27] ^ d[26] ^ d[20] ^ d[19] ^ d[17] ^ d[16] ^ d[15] ^ d[13] ^ d[9] ^ d[6] ^ d[1] ^ d[0] ^ c[2] ^ c[3] ^ c[4] ^ c[6] ^ c[7] ^ c[10] ^ c[14] ^ c[15] ^ c[17] ^ c[18] ^ c[22] ^ c[23] ^ c[24] ^ c[27] ^ c[28] ^ c[30];
    newcrc[24] = d[63] ^ d[61] ^ d[60] ^ d[57] ^ d[56] ^ d[55] ^ d[51] ^ d[50] ^ d[48] ^ d[47] ^ d[43] ^ d[40] ^ d[39] ^ d[37] ^ d[36] ^ d[35] ^ d[32] ^ d[30] ^ d[28] ^ d[27] ^ d[21] ^ d[20] ^ d[18] ^ d[17] ^ d[16] ^ d[14] ^ d[10] ^ d[7] ^ d[2] ^ d[1] ^ c[0] ^ c[3] ^ c[4] ^ c[5] ^ c[7] ^ c[8] ^ c[11] ^ c[15] ^ c[16] ^ c[18] ^ c[19] ^ c[23] ^ c[24] ^ c[25] ^ c[28] ^ c[29] ^ c[31];
    newcrc[25] = d[62] ^ d[61] ^ d[58] ^ d[57] ^ d[56] ^ d[52] ^ d[51] ^ d[49] ^ d[48] ^ d[44] ^ d[41] ^ d[40] ^ d[38] ^ d[37] ^ d[36] ^ d[33] ^ d[31] ^ d[29] ^ d[28] ^ d[22] ^ d[21] ^ d[19] ^ d[18] ^ d[17] ^ d[15] ^ d[11] ^ d[8] ^ d[3] ^ d[2] ^ c[1] ^ c[4] ^ c[5] ^ c[6] ^ c[8] ^ c[9] ^ c[12] ^ c[16] ^ c[17] ^ c[19] ^ c[20] ^ c[24] ^ c[25] ^ c[26] ^ c[29] ^ c[30];
    newcrc[26] = d[62] ^ d[61] ^ d[60] ^ d[59] ^ d[57] ^ d[55] ^ d[54] ^ d[52] ^ d[49] ^ d[48] ^ d[47] ^ d[44] ^ d[42] ^ d[41] ^ d[39] ^ d[38] ^ d[31] ^ d[28] ^ d[26] ^ d[25] ^ d[24] ^ d[23] ^ d[22] ^ d[20] ^ d[19] ^ d[18] ^ d[10] ^ d[6] ^ d[4] ^ d[3] ^ d[0] ^ c[6] ^ c[7] ^ c[9] ^ c[10] ^ c[12] ^ c[15] ^ c[16] ^ c[17] ^ c[20] ^ c[22] ^ c[23] ^ c[25] ^ c[27] ^ c[28] ^ c[29] ^ c[30];
    newcrc[27] = d[63] ^ d[62] ^ d[61] ^ d[60] ^ d[58] ^ d[56] ^ d[55] ^ d[53] ^ d[50] ^ d[49] ^ d[48] ^ d[45] ^ d[43] ^ d[42] ^ d[40] ^ d[39] ^ d[32] ^ d[29] ^ d[27] ^ d[26] ^ d[25] ^ d[24] ^ d[23] ^ d[21] ^ d[20] ^ d[19] ^ d[11] ^ d[7] ^ d[5] ^ d[4] ^ d[1] ^ c[0] ^ c[7] ^ c[8] ^ c[10] ^ c[11] ^ c[13] ^ c[16] ^ c[17] ^ c[18] ^ c[21] ^ c[23] ^ c[24] ^ c[26] ^ c[28] ^ c[29] ^ c[30] ^ c[31];
    newcrc[28] = d[63] ^ d[62] ^ d[61] ^ d[59] ^ d[57] ^ d[56] ^ d[54] ^ d[51] ^ d[50] ^ d[49] ^ d[46] ^ d[44] ^ d[43] ^ d[41] ^ d[40] ^ d[33] ^ d[30] ^ d[28] ^ d[27] ^ d[26] ^ d[25] ^ d[24] ^ d[22] ^ d[21] ^ d[20] ^ d[12] ^ d[8] ^ d[6] ^ d[5] ^ d[2] ^ c[1] ^ c[8] ^ c[9] ^ c[11] ^ c[12] ^ c[14] ^ c[17] ^ c[18] ^ c[19] ^ c[22] ^ c[24] ^ c[25] ^ c[27] ^ c[29] ^ c[30] ^ c[31];
    newcrc[29] = d[63] ^ d[62] ^ d[60] ^ d[58] ^ d[57] ^ d[55] ^ d[52] ^ d[51] ^ d[50] ^ d[47] ^ d[45] ^ d[44] ^ d[42] ^ d[41] ^ d[34] ^ d[31] ^ d[29] ^ d[28] ^ d[27] ^ d[26] ^ d[25] ^ d[23] ^ d[22] ^ d[21] ^ d[13] ^ d[9] ^ d[7] ^ d[6] ^ d[3] ^ c[2] ^ c[9] ^ c[10] ^ c[12] ^ c[13] ^ c[15] ^ c[18] ^ c[19] ^ c[20] ^ c[23] ^ c[25] ^ c[26] ^ c[28] ^ c[30] ^ c[31];
    newcrc[30] = d[63] ^ d[61] ^ d[59] ^ d[58] ^ d[56] ^ d[53] ^ d[52] ^ d[51] ^ d[48] ^ d[46] ^ d[45] ^ d[43] ^ d[42] ^ d[35] ^ d[32] ^ d[30] ^ d[29] ^ d[28] ^ d[27] ^ d[26] ^ d[24] ^ d[23] ^ d[22] ^ d[14] ^ d[10] ^ d[8] ^ d[7] ^ d[4] ^ c[0] ^ c[3] ^ c[10] ^ c[11] ^ c[13] ^ c[14] ^ c[16] ^ c[19] ^ c[20] ^ c[21] ^ c[24] ^ c[26] ^ c[27] ^ c[29] ^ c[31];
    newcrc[31] = d[62] ^ d[60] ^ d[59] ^ d[57] ^ d[54] ^ d[53] ^ d[52] ^ d[49] ^ d[47] ^ d[46] ^ d[44] ^ d[43] ^ d[36] ^ d[33] ^ d[31] ^ d[30] ^ d[29] ^ d[28] ^ d[27] ^ d[25] ^ d[24] ^ d[23] ^ d[15] ^ d[11] ^ d[9] ^ d[8] ^ d[5] ^ c[1] ^ c[4] ^ c[11] ^ c[12] ^ c[14] ^ c[15] ^ c[17] ^ c[20] ^ c[21] ^ c[22] ^ c[25] ^ c[27] ^ c[28] ^ c[30];
    CRC32_D64 = newcrc;
  end
endfunction

function [31:0] CRC32_D16;

    input [15:0] Data;
    input [31:0] crc;
    reg [15:0] d;
    reg [31:0] c;
    reg [31:0] newcrc;
    begin
      d = Data;
      c = crc;
    
      newcrc[0] = d[12] ^ d[10] ^ d[9] ^ d[6] ^ d[0] ^ c[16] ^ c[22] ^ c[25] ^ c[26] ^ c[28];
      newcrc[1] = d[13] ^ d[12] ^ d[11] ^ d[9] ^ d[7] ^ d[6] ^ d[1] ^ d[0] ^ c[16] ^ c[17] ^ c[22] ^ c[23] ^ c[25] ^ c[27] ^ c[28] ^ c[29];
      newcrc[2] = d[14] ^ d[13] ^ d[9] ^ d[8] ^ d[7] ^ d[6] ^ d[2] ^ d[1] ^ d[0] ^ c[16] ^ c[17] ^ c[18] ^ c[22] ^ c[23] ^ c[24] ^ c[25] ^ c[29] ^ c[30];
      newcrc[3] = d[15] ^ d[14] ^ d[10] ^ d[9] ^ d[8] ^ d[7] ^ d[3] ^ d[2] ^ d[1] ^ c[17] ^ c[18] ^ c[19] ^ c[23] ^ c[24] ^ c[25] ^ c[26] ^ c[30] ^ c[31];
      newcrc[4] = d[15] ^ d[12] ^ d[11] ^ d[8] ^ d[6] ^ d[4] ^ d[3] ^ d[2] ^ d[0] ^ c[16] ^ c[18] ^ c[19] ^ c[20] ^ c[22] ^ c[24] ^ c[27] ^ c[28] ^ c[31];
      newcrc[5] = d[13] ^ d[10] ^ d[7] ^ d[6] ^ d[5] ^ d[4] ^ d[3] ^ d[1] ^ d[0] ^ c[16] ^ c[17] ^ c[19] ^ c[20] ^ c[21] ^ c[22] ^ c[23] ^ c[26] ^ c[29];
      newcrc[6] = d[14] ^ d[11] ^ d[8] ^ d[7] ^ d[6] ^ d[5] ^ d[4] ^ d[2] ^ d[1] ^ c[17] ^ c[18] ^ c[20] ^ c[21] ^ c[22] ^ c[23] ^ c[24] ^ c[27] ^ c[30];
      newcrc[7] = d[15] ^ d[10] ^ d[8] ^ d[7] ^ d[5] ^ d[3] ^ d[2] ^ d[0] ^ c[16] ^ c[18] ^ c[19] ^ c[21] ^ c[23] ^ c[24] ^ c[26] ^ c[31];
      newcrc[8] = d[12] ^ d[11] ^ d[10] ^ d[8] ^ d[4] ^ d[3] ^ d[1] ^ d[0] ^ c[16] ^ c[17] ^ c[19] ^ c[20] ^ c[24] ^ c[26] ^ c[27] ^ c[28];
      newcrc[9] = d[13] ^ d[12] ^ d[11] ^ d[9] ^ d[5] ^ d[4] ^ d[2] ^ d[1] ^ c[17] ^ c[18] ^ c[20] ^ c[21] ^ c[25] ^ c[27] ^ c[28] ^ c[29];
      newcrc[10] = d[14] ^ d[13] ^ d[9] ^ d[5] ^ d[3] ^ d[2] ^ d[0] ^ c[16] ^ c[18] ^ c[19] ^ c[21] ^ c[25] ^ c[29] ^ c[30];
      newcrc[11] = d[15] ^ d[14] ^ d[12] ^ d[9] ^ d[4] ^ d[3] ^ d[1] ^ d[0] ^ c[16] ^ c[17] ^ c[19] ^ c[20] ^ c[25] ^ c[28] ^ c[30] ^ c[31];
      newcrc[12] = d[15] ^ d[13] ^ d[12] ^ d[9] ^ d[6] ^ d[5] ^ d[4] ^ d[2] ^ d[1] ^ d[0] ^ c[16] ^ c[17] ^ c[18] ^ c[20] ^ c[21] ^ c[22] ^ c[25] ^ c[28] ^ c[29] ^ c[31];
      newcrc[13] = d[14] ^ d[13] ^ d[10] ^ d[7] ^ d[6] ^ d[5] ^ d[3] ^ d[2] ^ d[1] ^ c[17] ^ c[18] ^ c[19] ^ c[21] ^ c[22] ^ c[23] ^ c[26] ^ c[29] ^ c[30];
      newcrc[14] = d[15] ^ d[14] ^ d[11] ^ d[8] ^ d[7] ^ d[6] ^ d[4] ^ d[3] ^ d[2] ^ c[18] ^ c[19] ^ c[20] ^ c[22] ^ c[23] ^ c[24] ^ c[27] ^ c[30] ^ c[31];
      newcrc[15] = d[15] ^ d[12] ^ d[9] ^ d[8] ^ d[7] ^ d[5] ^ d[4] ^ d[3] ^ c[19] ^ c[20] ^ c[21] ^ c[23] ^ c[24] ^ c[25] ^ c[28] ^ c[31];
      newcrc[16] = d[13] ^ d[12] ^ d[8] ^ d[5] ^ d[4] ^ d[0] ^ c[0] ^ c[16] ^ c[20] ^ c[21] ^ c[24] ^ c[28] ^ c[29];
      newcrc[17] = d[14] ^ d[13] ^ d[9] ^ d[6] ^ d[5] ^ d[1] ^ c[1] ^ c[17] ^ c[21] ^ c[22] ^ c[25] ^ c[29] ^ c[30];
      newcrc[18] = d[15] ^ d[14] ^ d[10] ^ d[7] ^ d[6] ^ d[2] ^ c[2] ^ c[18] ^ c[22] ^ c[23] ^ c[26] ^ c[30] ^ c[31];
      newcrc[19] = d[15] ^ d[11] ^ d[8] ^ d[7] ^ d[3] ^ c[3] ^ c[19] ^ c[23] ^ c[24] ^ c[27] ^ c[31];
      newcrc[20] = d[12] ^ d[9] ^ d[8] ^ d[4] ^ c[4] ^ c[20] ^ c[24] ^ c[25] ^ c[28];
      newcrc[21] = d[13] ^ d[10] ^ d[9] ^ d[5] ^ c[5] ^ c[21] ^ c[25] ^ c[26] ^ c[29];
      newcrc[22] = d[14] ^ d[12] ^ d[11] ^ d[9] ^ d[0] ^ c[6] ^ c[16] ^ c[25] ^ c[27] ^ c[28] ^ c[30];
      newcrc[23] = d[15] ^ d[13] ^ d[9] ^ d[6] ^ d[1] ^ d[0] ^ c[7] ^ c[16] ^ c[17] ^ c[22] ^ c[25] ^ c[29] ^ c[31];
      newcrc[24] = d[14] ^ d[10] ^ d[7] ^ d[2] ^ d[1] ^ c[8] ^ c[17] ^ c[18] ^ c[23] ^ c[26] ^ c[30];
      newcrc[25] = d[15] ^ d[11] ^ d[8] ^ d[3] ^ d[2] ^ c[9] ^ c[18] ^ c[19] ^ c[24] ^ c[27] ^ c[31];
      newcrc[26] = d[10] ^ d[6] ^ d[4] ^ d[3] ^ d[0] ^ c[10] ^ c[16] ^ c[19] ^ c[20] ^ c[22] ^ c[26];
      newcrc[27] = d[11] ^ d[7] ^ d[5] ^ d[4] ^ d[1] ^ c[11] ^ c[17] ^ c[20] ^ c[21] ^ c[23] ^ c[27];
      newcrc[28] = d[12] ^ d[8] ^ d[6] ^ d[5] ^ d[2] ^ c[12] ^ c[18] ^ c[21] ^ c[22] ^ c[24] ^ c[28];
      newcrc[29] = d[13] ^ d[9] ^ d[7] ^ d[6] ^ d[3] ^ c[13] ^ c[19] ^ c[22] ^ c[23] ^ c[25] ^ c[29];
      newcrc[30] = d[14] ^ d[10] ^ d[8] ^ d[7] ^ d[4] ^ c[14] ^ c[20] ^ c[23] ^ c[24] ^ c[26] ^ c[30];
      newcrc[31] = d[15] ^ d[11] ^ d[9] ^ d[8] ^ d[5] ^ c[15] ^ c[21] ^ c[24] ^ c[25] ^ c[27] ^ c[31];
      CRC32_D16 = newcrc;
    end
endfunction

localparam [5:0]    S_IDLE      = 6'b000000,
                    S_PREAMBLE0 = 6'b000010,
                    S_PREAMBLE1 = 6'b000100,
                    S_PREAMBLE2 = 6'b001000,
                    S_PREAMBLE3 = 6'b010000,
                    S_DATA0     = 6'b000011,
                    S_DATA1     = 6'b000101,
                    S_DATA2     = 6'b001001,
                    S_DATA3     = 6'b010001,
                    S_END       = 6'b000001;

reg [5:0]   CS;
reg [5:0]   NS;
reg [31:0]  crc32_reg0;
reg [31:0]  crc32_reg1;
reg [31:0]  crc32_reg2;
reg [31:0]  crc32_reg3;
wire [63:0] UDP_IP_dout_reverse0;
wire [63:0] UDP_IP_dout_reverse1;
wire [63:0] UDP_IP_dout_reverse2;
wire [63:0] UDP_IP_dout_reverse3;
wire [15:0] UDP_IP_dout_16_reverse0;
wire [15:0] UDP_IP_dout_16_reverse1;
wire [15:0] UDP_IP_dout_16_reverse2;
wire [15:0] UDP_IP_dout_16_reverse3;
wire [31:0] crc320;
wire [31:0] crc321;
wire [31:0] crc322;
wire [31:0] crc323;
wire [31:0] crc32_160;
wire [31:0] crc32_161;
wire [31:0] crc32_162;
wire [31:0] crc32_163;
wire [31:0] crc32_16_reverse0;
wire [31:0] crc32_16_reverse1;
wire [31:0] crc32_16_reverse2;
wire [31:0] crc32_16_reverse3;
reg [2:0] end_counter;

always @(posedge Ethernet_clk) begin
    if (Ethernet_rst || pl_rst) begin
        CS <= S_IDLE;
    end
    else begin
        CS <= NS;
    end
end

always @(*) begin
    NS = 6'bxxxxxx;
    case (CS)
        S_IDLE:
        begin
            if (UDP_IP_start0)
                NS = S_PREAMBLE0;
            else if (UDP_IP_start1)
                NS = S_PREAMBLE1;
            else if (UDP_IP_start2)
                NS = S_PREAMBLE2;
            else if (UDP_IP_start3)
                NS = S_PREAMBLE3;
            else
                NS = S_IDLE;
        end

        S_PREAMBLE0:
        begin
            NS = S_DATA0;
        end

        S_DATA0:
        begin
            if (UDP_IP_end0)
                NS = S_END;
            else
                NS = S_DATA0;
        end

        S_PREAMBLE1:
        begin
            NS = S_DATA1;
        end

        S_DATA1:
        begin
            if (UDP_IP_end1)
                NS = S_END;
            else
                NS = S_DATA1;
        end

        S_PREAMBLE2:
        begin
            NS = S_DATA2;
        end

        S_DATA2:
        begin
            if (UDP_IP_end2)
                NS = S_END;
            else
                NS = S_DATA2;
        end

        S_PREAMBLE3:
        begin
            NS = S_DATA3;
        end

        S_DATA3:
        begin
            if (UDP_IP_end3)
                NS = S_END;
            else
                NS = S_DATA3;
        end

        S_END:
        begin
            if (end_counter == 5)
              NS = S_IDLE;
            else
              NS = S_END;
        end

        default:
        begin
            NS = S_IDLE;
        end
    endcase
    if (pl_rst)
        NS = S_IDLE;
end

always @(posedge Ethernet_clk) begin
    if (Ethernet_rst || pl_rst) begin
        end_counter <= 'd0;
        mac_ack0     <= 1'b0;
        mac_ack1     <= 1'b0;
        mac_ack2     <= 1'b0;
        mac_ack3     <= 1'b0;
        xgmii_txc   <= 8'hff;
        xgmii_txd   <= 64'h0707_0707_0707_0707;
        crc32_reg0  <= 32'hffff_ffff;
        crc32_reg1  <= 32'hffff_ffff;
        crc32_reg2  <= 32'hffff_ffff;
        crc32_reg3  <= 32'hffff_ffff;
    end
    else begin
        case(CS)
            S_IDLE:
            begin
                if (NS == S_PREAMBLE0)
                    mac_ack0     <= 1'b1;
                else
                    mac_ack0     <= 1'b0;

                if (NS == S_PREAMBLE1)
                    mac_ack1     <= 1'b1;
                else
                    mac_ack1     <= 1'b0;

                if (NS == S_PREAMBLE2)
                    mac_ack2     <= 1'b1;
                else
                    mac_ack2     <= 1'b0;

                if (NS == S_PREAMBLE3)
                    mac_ack3     <= 1'b1;
                else
                    mac_ack3     <= 1'b0;

                xgmii_txc   <= 8'hff;
                xgmii_txd   <= 64'h0707_0707_0707_0707;
                crc32_reg0  <= 32'hffff_ffff;
                crc32_reg1  <= 32'hffff_ffff;
                crc32_reg2  <= 32'hffff_ffff;
                crc32_reg3  <= 32'hffff_ffff;
                end_counter <= 'd0;
            end

            S_PREAMBLE0:
            begin
                mac_ack0     <= 1'b0;
                mac_ack1     <= 1'b0;
                mac_ack2     <= 1'b0;
                mac_ack3     <= 1'b0;
                end_counter <= 'd0;
                xgmii_txc   <= 8'b0000_0001;
                xgmii_txd   <= 64'hD555_5555_5555_55FB;
                crc32_reg0  <= 32'hffff_ffff;
                crc32_reg1  <= 32'hffff_ffff;
                crc32_reg2  <= 32'hffff_ffff;
                crc32_reg3  <= 32'hffff_ffff;
            end

            S_PREAMBLE1:
            begin
                mac_ack0     <= 1'b0;
                mac_ack1     <= 1'b0;
                mac_ack2     <= 1'b0;
                mac_ack3     <= 1'b0;
                end_counter <= 'd0;
                xgmii_txc   <= 8'b0000_0001;
                xgmii_txd   <= 64'hD555_5555_5555_55FB;
                crc32_reg0  <= 32'hffff_ffff;
                crc32_reg1  <= 32'hffff_ffff;
                crc32_reg2  <= 32'hffff_ffff;
                crc32_reg3  <= 32'hffff_ffff;
            end

            S_PREAMBLE2:
            begin
                mac_ack0     <= 1'b0;
                mac_ack1     <= 1'b0;
                mac_ack2     <= 1'b0;
                mac_ack3     <= 1'b0;
                end_counter <= 'd0;
                xgmii_txc   <= 8'b0000_0001;
                xgmii_txd   <= 64'hD555_5555_5555_55FB;
                crc32_reg0  <= 32'hffff_ffff;
                crc32_reg1  <= 32'hffff_ffff;
                crc32_reg2  <= 32'hffff_ffff;
                crc32_reg3  <= 32'hffff_ffff;
            end

            S_PREAMBLE3:
            begin
                mac_ack0     <= 1'b0;
                mac_ack1     <= 1'b0;
                mac_ack2     <= 1'b0;
                mac_ack3     <= 1'b0;
                end_counter <= 'd0;
                xgmii_txc   <= 8'b0000_0001;
                xgmii_txd   <= 64'hD555_5555_5555_55FB;
                crc32_reg0  <= 32'hffff_ffff;
                crc32_reg1  <= 32'hffff_ffff;
                crc32_reg2  <= 32'hffff_ffff;
                crc32_reg3  <= 32'hffff_ffff;
            end

            S_DATA0:
            begin
                mac_ack0     <= 1'b0;
                mac_ack1     <= 1'b0;
                mac_ack2     <= 1'b0;
                mac_ack3     <= 1'b0;
                end_counter <= 'd0;
                       
                crc32_reg0  <= crc320;
                crc32_reg1  <= 32'hffff_ffff;
                crc32_reg2  <= 32'hffff_ffff;
                crc32_reg3  <= 32'hffff_ffff;
                if (NS == S_END)
                begin
                    xgmii_txd   <= {16'h07FD,~crc32_16_reverse0, UDP_IP_dout0[15:0]};
                    xgmii_txc   <= 8'b1100_0000; 
                end
                else begin
                    xgmii_txd   <= UDP_IP_dout0;
                    xgmii_txc   <= 8'h0; 
                end
            end

            S_DATA1:
            begin
                mac_ack0     <= 1'b0;
                mac_ack1     <= 1'b0;
                mac_ack2     <= 1'b0;
                mac_ack3     <= 1'b0;
                end_counter  <= 'd0;
                       
                crc32_reg1   <= crc321;
                crc32_reg0  <= 32'hffff_ffff;
                crc32_reg2  <= 32'hffff_ffff;
                crc32_reg3  <= 32'hffff_ffff;
                if (NS == S_END)
                begin
                    xgmii_txd   <= {16'h07FD,~crc32_16_reverse1, UDP_IP_dout1[15:0]};
                    xgmii_txc   <= 8'b1100_0000; 
                end
                else begin
                    xgmii_txd   <= UDP_IP_dout1;
                    xgmii_txc   <= 8'h0; 
                end
            end

            S_DATA2:
            begin
                mac_ack0     <= 1'b0;
                mac_ack1     <= 1'b0;
                mac_ack2     <= 1'b0;
                mac_ack3     <= 1'b0;
                end_counter <= 'd0;
                       
                crc32_reg2  <= crc322;
                crc32_reg0  <= 32'hffff_ffff;
                crc32_reg1  <= 32'hffff_ffff;
                crc32_reg3  <= 32'hffff_ffff;
                if (NS == S_END)
                begin
                    xgmii_txd   <= {16'h07FD,~crc32_16_reverse2, UDP_IP_dout2[15:0]};
                    xgmii_txc   <= 8'b1100_0000; 
                end
                else begin
                    xgmii_txd   <= UDP_IP_dout2;
                    xgmii_txc   <= 8'h0; 
                end
            end

            S_DATA3:
            begin
                mac_ack0     <= 1'b0;
                mac_ack1     <= 1'b0;
                mac_ack2     <= 1'b0;
                mac_ack3     <= 1'b0;
                end_counter <= 'd0;
                crc32_reg0  <= 32'hffff_ffff;
                crc32_reg1  <= 32'hffff_ffff;
                crc32_reg2  <= 32'hffff_ffff;
                       
                crc32_reg3  <= crc323;
                if (NS == S_END)
                begin
                    xgmii_txd   <= {16'h07FD,~crc32_16_reverse3, UDP_IP_dout3[15:0]};
                    xgmii_txc   <= 8'b1100_0000; 
                end
                else begin
                    xgmii_txd   <= UDP_IP_dout3;
                    xgmii_txc   <= 8'h0; 
                end
            end

            S_END:
            begin
                mac_ack0     <= 1'b0;
                mac_ack1     <= 1'b0;
                mac_ack2     <= 1'b0;
                mac_ack3     <= 1'b0;
                end_counter <= end_counter + 'd1;
                xgmii_txc   <= 8'hff;
                xgmii_txd   <= 64'h0707_0707_0707_0707;
                crc32_reg0  <= 32'hffff_ffff;
                crc32_reg1  <= 32'hffff_ffff;
                crc32_reg2  <= 32'hffff_ffff;
                crc32_reg3  <= 32'hffff_ffff;
            end


            default:
            begin
                mac_ack0     <= 1'b0;
                mac_ack1     <= 1'b0;
                mac_ack2     <= 1'b0;
                mac_ack3     <= 1'b0;
                end_counter <= 'd0;
                xgmii_txc   <= 8'hff;
                xgmii_txd   <= 64'h0707_0707_0707_0707;
                crc32_reg0  <= 32'hffff_ffff;
                crc32_reg1  <= 32'hffff_ffff;
                crc32_reg2  <= 32'hffff_ffff;
                crc32_reg3  <= 32'hffff_ffff;
            end
        endcase
    end
end


generate
    genvar i0,l0,j0;
    for (i0=0; i0<=63; i0=i0+1)
    begin
        assign UDP_IP_dout_reverse0[i0] = UDP_IP_dout0[63-i0];
    end
    for (l0=0; l0<=15; l0=l0+1)
    begin
        assign UDP_IP_dout_16_reverse0[l0] = UDP_IP_dout0[15-l0];
    end
    for (j0=0; j0<=31; j0=j0+1)
    begin
        assign crc32_16_reverse0[j0] = crc32_160[31-j0];
    end
endgenerate

assign crc320    = CRC32_D64(UDP_IP_dout_reverse0, crc32_reg0);
assign crc32_160 = CRC32_D16(UDP_IP_dout_16_reverse0, crc32_reg0);

generate
    genvar i1,l1,j1;
    for (i1=0; i1<=63; i1=i1+1)
    begin
        assign UDP_IP_dout_reverse1[i1] = UDP_IP_dout1[63-i1];
    end
    for (l1=0; l1<=15; l1=l1+1)
    begin
        assign UDP_IP_dout_16_reverse1[l1] = UDP_IP_dout1[15-l1];
    end
    for (j1=0; j1<=31; j1=j1+1)
    begin
        assign crc32_16_reverse1[j1] = crc32_161[31-j1];
    end
endgenerate

assign crc321    = CRC32_D64(UDP_IP_dout_reverse1, crc32_reg1);
assign crc32_161 = CRC32_D16(UDP_IP_dout_16_reverse1, crc32_reg1);

generate
    genvar i2,l2,j2;
    for (i2=0; i2<=63; i2=i2+1)
    begin
        assign UDP_IP_dout_reverse2[i2] = UDP_IP_dout2[63-i2];
    end
    for (l2=0; l2<=15; l2=l2+1)
    begin
        assign UDP_IP_dout_16_reverse2[l2] = UDP_IP_dout2[15-l2];
    end
    for (j2=0; j2<=31; j2=j2+1)
    begin
        assign crc32_16_reverse2[j2] = crc32_162[31-j2];
    end
endgenerate

assign crc322    = CRC32_D64(UDP_IP_dout_reverse2, crc32_reg2);
assign crc32_162 = CRC32_D16(UDP_IP_dout_16_reverse2, crc32_reg2);

generate
    genvar i3,l3,j3;
    for (i3=0; i3<=63; i3=i3+1)
    begin
        assign UDP_IP_dout_reverse3[i3] = UDP_IP_dout3[63-i3];
    end
    for (l3=0; l3<=15; l3=l3+1)
    begin
        assign UDP_IP_dout_16_reverse3[l3] = UDP_IP_dout3[15-l3];
    end
    for (j3=0; j3<=31; j3=j3+1)
    begin
        assign crc32_16_reverse3[j3] = crc32_163[31-j3];
    end
endgenerate

assign crc323    = CRC32_D64(UDP_IP_dout_reverse3, crc32_reg3);
assign crc32_163 = CRC32_D16(UDP_IP_dout_16_reverse3, crc32_reg3);



endmodule



