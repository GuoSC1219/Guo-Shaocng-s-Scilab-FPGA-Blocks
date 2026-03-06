`timescale 1ns / 1ps


module circular_shift(
    input   wire            clk,
    input   wire            rst,

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
    input   wire    [31:0]  Din16,
    input   wire    [31:0]  Din17,
    input   wire    [31:0]  Din18,
    input   wire    [31:0]  Din19,
    input   wire    [31:0]  Din20,
    input   wire    [31:0]  Din21,
    input   wire    [31:0]  Din22,
    input   wire    [31:0]  Din23,
    input   wire    [31:0]  Din24,
    input   wire    [31:0]  Din25,
    input   wire    [31:0]  Din26,
    input   wire    [31:0]  Din27,
    input   wire    [31:0]  Din28,
    input   wire    [31:0]  Din29,
    input   wire    [31:0]  Din30,
    input   wire    [31:0]  Din31,


    output  reg     [31:0]  Dout00,
    output  reg     [31:0]  Dout01,
    output  reg     [31:0]  Dout02,
    output  reg     [31:0]  Dout03,
    output  reg     [31:0]  Dout04,
    output  reg     [31:0]  Dout05,
    output  reg     [31:0]  Dout06,
    output  reg     [31:0]  Dout07,
    output  reg     [31:0]  Dout08,
    output  reg     [31:0]  Dout09,
    output  reg     [31:0]  Dout10,
    output  reg     [31:0]  Dout11,
    output  reg     [31:0]  Dout12,
    output  reg     [31:0]  Dout13,
    output  reg     [31:0]  Dout14,
    output  reg     [31:0]  Dout15,
    output  reg     [31:0]  Dout16,
    output  reg     [31:0]  Dout17,
    output  reg     [31:0]  Dout18,
    output  reg     [31:0]  Dout19,
    output  reg     [31:0]  Dout20,
    output  reg     [31:0]  Dout21,
    output  reg     [31:0]  Dout22,
    output  reg     [31:0]  Dout23,
    output  reg     [31:0]  Dout24,
    output  reg     [31:0]  Dout25,
    output  reg     [31:0]  Dout26,
    output  reg     [31:0]  Dout27,
    output  reg     [31:0]  Dout28,
    output  reg     [31:0]  Dout29,
    output  reg     [31:0]  Dout30,
    output  reg     [31:0]  Dout31
);

reg [1:0]   counter;

always @(posedge clk) begin
    if (rst) begin
        counter <= 'd0;
    end
    else begin
        counter <= counter + 1'd1;
    end
end

always @(posedge clk) begin
    case (counter)
        0:
        begin
            Dout00 <= Din00;
            Dout01 <= Din01;
            Dout02 <= Din02;
            Dout03 <= Din03;
            Dout04 <= Din04;
            Dout05 <= Din05;
            Dout06 <= Din06;
            Dout07 <= Din07;
            Dout08 <= Din08;
            Dout09 <= Din09;
            Dout10 <= Din10;
            Dout11 <= Din11;
            Dout12 <= Din12;
            Dout13 <= Din13;
            Dout14 <= Din14;
            Dout15 <= Din15;
            Dout16 <= Din16;
            Dout17 <= Din17;
            Dout18 <= Din18;
            Dout19 <= Din19;
            Dout20 <= Din20;
            Dout21 <= Din21;
            Dout22 <= Din22;
            Dout23 <= Din23;
            Dout24 <= Din24;
            Dout25 <= Din25;
            Dout26 <= Din26;
            Dout27 <= Din27;
            Dout28 <= Din28;
            Dout29 <= Din29;
            Dout30 <= Din30;
            Dout31 <= Din31;
        end

        3:
        begin
            Dout00 <= Din08;
            Dout01 <= Din09;
            Dout02 <= Din10;
            Dout03 <= Din11;
            Dout04 <= Din12;
            Dout05 <= Din13;
            Dout06 <= Din14;
            Dout07 <= Din15;
            Dout08 <= Din16;
            Dout09 <= Din17;
            Dout10 <= Din18;
            Dout11 <= Din19;
            Dout12 <= Din20;
            Dout13 <= Din21;
            Dout14 <= Din22;
            Dout15 <= Din23;
            Dout16 <= Din24;
            Dout17 <= Din25;
            Dout18 <= Din26;
            Dout19 <= Din27;
            Dout20 <= Din28;
            Dout21 <= Din29;
            Dout22 <= Din30;
            Dout23 <= Din31;
            Dout24 <= Din00;
            Dout25 <= Din01;
            Dout26 <= Din02;
            Dout27 <= Din03;
            Dout28 <= Din04;
            Dout29 <= Din05;
            Dout30 <= Din06;
            Dout31 <= Din07;
        end

        2:
        begin
            Dout00 <= Din16;
            Dout01 <= Din17;
            Dout02 <= Din18;
            Dout03 <= Din19;
            Dout04 <= Din20;
            Dout05 <= Din21;
            Dout06 <= Din22;
            Dout07 <= Din23;
            Dout08 <= Din24;
            Dout09 <= Din25;
            Dout10 <= Din26;
            Dout11 <= Din27;
            Dout12 <= Din28;
            Dout13 <= Din29;
            Dout14 <= Din30;
            Dout15 <= Din31;
            Dout16 <= Din00;
            Dout17 <= Din01;
            Dout18 <= Din02;
            Dout19 <= Din03;
            Dout20 <= Din04;
            Dout21 <= Din05;
            Dout22 <= Din06;
            Dout23 <= Din07;
            Dout24 <= Din08;
            Dout25 <= Din09;
            Dout26 <= Din10;
            Dout27 <= Din11;
            Dout28 <= Din12;
            Dout29 <= Din13;
            Dout30 <= Din14;
            Dout31 <= Din15;
        end

        1:
        begin
            Dout00 <= Din24;
            Dout01 <= Din25;
            Dout02 <= Din26;
            Dout03 <= Din27;
            Dout04 <= Din28;
            Dout05 <= Din29;
            Dout06 <= Din30;
            Dout07 <= Din31;
            Dout08 <= Din00;
            Dout09 <= Din01;
            Dout10 <= Din02;
            Dout11 <= Din03;
            Dout12 <= Din04;
            Dout13 <= Din05;
            Dout14 <= Din06;
            Dout15 <= Din07;
            Dout16 <= Din08;
            Dout17 <= Din09;
            Dout18 <= Din10;
            Dout19 <= Din11;
            Dout20 <= Din12;
            Dout21 <= Din13;
            Dout22 <= Din14;
            Dout23 <= Din15;
            Dout24 <= Din16;
            Dout25 <= Din17;
            Dout26 <= Din18;
            Dout27 <= Din19;
            Dout28 <= Din20;
            Dout29 <= Din21;
            Dout30 <= Din22;
            Dout31 <= Din23;           
        end

        default:
        begin
            Dout00 <= Din00;
            Dout01 <= Din01;
            Dout02 <= Din02;
            Dout03 <= Din03;
            Dout04 <= Din04;
            Dout05 <= Din05;
            Dout06 <= Din06;
            Dout07 <= Din07;
            Dout08 <= Din08;
            Dout09 <= Din09;
            Dout10 <= Din10;
            Dout11 <= Din11;
            Dout12 <= Din12;
            Dout13 <= Din13;
            Dout14 <= Din14;
            Dout15 <= Din15;
            Dout16 <= Din16;
            Dout17 <= Din17;
            Dout18 <= Din18;
            Dout19 <= Din19;
            Dout20 <= Din20;
            Dout21 <= Din21;
            Dout22 <= Din22;
            Dout23 <= Din23;
            Dout24 <= Din24;
            Dout25 <= Din25;
            Dout26 <= Din26;
            Dout27 <= Din27;
            Dout28 <= Din28;
            Dout29 <= Din29;
            Dout30 <= Din30;
            Dout31 <= Din31;
        end
    endcase
end
endmodule
