`timescale 1ns / 1ps


module seu_vdif_packet(
    input   wire            pl_clk,
    input   wire            pl_rst,
    input   wire    [31:0]  pl_din,
    input   wire            clk_10M,
    input   wire            PPS_rst,

    input   wire            ps_config_en,
    input   wire            ps_tx_en,
    input   wire    [31:0]  local_mac_h,
    input   wire    [31:0]  local_mac_l,
    input   wire    [31:0]  local_ip,
    input   wire    [15:0]  local_port,
    input   wire    [31:0]  dest_mac_h,
    input   wire    [31:0]  dest_mac_l,
    input   wire    [31:0]  dest_ip,
    input   wire    [15:0]  dest_port,
    input   wire    [2:0]   Vvdif,
    input   wire    [15:0]  Sid,
    input   wire    [9:0]   Tid,
    input   wire    [29:0]  RENS,
    input   wire    [5:0]   REN,
    input   wire            RENS_valid,
    output  wire    [31:0]  module_id,
    
    input   wire            Ethernet_clk,
    input   wire            Ethernet_rst,

    input   wire            mac_ack,
    output  wire    [63:0]  UDP_IP_dout,
    output  wire            UDP_IP_start,
    output  wire            UDP_IP_end
);

wire    [31:0]  packet_fifo_din;
wire            packet_fifo_wr_en;
wire            data_fifo_rd_en;
wire    [63:0]  data_fifo_dout;
wire            packet_fifo_full;
wire            data_fifo_empty;
wire            packet_fifo_prog_full;

eth_packet_fifo packet_fifo_i (
  .rst(pl_rst),                     
  .wr_clk(pl_clk),                  
  .rd_clk(Ethernet_clk),            
  .din(packet_fifo_din),            
  .wr_en(packet_fifo_wr_en),        
  .rd_en(data_fifo_rd_en),          
  .dout(data_fifo_dout),            
  .full(packet_fifo_full),          
  .empty(data_fifo_empty),          
  .prog_full(packet_fifo_prog_full) 
);

wire    [360:0] ctrl_fifo_din;
wire            ctrl_fifo_wr_en;
wire            ctrl_fifo_rd_en;
wire    [360:0] ctrl_fifo_dout;
wire            ctrl_fifo_full;
wire            ctrl_fifo_almost_full;
wire            ctrl_fifo_empty;

eth_ctrl_fifo ctrl_fifo_i(
  .rst(pl_rst),                         
  .wr_clk(pl_clk),                      
  .rd_clk(Ethernet_clk),                
  .din(ctrl_fifo_din),                  
  .wr_en(ctrl_fifo_wr_en),              
  .rd_en(ctrl_fifo_rd_en),              
  .dout(ctrl_fifo_dout),                
  .full(ctrl_fifo_full),                
  .almost_full(ctrl_fifo_almost_full),  
  .empty(ctrl_fifo_empty)               
);

wire    UDP_IP_ready;
wire    frame_coming;

ethernet_packet ethernet_packet_i(
    .pl_clk             (pl_clk),
    .pl_rst             (pl_rst),
    .pl_din_valid       (~pl_rst),
    .pl_din             (pl_din),

    .Utime_clk          (clk_10M),
    .PPS_rst            (PPS_rst),

    .ps_config_en       (ps_config_en),
    .ps_tx_en           (ps_tx_en),  

    .local_mac          ({local_mac_h[15:0], local_mac_l}),
    .local_ip           (local_ip),
    .local_port         (local_port),

    .dest_mac           ({dest_mac_h[15:0], dest_mac_l}),
    .dest_ip            (dest_ip),
    .dest_port          (dest_port),
    .Vvdif              (Vvdif),
    .Sid                (Sid),
    .Tid                (Tid),

    .RENS               (RENS),
    .REN                (REN),
    .RENS_valid         (RENS_valid),

    .packet_fifo_full       (packet_fifo_full),
    .packet_fifo_prog_full  (packet_fifo_prog_full),
    .packet_fifo_wr_en      (packet_fifo_wr_en),
    .packet_fifo_din        (packet_fifo_din),

    .ctrl_fifo_full         (ctrl_fifo_full),
    .ctrl_fifo_almost_full  (ctrl_fifo_almost_full),
    .ctrl_fifo_wr_en        (ctrl_fifo_wr_en),
    .ctrl_fifo_din          (ctrl_fifo_din),

    .Ethernet_clk           (Ethernet_clk),
    .UDP_IP_ready           (UDP_IP_ready),
    .frame_coming           (frame_coming)
);

ethernet_UDPIP ethernet_UDPIP_i(
    .ctrl_fifo_dout         (ctrl_fifo_dout),
    .ctrl_fifo_empty        (ctrl_fifo_empty),
    .ctrl_fifo_rd_en        (ctrl_fifo_rd_en),

    .data_fifo_empty        (data_fifo_empty),
    .data_fifo_rd_en        (data_fifo_rd_en),
    .data_fifo_dout         (data_fifo_dout),

    .pl_rst                 (pl_rst),

    .Ethernet_clk           (Ethernet_clk),
    .Ethernet_rst           (Ethernet_rst),
    .frame_coming           (frame_coming),
    .mac_ack                (mac_ack),
    .UDP_IP_dout            (UDP_IP_dout),
    .UDP_IP_start           (UDP_IP_start),
    .UDP_IP_ready           (UDP_IP_ready),
    .UDP_IP_end             (UDP_IP_end)
);

endmodule

