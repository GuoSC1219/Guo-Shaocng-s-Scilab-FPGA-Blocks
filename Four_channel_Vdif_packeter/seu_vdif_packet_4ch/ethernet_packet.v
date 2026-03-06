`timescale 1ns / 1ps


module ethernet_packet
#(
    parameter DEFAULT_LOCAL_MAC     = 48'h20d2_ffee_1156,
    parameter DEFAULT_LOCAL_IP      = 32'hC0A80170,
    parameter DEFAULT_LOCAL_PORT    = 16'd5500, 
    parameter DEFAULT_DEST_MAC      = 48'h90e2_ba8c_37b4,
    parameter DEFAULT_DEST_IP       = 32'hC0A80173,
    parameter DEFAULT_DEST_PORT     = 16'd5005
)(
    /* PL Data Interface */
    input   wire                pl_clk,
    input   wire                pl_rst,
    input   wire                pl_din_valid,
    input   wire    [31:0]      pl_din,

    input   wire                Utime_clk,
    input   wire                PPS_rst,

    /* PS Interface */
    input   wire            ps_config_en,
    input   wire            ps_tx_en,

    input   wire    [47:0]  local_mac,
    input   wire    [31:0]  local_ip,
    input   wire    [15:0]  local_port,

    input   wire    [47:0]  dest_mac,
    input   wire    [31:0]  dest_ip,
    input   wire    [15:0]  dest_port,

    input   wire    [29:0]  RENS,
    input   wire    [5:0]   REN,
    input   wire            RENS_valid,
    input   wire    [2:0]   Vvdif,
    input   wire    [15:0]  Sid,
    input   wire    [9:0]   Tid,
    

    /*Packet Fifo Interface*/
    input   wire            packet_fifo_full,
    input   wire            packet_fifo_prog_full,
    output  wire            packet_fifo_wr_en,
    output  reg     [31:0]  packet_fifo_din,

    /*Ctrl Fifo Interface*/
    input   wire            ctrl_fifo_full,
    input   wire            ctrl_fifo_almost_full,
    output  wire            ctrl_fifo_wr_en,
    output  wire    [360:0] ctrl_fifo_din,

    /*Ethernet Interface*/
    input   wire            Ethernet_clk,
    input   wire            UDP_IP_ready,
    output  wire            frame_coming
);

/* CDC PS Clock to PL Data Clock */
reg [1:0]   ps_config_en_pl_domain;
reg [1:0]   ps_tx_en_pl_domain;
reg [1:0]   RENS_valid_domain;

reg [47:0]  local_mac_reg0;
reg [31:0]  local_ip_reg0;
reg [15:0]  local_port_reg0;
reg [47:0]  dest_mac_reg0;
reg [31:0]  dest_ip_reg0;
reg [15:0]  dest_port_reg0;
reg [2:0]   Vvdif_reg0;
reg [15:0]  Sid_reg0;
reg [9:0]   Tid_reg0;
reg [5:0]   REN_reg0;
reg [29:0]  RENS_reg0;

reg [47:0]  local_mac_reg1;
reg [31:0]  local_ip_reg1;
reg [15:0]  local_port_reg1;
reg [47:0]  dest_mac_reg1;
reg [31:0]  dest_ip_reg1;
reg [15:0]  dest_port_reg1;
reg [2:0]   Vvdif_reg1;
reg [15:0]  Sid_reg1;
reg [9:0]   Tid_reg1;
reg [5:0]   REN_reg1;
reg [29:0]  RENS_reg1;
reg [23:0]  FrameNum;


reg         pl_tx_en_latch;
reg [29:0]  RENS_latch;

reg [31:0]  Utime;
(*ASYNC_REG="TRUE"*)reg [31:0]  Utime_reg0,Utime_reg1;


reg  PPS_rst_10mreg0;
reg  PPS_rst_10mreg1;
wire PPS_rst_10mtoggle;
always @(posedge Utime_clk) begin
    if (PPS_rst_10mtoggle && RENS_valid_domain[1]) begin
        Utime       <= 'd0;
    end
    else begin
        if (Utime < 9999999) begin
            Utime <= Utime + 1'd1;
        end
        else begin
            Utime <= 'd0;
        end
    end
end

wire my_PPS_rst;
assign my_PPS_rst = (Utime == 'd0) & (Utime_reg0 == 32'd9999999);

reg  PPS_rst_reg0;
reg  PPS_rst_reg1;
wire PPS_rst_toggle;

always @(posedge pl_clk) begin
    if (pl_rst) begin
        FrameNum    <= 'd0;
        RENS_latch  <= 'd0;
    end
    else begin
        if (PPS_rst_toggle && RENS_valid_domain[1]) begin
            FrameNum    <= 'd0;
            RENS_latch  <= RENS_reg1;
        end else begin
            if (my_PPS_rst && (!RENS_valid_domain[1])) begin
                FrameNum <= 'd0;
                RENS_latch <= RENS_latch + 3;
            end
            else begin
                RENS_latch <= RENS_latch;
                if (ctrl_fifo_wr_en)
                    FrameNum   <= FrameNum + 1'd1;
                else 
                    FrameNum   <= FrameNum;
            end
        end
    end

end



always @(posedge pl_clk) begin
    if (pl_rst)
    begin
        Utime_reg0 <= 'd0;
        Utime_reg1 <= 'd0;
    end
    else begin
        Utime_reg0 <= Utime;
        Utime_reg1 <= Utime_reg0;
    end

end

assign PPS_rst_toggle = (PPS_rst_reg0) & (!PPS_rst_reg1);

always @(posedge pl_clk) begin
    PPS_rst_reg0 <= PPS_rst;
    PPS_rst_reg1 <= PPS_rst_reg0;
end



assign PPS_rst_10mtoggle = (PPS_rst_10mreg0) & (!PPS_rst_10mreg1);

always @(posedge Utime_clk) begin
    PPS_rst_10mreg0 <= PPS_rst;
    PPS_rst_10mreg1 <= PPS_rst_10mreg0;
end


always @(posedge pl_clk) begin
    ps_config_en_pl_domain <= {ps_config_en_pl_domain[0], ps_config_en};
    ps_tx_en_pl_domain     <= {ps_tx_en_pl_domain[0]    , ps_tx_en    };
    RENS_valid_domain      <= {RENS_valid_domain[0]     , RENS_valid  };
end

always @(posedge pl_clk) begin
    if (pl_rst) begin
        local_mac_reg0      <= DEFAULT_LOCAL_MAC;
        local_ip_reg0       <= DEFAULT_LOCAL_IP;
        local_port_reg0     <= DEFAULT_LOCAL_PORT;
        dest_mac_reg0       <= DEFAULT_DEST_MAC;
        dest_ip_reg0        <= DEFAULT_DEST_IP;
        dest_port_reg0      <= DEFAULT_DEST_PORT;
        Vvdif_reg0          <= 'd0;
        Sid_reg0            <= 'd0;
        Tid_reg0            <= 'd0;
        REN_reg0            <= 'd0;
    end
    else begin
        if (ps_config_en_pl_domain[1]) begin
            local_mac_reg0      <= local_mac;
            local_ip_reg0       <= local_ip;
            local_port_reg0     <= local_port;
            dest_mac_reg0       <= dest_mac;
            dest_ip_reg0        <= dest_ip;
            dest_port_reg0      <= dest_port;
        end
        else begin
            local_mac_reg0      <= DEFAULT_LOCAL_MAC;
            local_ip_reg0       <= DEFAULT_LOCAL_IP;
            local_port_reg0     <= DEFAULT_LOCAL_PORT;
            dest_mac_reg0       <= DEFAULT_DEST_MAC;
            dest_ip_reg0        <= DEFAULT_DEST_IP;
            dest_port_reg0      <= DEFAULT_DEST_PORT;
        end
        Vvdif_reg0          <= Vvdif;
        Sid_reg0            <= Sid;
        Tid_reg0            <= Tid;
        REN_reg0            <= REN;
        RENS_reg0           <= RENS;
    end
end

always @(posedge pl_clk) begin
    if (pl_rst) begin
        local_mac_reg1      <= DEFAULT_LOCAL_MAC;
        local_ip_reg1       <= DEFAULT_LOCAL_IP;
        local_port_reg1     <= DEFAULT_LOCAL_PORT;
        dest_mac_reg1       <= DEFAULT_DEST_MAC;
        dest_ip_reg1        <= DEFAULT_DEST_IP;
        dest_port_reg1      <= DEFAULT_DEST_PORT;
        Vvdif_reg1          <= 'd0;
        Sid_reg1            <= 'd0;
        Tid_reg1            <= 'd0;
        REN_reg1            <= 'd0;
    end
    else begin
        local_mac_reg1      <= local_mac_reg0;
        local_ip_reg1       <= local_ip_reg0;
        local_port_reg1     <= local_port_reg0;
        dest_mac_reg1       <= dest_mac_reg0;
        dest_ip_reg1        <= dest_ip_reg0;
        dest_port_reg1      <= dest_port_reg0;
        Vvdif_reg1          <= Vvdif_reg0;
        Sid_reg1            <= Sid_reg0;
        Tid_reg1            <= Tid_reg0;
        REN_reg1            <= REN_reg0;
        RENS_reg1           <= RENS_reg0;
    end
end


always @(posedge pl_clk) begin
    if (pl_rst) begin
        pl_tx_en_latch <= 1'd0;
    end
    else begin
        if ((pl_din_valid) && (ps_tx_en_pl_domain[1]) && (UDP_IP_ready))
            pl_tx_en_latch <= 1'd1;
        else
            pl_tx_en_latch <= 1'd0;
    end
end

/*Data Packet and Cache */
reg [47:0]  local_mac_latch;
reg [31:0]  local_ip_latch;
reg [15:0]  local_port_latch;
reg [47:0]  dest_mac_latch;
reg [31:0]  dest_ip_latch;
reg [15:0]  dest_port_latch;
reg [2:0]   Vvdif_latch;
reg [15:0]  Sid_latch;
reg [9:0]   Tid_latch;
reg [5:0]   REN_latch;
reg [31:0]  Utime_latch;

reg [15:0]  Identification;
reg [11:0]  data_cnt_word;


wire        tx_packet_end;

assign  tx_packet_end       = (data_cnt_word == 12'd2048);
assign  packet_fifo_wr_en   = pl_tx_en_latch & (!packet_fifo_full) & (!packet_fifo_prog_full);

always @(posedge pl_clk) begin
    if (pl_rst) begin
        local_mac_latch     <= DEFAULT_LOCAL_MAC;
        local_ip_latch      <= DEFAULT_LOCAL_IP;
        local_port_latch    <= DEFAULT_LOCAL_PORT;
        dest_mac_latch      <= DEFAULT_DEST_MAC;
        dest_ip_latch       <= DEFAULT_DEST_IP;
        dest_port_latch     <= DEFAULT_DEST_PORT;
        Vvdif_latch         <= 'd0;
        Sid_latch           <= 'd0;
        Tid_latch           <= 'd0;
        REN_latch           <= 'd0;
        Utime_latch         <= 'd0;

        Identification      <= 'd0;
        data_cnt_word       <= 'd1;
    end
    else begin

        if (tx_packet_end) begin
            local_mac_latch     <= local_mac_reg1;
            local_ip_latch      <= local_ip_reg1;
            local_port_latch    <= local_port_reg1;
            dest_mac_latch      <= dest_mac_reg1;
            dest_ip_latch       <= dest_ip_reg1;
            dest_port_latch     <= dest_port_reg1;
            Identification      <= Identification + 1'd1;
            data_cnt_word       <= 'd1;

            Vvdif_latch         <= Vvdif_reg1;
            Sid_latch           <= Sid_reg1;
            Tid_latch           <= Tid_reg1;
            REN_latch           <= REN_reg1;
            Utime_latch         <= Utime_reg1;
        end
        else begin
            local_mac_latch     <= local_mac_latch;
            local_ip_latch      <= local_ip_latch;
            local_port_latch    <= local_port_latch;
            dest_mac_latch      <= dest_mac_latch;
            dest_ip_latch       <= dest_ip_latch; 
            dest_port_latch     <= dest_port_latch;
            Identification      <= Identification;

            Vvdif_latch         <= Vvdif_latch;
            Sid_latch           <= Sid_latch;
            Tid_latch           <= Tid_latch;
            REN_latch           <= REN_latch;
            Utime_latch         <= Utime_latch;

            if (packet_fifo_wr_en)
                data_cnt_word   <= data_cnt_word + 1'd1;
            else
                data_cnt_word   <= 'd1;
        end
    end
end

always @(posedge pl_clk) begin
    if (pl_rst) begin
        packet_fifo_din <= 'd0;
    end
    else begin
        if (packet_fifo_wr_en)
            packet_fifo_din <= pl_din;
        else
            packet_fifo_din <= 'd0;
    end
end

/*CDC PL Clock to Ethernet Clock*/
reg             tx_packet_end_toggle_reg0;
reg             tx_packet_end_toggle_reg1;
wire            tx_packet_end_toggle;
reg     [2:0]   tx_packet_end_toggle_Ethernet_domain;

assign tx_packet_end_toggle = tx_packet_end_toggle_reg1 | tx_packet_end_toggle_reg0;
assign frame_coming         = tx_packet_end_toggle_Ethernet_domain[2] ^ tx_packet_end_toggle_Ethernet_domain[1];

always @(posedge pl_clk) begin
    if (pl_rst) begin
        tx_packet_end_toggle_reg0 <= 'd0;
        tx_packet_end_toggle_reg1 <= 'd0;
    end
    else begin
        if (tx_packet_end) begin
            tx_packet_end_toggle_reg0 <= !tx_packet_end_toggle_reg0;
            tx_packet_end_toggle_reg1 <= tx_packet_end_toggle_reg0;
        end
        else begin
            tx_packet_end_toggle_reg0 <= tx_packet_end_toggle_reg0;
            tx_packet_end_toggle_reg1 <= tx_packet_end_toggle_reg0;
        end
    end
end

always @(posedge Ethernet_clk) begin
    tx_packet_end_toggle_Ethernet_domain <= {tx_packet_end_toggle_Ethernet_domain[1:0], tx_packet_end_toggle};
end

reg     [15:0]  ip_header_checksum;
reg     [19:0]  ip_header_checksum_tmp0;
reg     [16:0]  ip_header_checksum_tmp1;
wire    [15:0]  udp_length;
wire    [15:0]  ip_length;


assign udp_length   = 16'd8232;
assign ip_length    = 16'd8252;

always @(posedge pl_clk) begin
    if (pl_rst) begin
        ip_header_checksum      <= 16'd0;
        ip_header_checksum_tmp0 <= 20'd0;
        ip_header_checksum_tmp1 <= 17'd0;
    end
    else begin
        ip_header_checksum_tmp0 <=  {4'b0, 16'h4500} +
                                    {4'b0, ip_length} +
                                    {4'b0, Identification} +
                                    {4'b0, 16'h4000} + 
                                    {4'b0, 8'd255, 8'h11} +
                                    {4'b0, local_ip_latch[31:16]} + 
                                    {4'b0, local_ip_latch[15:0]} +
                                    {4'b0, dest_ip_latch[31:16]} +
                                    {4'b0, dest_ip_latch[15:0]};
        ip_header_checksum_tmp1 <=  {1'b0, ip_header_checksum_tmp0[15:0]} +
                                    {13'b0, ip_header_checksum_tmp0[19:16]};
        ip_header_checksum      <=  ~(ip_header_checksum_tmp1[15:0] + {15'b0, ip_header_checksum_tmp1[16]});                                   
    end
end

assign ctrl_fifo_din[119:0]   = {Identification, 8'd255, dest_ip_latch, dest_port_latch, dest_mac_latch};
assign ctrl_fifo_din[223:120] = {local_port_latch, local_ip_latch, local_mac_latch, 8'd1};
assign ctrl_fifo_din[239:224] = ip_header_checksum;
assign ctrl_fifo_din[360:240] = {Utime_latch, Tid_latch, Sid_latch, Vvdif_latch, FrameNum, RENS_latch, REN_latch};
assign ctrl_fifo_wr_en        = pl_tx_en_latch & (data_cnt_word == 'd100) & (!ctrl_fifo_almost_full) & (!ctrl_fifo_full);
endmodule
        
