`timescale 1ns / 1ps

module ethernet_UDPIP(
    /*Ctrl Fifo Interface*/
    input   wire    [360:0] ctrl_fifo_dout,
    input   wire            ctrl_fifo_empty,
    output  reg             ctrl_fifo_rd_en,

    /*Data Fifo Interface*/
    input   wire            data_fifo_empty,
    output  reg             data_fifo_rd_en,
    input   wire    [63:0]  data_fifo_dout,

    input   wire            pl_rst,

    /*Ethernet Interface*/
    input   wire            Ethernet_clk,
    input   wire            Ethernet_rst,
    input   wire            frame_coming,
    input   wire            mac_ack,
    output  reg     [63:0]  UDP_IP_dout,
    output  reg             UDP_IP_start,
    output  wire            UDP_IP_ready,
    output  reg             UDP_IP_end
);

/*Ctrl Information Get*/
reg     [15:0]  local_port;
reg     [31:0]  local_ip;
reg     [47:0]  local_mac;
reg     [15:0]  Identification;
reg     [7:0]   ttl;
reg     [31:0]  dest_ip;
reg     [15:0]  dest_port;
reg     [47:0]  dest_mac;
wire    [15:0]  udp_length;
wire    [15:0]  ip_length;
reg     [15:0]  ip_header_checksum;

reg     [5:0]   REN;
reg     [29:0]  RENS;
reg     [23:0]  FrameNum;
reg     [2:0]   Vvdif;
reg     [15:0]  Sid;
reg     [9:0]   Tid;
reg     [31:0]  Utime;

always @(posedge Ethernet_clk) begin
    if (Ethernet_rst || pl_rst) begin
        local_port          <= 'd0;
        local_ip            <= 'd0;
        local_mac           <= 'd0;
        Identification      <= 'd0;
        ttl                 <= 'd0;
        dest_ip             <= 'd0;
        dest_port           <= 'd0;
        dest_mac            <= 'd0;
        ip_header_checksum  <= 'd0;

        REN                 <= 'd0;
        RENS                <= 'd0;
        FrameNum            <= 'd0;
        Vvdif               <= 'd0;
        Sid                 <= 'd0;
        Tid                 <= 'd0;
        Utime               <= 'd0;
    end
    else begin
        if (!ctrl_fifo_rd_en)
        begin
            local_port          <= local_port;
            local_ip            <= local_ip;
            local_mac           <= local_mac;
            Identification      <= Identification;
            ttl                 <= ttl;
            dest_ip             <= dest_ip;
            dest_port           <= dest_port;
            dest_mac            <= dest_mac;
            ip_header_checksum  <= ip_header_checksum;

            REN                 <= REN;
            RENS                <= RENS;
            FrameNum            <= FrameNum;
            Vvdif               <= Vvdif;
            Sid                 <= Sid;
            Tid                 <= Tid;
            Utime               <= Utime;
        end
        else begin 
            local_port          <= ctrl_fifo_dout[223:208];
            local_ip            <= ctrl_fifo_dout[207:176];
            local_mac           <= ctrl_fifo_dout[175:128];
            Identification      <= ctrl_fifo_dout[119:104];
            ttl                 <= ctrl_fifo_dout[103:96];
            dest_ip             <= ctrl_fifo_dout[95:64];
            dest_port           <= ctrl_fifo_dout[63:48];
            dest_mac            <= ctrl_fifo_dout[47:0];
            ip_header_checksum  <= ctrl_fifo_dout[239:224];

            REN                 <= ctrl_fifo_dout[245:240];
            RENS                <= ctrl_fifo_dout[275:246];
            FrameNum            <= ctrl_fifo_dout[299:276];
            Vvdif               <= ctrl_fifo_dout[302:300];
            Sid                 <= ctrl_fifo_dout[318:303];
            Tid                 <= ctrl_fifo_dout[328:319];
            Utime               <= ctrl_fifo_dout[360:329];
        end
    end
end

assign udp_length   = 16'd8232;
assign ip_length    = 16'd8252;

/*Ethernet_UDP_IP_ready Generate*/
reg     Ethernet_rst_reg;
reg     UDP_IP_start_reg;
wire    UDP_IP_start_toggle;

always @(posedge Ethernet_clk) begin
    UDP_IP_start_reg <= UDP_IP_start;
end

assign UDP_IP_start_toggle = UDP_IP_start & (!UDP_IP_start_reg);

assign UDP_IP_ready = !(Ethernet_rst_reg | pl_rst);

always @(posedge Ethernet_clk) begin
    Ethernet_rst_reg <= Ethernet_rst;
end

/*Frames Counter*/
reg     [7:0]   frame_counter;

always @(posedge Ethernet_clk) begin
    if (Ethernet_rst || pl_rst) begin
        frame_counter <= 8'd0;
    end
    else begin
        case({frame_coming, UDP_IP_start_toggle})
            2'b00: frame_counter <= frame_counter;
            2'b01: frame_counter <= frame_counter - 1'd1;
            2'b10: frame_counter <= frame_counter + 1'd1;
            2'b11: frame_counter <= frame_counter;
        endcase
    end
end
 
/*Send FSM*/
localparam  S_IDLE              = 4'b0000,
            S_PREPARE           = 4'b0001,
            S_SEND_HDR_1        = 4'b0011,
            S_SEND_HDR_2        = 4'b0010,
            S_SEND_HDR_3        = 4'b0110,
            S_SEND_HDR_4        = 4'b0111,
            S_SEND_HDR_5        = 4'b0101,
            S_SEND_HDR_6_U1     = 4'b0100,
            S_SEND_U1_U2        = 4'b1100,
            S_SEND_U2_U3        = 4'b1110,
            S_SEND_U3_U4        = 4'b1111,
            S_SEND_U4_DATA      = 4'b1101,
            S_SEND_DATA         = 4'b1001,
            S_SEND_LAST         = 4'b1011;

reg [4:0]       CS,
                NS;
reg [10:0]      data_cnt_Dword;    
reg [15:0]      data_reg;        

always @(posedge Ethernet_clk) begin
    if (Ethernet_rst || pl_rst) begin
        CS <= S_IDLE;
    end
    else begin
        CS <= NS;                                  
    end
end      

always @(posedge Ethernet_clk) begin
    if (Ethernet_rst || pl_rst) begin
        data_reg <= 16'd0;
    end
    else begin
        data_reg <= data_fifo_dout[31:16];                              
    end
end      

always @(*) begin
    NS = 3'bxxx;
    case (CS)
        S_IDLE:
        begin
            if ((!ctrl_fifo_empty) && (!data_fifo_empty) && (frame_counter != 0))
                NS = S_PREPARE;
            else
                NS = S_IDLE;
        end

        S_PREPARE:
        begin
            NS = S_SEND_HDR_1;
        end

        S_SEND_HDR_1:
        begin
            if (mac_ack)
                NS  =   S_SEND_HDR_2;
            else
                NS  =   S_SEND_HDR_1;
        end

        S_SEND_HDR_2:
        begin
            NS = S_SEND_HDR_3;
        end

        S_SEND_HDR_3:
        begin
            NS = S_SEND_HDR_4;
        end

        S_SEND_HDR_4:
        begin
            NS = S_SEND_HDR_5;
        end

        S_SEND_HDR_5:
        begin
            NS = S_SEND_HDR_6_U1;
        end

        S_SEND_HDR_6_U1:
        begin
            NS = S_SEND_U1_U2;
        end

        S_SEND_U1_U2:
        begin
            NS = S_SEND_U2_U3;
        end

        S_SEND_U2_U3:
        begin
            NS = S_SEND_U3_U4;
        end

        S_SEND_U3_U4:
        begin
            NS = S_SEND_U4_DATA;
        end

        S_SEND_U4_DATA:
        begin
            NS = S_SEND_DATA;
        end

        S_SEND_DATA:
        begin
            if (data_cnt_Dword == 11'd1023)
                NS = S_SEND_LAST;
            else 
                NS = S_SEND_DATA;
        end

        S_SEND_LAST:
        begin
            NS = S_IDLE;
        end

        default:
            NS  = S_IDLE;
    endcase
    if (Ethernet_rst || pl_rst)
        NS = S_IDLE;
end 

always @(posedge Ethernet_clk) begin
    if (Ethernet_rst || pl_rst) begin
        UDP_IP_dout     <= 64'd0;
        UDP_IP_start    <= 1'd0;
        ctrl_fifo_rd_en <= 1'd0;
        data_fifo_rd_en <= 1'd0;
        data_cnt_Dword  <= 11'd0;
        UDP_IP_end      <= 1'd0;
    end
    else begin
        case(CS)
            S_IDLE:
            begin
                UDP_IP_dout     <= 64'd0;
                UDP_IP_start    <= 1'd0;
                data_fifo_rd_en <= 1'd0;
                if (NS == S_PREPARE)
                    ctrl_fifo_rd_en <= 1'd1;
                else
                    ctrl_fifo_rd_en <= 1'd0;
                data_cnt_Dword  <= 11'd0;
                UDP_IP_end <= 1'd0;
            end

            S_PREPARE:
            begin
                UDP_IP_dout     <= 64'd0;
                UDP_IP_start    <= 1'd0;
                data_fifo_rd_en <= 1'd0;
                ctrl_fifo_rd_en <= 1'd0;
                data_cnt_Dword  <= 11'd0;
                UDP_IP_end      <= 1'd0;
            end
    
            S_SEND_HDR_1:
            begin
                UDP_IP_start    <= 1'd1;
                data_fifo_rd_en <= 1'd0;
                ctrl_fifo_rd_en <= 1'd0;
                data_cnt_Dword  <= 11'd0;
                UDP_IP_dout     <= {local_mac[39:32],   local_mac[47:40],   dest_mac[7:0],  dest_mac[15:8],
                                    dest_mac[23:16],    dest_mac[31:24],    dest_mac[39:32],dest_mac[47:40]};
                UDP_IP_end      <= 1'd0;
            end
    
            S_SEND_HDR_2:
            begin
                UDP_IP_start    <= 1'd0;
                data_fifo_rd_en <= 1'd0;
                ctrl_fifo_rd_en <= 1'd0;
                UDP_IP_end      <= 1'd0;
                data_cnt_Dword  <= 11'd0;
                UDP_IP_dout     <= {8'h00,          8'h45,              8'h00,              8'h08,
                                    local_mac[7:0], local_mac[15:8],    local_mac[23:16],   local_mac[31:24]};
            end
    
            S_SEND_HDR_3:
            begin
                UDP_IP_start    <= 1'd0;
                data_fifo_rd_en <= 1'd0;
                ctrl_fifo_rd_en <= 1'd0;
                data_cnt_Dword  <= 11'd0;
                UDP_IP_end      <= 1'd0;
                UDP_IP_dout     <= {8'h11,                  ttl,                    8'h00,          8'h40,
                                    Identification[7:0],    Identification[15:8],   ip_length[7:0], ip_length[15:8]};
            end
    
            S_SEND_HDR_4:
            begin
                UDP_IP_start    <= 1'd0;
                data_fifo_rd_en <= 1'd0;
                ctrl_fifo_rd_en <= 1'd0;
                data_cnt_Dword  <= 11'd0;
                UDP_IP_end      <= 1'd0;
                UDP_IP_dout     <= {dest_ip[23:16], dest_ip[31:24], local_ip[7:0],          local_ip[15:8],
                                    local_ip[23:16],local_ip[31:24],ip_header_checksum[7:0],ip_header_checksum[15:8]};
            end
    
            S_SEND_HDR_5:
            begin
                UDP_IP_start    <= 1'd0;
                data_fifo_rd_en <= 1'd0;
                ctrl_fifo_rd_en <= 1'd0;
                data_cnt_Dword  <= 11'd0;
                UDP_IP_end      <= 1'd0;
                UDP_IP_dout     <= {udp_length[7:0],    udp_length[15:8],   dest_port[7:0], dest_port[15:8],
                                    local_port[7:0],    local_port[15:8],   dest_ip[7:0],   dest_ip[15:8]};
            end

            S_SEND_HDR_6_U1:
            begin
                UDP_IP_start    <= 1'd0;
                data_fifo_rd_en <= 1'd0;
                ctrl_fifo_rd_en <= 1'd0;
                data_cnt_Dword  <= 11'd0;
                UDP_IP_end      <= 1'd0;
                UDP_IP_dout     <= {FrameNum[15:8], FrameNum[7:0],  {2'd0,RENS[29:24]}, RENS[23:16],
                                    RENS[15:8],     RENS[7:0],      8'h00,              8'h00};
            end

            S_SEND_U1_U2:
            begin
                UDP_IP_start    <= 1'd0;
                data_fifo_rd_en <= 1'd0;
                ctrl_fifo_rd_en <= 1'd0;
                data_cnt_Dword  <= 11'd0;
                UDP_IP_end      <= 1'd0;
                UDP_IP_dout     <= {Sid[15:8],  Sid[7:0],   {Vvdif,5'd0},   8'h00,
                                    8'h04,      8'h04,      {2'd0, REN},    FrameNum[23:16]};
            end
    
            S_SEND_U2_U3:
            begin
                UDP_IP_start    <= 1'd0;
                data_fifo_rd_en <= 1'd0;
                ctrl_fifo_rd_en <= 1'd0;
                data_cnt_Dword  <= 11'd0;
                UDP_IP_end      <= 1'd0;
                UDP_IP_dout     <= {8'h00,    8'h00,   8'h00,               8'h00,
                                    8'h00,    8'h00,   {6'h3f,Tid[9:8]},    Tid[7:0]};
            end
    
            S_SEND_U3_U4:
            begin
                UDP_IP_start    <= 1'd0;
                data_fifo_rd_en <= 1'd1;
                ctrl_fifo_rd_en <= 1'd0;
                data_cnt_Dword  <= 11'd0;
                UDP_IP_end      <= 1'd0;
                UDP_IP_dout     <= {8'h00,          8'h00,      Utime[31:24],   Utime[23:16],
                                    Utime[15:8],    Utime[7:0], 8'h03,          8'h00};
            end
    
            S_SEND_U4_DATA:
            begin
                UDP_IP_start    <= 1'd0;
                data_fifo_rd_en <= 1'd1;
                ctrl_fifo_rd_en <= 1'd0;
                UDP_IP_end      <= 1'd0;
                data_cnt_Dword  <= data_cnt_Dword + 1'b1;
                UDP_IP_dout     <= {data_fifo_dout[15:8],   data_fifo_dout[7:0],    data_fifo_dout[63:56],  data_fifo_dout[55:48],
                                    data_fifo_dout[47:40],  data_fifo_dout[39:32],  8'h00,                  8'h00};
            end
    
            S_SEND_DATA:
            begin
                UDP_IP_start    <= 1'd0;
                ctrl_fifo_rd_en <= 1'd0;
                UDP_IP_end      <= 1'd0;
                data_cnt_Dword  <= data_cnt_Dword + 1'b1;
                UDP_IP_dout     <= {data_fifo_dout[15:8],   data_fifo_dout[7:0],    data_fifo_dout[63:56],  data_fifo_dout[55:48],
                                    data_fifo_dout[47:40],  data_fifo_dout[39:32],  data_reg[15:8],         data_reg[7:0]};
                if (NS == S_SEND_LAST)
                    data_fifo_rd_en <= 1'd0;
                else
                    data_fifo_rd_en <= 1'd1;
            end

            S_SEND_LAST:
            begin
                UDP_IP_dout     <= {48'd0, data_reg[15:8], data_reg[7:0]};
                UDP_IP_start    <= 1'd0;
                ctrl_fifo_rd_en <= 1'd0;
                data_fifo_rd_en <= 1'd0;
                data_cnt_Dword  <= 10'd0;
                UDP_IP_end      <= 1'd1;
            end
        
            default:
            begin
                UDP_IP_dout     <= 64'd0;
                UDP_IP_start    <= 1'd0;
                ctrl_fifo_rd_en <= 1'd0;
                data_fifo_rd_en <= 1'd0;
                data_cnt_Dword  <= 10'd0;
                UDP_IP_end      <= 1'd0;
            end
        endcase
    end
end

endmodule

