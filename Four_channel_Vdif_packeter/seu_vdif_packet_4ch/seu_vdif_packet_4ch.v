`timescale 1ns / 1ps


module seu_vdif_packet_4ch(
    input   wire            pl_clk,
    input   wire            pl_rst,
    input   wire    [31:0]  pl_din_0,
    input   wire    [31:0]  pl_din_1,
    input   wire    [31:0]  pl_din_2,
    input   wire    [31:0]  pl_din_3,
    input   wire            clk_10M,
    input   wire            PPS_rst,

    output  wire    [31:0]  module_id,
    input   wire            ps_config_en_0,
    input   wire            ps_tx_en_0,
    input   wire    [31:0]  local_mac_h_0,
    input   wire    [31:0]  local_mac_l_0,
    input   wire    [31:0]  local_ip_0,
    input   wire    [15:0]  local_port_0,
    input   wire    [31:0]  dest_mac_h_0,
    input   wire    [31:0]  dest_mac_l_0,
    input   wire    [31:0]  dest_ip_0,
    input   wire    [15:0]  dest_port_0,
    input   wire    [2:0]   Vvdif_0,
    input   wire    [15:0]  Sid_0,
    input   wire    [9:0]   Tid_0,
    input   wire    [29:0]  RENS_0,
    input   wire    [5:0]   REN_0,
    input   wire            RENS_valid_0,
    input   wire            ps_config_en_0_we,
    input   wire            ps_tx_en_0_we,
    input   wire            local_mac_h_0_we,
    input   wire            local_mac_l_0_we,
    input   wire            local_ip_0_we,
    input   wire            local_port_0_we,
    input   wire            dest_mac_h_0_we,
    input   wire            dest_mac_l_0_we,
    input   wire            dest_ip_0_we,
    input   wire            dest_port_0_we,
    input   wire            Vvdif_0_we,
    input   wire            Sid_0_we,
    input   wire            Tid_0_we,
    input   wire            RENS_0_we,
    input   wire            REN_0_we,
    input   wire            RENS_valid_0_we,

    input   wire            ps_config_en_1,
    input   wire            ps_tx_en_1,
    input   wire    [31:0]  local_mac_h_1,
    input   wire    [31:0]  local_mac_l_1,
    input   wire    [31:0]  local_ip_1,
    input   wire    [15:0]  local_port_1,
    input   wire    [31:0]  dest_mac_h_1,
    input   wire    [31:0]  dest_mac_l_1,
    input   wire    [31:0]  dest_ip_1,
    input   wire    [15:0]  dest_port_1,
    input   wire    [2:0]   Vvdif_1,
    input   wire    [15:0]  Sid_1,
    input   wire    [9:0]   Tid_1,
    input   wire    [29:0]  RENS_1,
    input   wire    [5:0]   REN_1,
    input   wire            RENS_valid_1,
    input   wire            ps_config_en_1_we,
    input   wire            ps_tx_en_1_we,
    input   wire            local_mac_h_1_we,
    input   wire            local_mac_l_1_we,
    input   wire            local_ip_1_we,
    input   wire            local_port_1_we,
    input   wire            dest_mac_h_1_we,
    input   wire            dest_mac_l_1_we,
    input   wire            dest_ip_1_we,
    input   wire            dest_port_1_we,
    input   wire            Vvdif_1_we,
    input   wire            Sid_1_we,
    input   wire            Tid_1_we,
    input   wire            RENS_1_we,
    input   wire            REN_1_we,
    input   wire            RENS_valid_1_we,

    input   wire            ps_config_en_2,
    input   wire            ps_tx_en_2,
    input   wire    [31:0]  local_mac_h_2,
    input   wire    [31:0]  local_mac_l_2,
    input   wire    [31:0]  local_ip_2,
    input   wire    [15:0]  local_port_2,
    input   wire    [31:0]  dest_mac_h_2,
    input   wire    [31:0]  dest_mac_l_2,
    input   wire    [31:0]  dest_ip_2,
    input   wire    [15:0]  dest_port_2,
    input   wire    [2:0]   Vvdif_2,
    input   wire    [15:0]  Sid_2,
    input   wire    [9:0]   Tid_2,
    input   wire    [29:0]  RENS_2,
    input   wire    [5:0]   REN_2,
    input   wire            RENS_valid_2,
    input   wire            ps_config_en_2_we,
    input   wire            ps_tx_en_2_we,
    input   wire            local_mac_h_2_we,
    input   wire            local_mac_l_2_we,
    input   wire            local_ip_2_we,
    input   wire            local_port_2_we,
    input   wire            dest_mac_h_2_we,
    input   wire            dest_mac_l_2_we,
    input   wire            dest_ip_2_we,
    input   wire            dest_port_2_we,
    input   wire            Vvdif_2_we,
    input   wire            Sid_2_we,
    input   wire            Tid_2_we,
    input   wire            RENS_2_we,
    input   wire            REN_2_we,
    input   wire            RENS_valid_2_we,

    input   wire            ps_config_en_3,
    input   wire            ps_tx_en_3,
    input   wire    [31:0]  local_mac_h_3,
    input   wire    [31:0]  local_mac_l_3,
    input   wire    [31:0]  local_ip_3,
    input   wire    [15:0]  local_port_3,
    input   wire    [31:0]  dest_mac_h_3,
    input   wire    [31:0]  dest_mac_l_3,
    input   wire    [31:0]  dest_ip_3,
    input   wire    [15:0]  dest_port_3,
    input   wire    [2:0]   Vvdif_3,
    input   wire    [15:0]  Sid_3,
    input   wire    [9:0]   Tid_3,
    input   wire    [29:0]  RENS_3,
    input   wire    [5:0]   REN_3,
    input   wire            RENS_valid_3,
    input   wire            ps_config_en_3_we,
    input   wire            ps_tx_en_3_we,
    input   wire            local_mac_h_3_we,
    input   wire            local_mac_l_3_we,
    input   wire            local_ip_3_we,
    input   wire            local_port_3_we,
    input   wire            dest_mac_h_3_we,
    input   wire            dest_mac_l_3_we,
    input   wire            dest_ip_3_we,
    input   wire            dest_port_3_we,
    input   wire            Vvdif_3_we,
    input   wire            Sid_3_we,
    input   wire            Tid_3_we,
    input   wire            RENS_3_we,
    input   wire            REN_3_we,
    input   wire            RENS_valid_3_we,
    
    input   wire            Ethernet_clk,
    input   wire            Ethernet_rst,

    output  wire    [63:0]  xgmii_txd,
    output  wire    [7:0]   xgmii_txc
);

wire    [63:0]  UDP_IP_dout0;
wire            UDP_IP_end0;
wire            UDP_IP_start0;
wire            mac_ack0;
wire    [63:0]  UDP_IP_dout1;
wire            UDP_IP_end1;
wire            UDP_IP_start1;
wire            mac_ack1;
wire    [63:0]  UDP_IP_dout2;
wire            UDP_IP_end2;
wire            UDP_IP_start2;
wire            mac_ack2;
wire    [63:0]  UDP_IP_dout3;
wire            UDP_IP_end3;
wire            UDP_IP_start3;
wire            mac_ack3;

seu_mac4to1_mux seu_mac4to1_mux_i(
    .Ethernet_clk   (Ethernet_clk),
    .Ethernet_rst   (Ethernet_rst),
    .pl_rst         (pl_rst),

    .UDP_IP_dout0   (UDP_IP_dout0),
    .UDP_IP_end0    (UDP_IP_end0),
    .UDP_IP_start0  (UDP_IP_start0),
    .mac_ack0       (mac_ack0),

    .UDP_IP_dout1   (UDP_IP_dout1),
    .UDP_IP_end1    (UDP_IP_end1),
    .UDP_IP_start1  (UDP_IP_start1),
    .mac_ack1       (mac_ack1),

    .UDP_IP_dout2   (UDP_IP_dout2),
    .UDP_IP_end2    (UDP_IP_end2),
    .UDP_IP_start2  (UDP_IP_start2),
    .mac_ack2       (mac_ack2),

    .UDP_IP_dout3   (UDP_IP_dout3),
    .UDP_IP_end3    (UDP_IP_end3),
    .UDP_IP_start3  (UDP_IP_start3),
    .mac_ack3       (mac_ack3),

    .xgmii_txc      (xgmii_txc),
    .xgmii_txd      (xgmii_txd)
);

seu_vdif_packet seu_vdif_packet_i_0(
    .pl_clk         (pl_clk),
    .pl_rst         (pl_rst),
    .pl_din         (pl_din_0),
    .clk_10M        (clk_10M),
    .PPS_rst        (PPS_rst),

    .ps_config_en   (ps_config_en_0),
    .ps_tx_en       (ps_tx_en_0),
    .local_mac_h    (local_mac_h_0),
    .local_mac_l    (local_mac_l_0),
    .local_ip       (local_ip_0),
    .local_port     (local_port_0),
    .dest_mac_h     (dest_mac_h_0),
    .dest_mac_l     (dest_mac_l_0),
    .dest_ip        (dest_ip_0),
    .dest_port      (dest_port_0),
    .Vvdif          (Vvdif_0),
    .Sid            (Sid_0),
    .Tid            (Tid_0),
    .RENS           (RENS_0),
    .REN            (REN_0),
    .RENS_valid     (RENS_valid_0),
    .module_id      (module_id_0),
    
    .Ethernet_clk   (Ethernet_clk),
    .Ethernet_rst   (Ethernet_rst),

    .mac_ack        (mac_ack0),
    .UDP_IP_dout    (UDP_IP_dout0),
    .UDP_IP_start   (UDP_IP_start0),
    .UDP_IP_end     (UDP_IP_end0)
);

seu_vdif_packet seu_vdif_packet_i_1(
    .pl_clk         (pl_clk),
    .pl_rst         (pl_rst),
    .pl_din         (pl_din_1),
    .clk_10M        (clk_10M),
    .PPS_rst        (PPS_rst),

    .ps_config_en   (ps_config_en_1),
    .ps_tx_en       (ps_tx_en_1),
    .local_mac_h    (local_mac_h_1),
    .local_mac_l    (local_mac_l_1),
    .local_ip       (local_ip_1),
    .local_port     (local_port_1),
    .dest_mac_h     (dest_mac_h_1),
    .dest_mac_l     (dest_mac_l_1),
    .dest_ip        (dest_ip_1),
    .dest_port      (dest_port_1),
    .Vvdif          (Vvdif_1),
    .Sid            (Sid_1),
    .Tid            (Tid_1),
    .RENS           (RENS_1),
    .REN            (REN_1),
    .RENS_valid     (RENS_valid_1),
    .module_id      (module_id_1),
    
    .Ethernet_clk   (Ethernet_clk),
    .Ethernet_rst   (Ethernet_rst),

    .mac_ack        (mac_ack1),
    .UDP_IP_dout    (UDP_IP_dout1),
    .UDP_IP_start   (UDP_IP_start1),
    .UDP_IP_end     (UDP_IP_end1)
);

seu_vdif_packet seu_vdif_packet_i_2(
    .pl_clk         (pl_clk),
    .pl_rst         (pl_rst),
    .pl_din         (pl_din_2),
    .clk_10M        (clk_10M),
    .PPS_rst        (PPS_rst),

    .ps_config_en   (ps_config_en_2),
    .ps_tx_en       (ps_tx_en_2),
    .local_mac_h    (local_mac_h_2),
    .local_mac_l    (local_mac_l_2),
    .local_ip       (local_ip_2),
    .local_port     (local_port_2),
    .dest_mac_h     (dest_mac_h_2),
    .dest_mac_l     (dest_mac_l_2),
    .dest_ip        (dest_ip_2),
    .dest_port      (dest_port_2),
    .Vvdif          (Vvdif_2),
    .Sid            (Sid_2),
    .Tid            (Tid_2),
    .RENS           (RENS_2),
    .REN            (REN_2),
    .RENS_valid     (RENS_valid_2),
    .module_id      (module_id_2),
    
    .Ethernet_clk   (Ethernet_clk),
    .Ethernet_rst   (Ethernet_rst),

    .mac_ack        (mac_ack2),
    .UDP_IP_dout    (UDP_IP_dout2),
    .UDP_IP_start   (UDP_IP_start2),
    .UDP_IP_end     (UDP_IP_end2)
);

seu_vdif_packet seu_vdif_packet_i_3(
    .pl_clk         (pl_clk),
    .pl_rst         (pl_rst),
    .pl_din         (pl_din_3),
    .clk_10M        (clk_10M),
    .PPS_rst        (PPS_rst),

    .ps_config_en   (ps_config_en_3),
    .ps_tx_en       (ps_tx_en_3),
    .local_mac_h    (local_mac_h_3),
    .local_mac_l    (local_mac_l_3),
    .local_ip       (local_ip_3),
    .local_port     (local_port_3),
    .dest_mac_h     (dest_mac_h_3),
    .dest_mac_l     (dest_mac_l_3),
    .dest_ip        (dest_ip_3),
    .dest_port      (dest_port_3),
    .Vvdif          (Vvdif_3),
    .Sid            (Sid_3),
    .Tid            (Tid_3),
    .RENS           (RENS_3),
    .REN            (REN_3),
    .RENS_valid     (RENS_valid_3),
    .module_id      (module_id_3),
    
    .Ethernet_clk   (Ethernet_clk),
    .Ethernet_rst   (Ethernet_rst),

    .mac_ack        (mac_ack3),
    .UDP_IP_dout    (UDP_IP_dout3),
    .UDP_IP_start   (UDP_IP_start3),
    .UDP_IP_end     (UDP_IP_end3)
);
endmodule


