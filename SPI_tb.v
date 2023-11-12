`timescale 1ns/1ps
module spi_tb();
reg clk;
reg [4:1] select;
wire [4:1] miso;
wire mosi;
wire MISO;
reg [7:0] dataInMaster;
reg [7:0] dataInSlave1;
reg [7:0] dataInSlave2;
reg [7:0] dataInSlave3;
reg [7:0] dataInSlave4;
wire [7:0] outMaster;
wire [7:0] outSlave1;
wire [7:0] outSlave2;
wire [7:0] outSlave3;
wire [7:0] outSlave4;

spi SPI4Slave(clk,select,dataInMaster,dataInSlave1,dataInSlave2,dataInSlave3,dataInSlave4,miso,mosi,MISO,outMaster,outSlave1,outSlave2,outSlave3,outSlave4);


initial begin
    // 8 clock cycle complete transmission (1 clk cycle = 20ns  => 160ns)
    select <= 4'b0010; // Slave2
    dataInMaster <= 8'b11110000;
    dataInSlave1 <= 8'b00000000;
    dataInSlave2 <= 8'b00001111;
    dataInSlave3 <= 8'b00000000;
    dataInSlave4 <= 8'b00000000;
    #180;
    select <= 4'b1000; // Slave4
    dataInMaster <= 8'b00000000;
    dataInSlave1 <= 8'b00000000;
    dataInSlave2 <= 8'b00000000;
    dataInSlave3 <= 8'b00000000;
    dataInSlave4 <= 8'b11111111;
    #180;
    select<=4'b0001; // Slave1
    dataInMaster <= 8'b11111111;
    dataInSlave1 <= 8'b00000000;
    dataInSlave2 <= 8'b00000000;
    dataInSlave3 <= 8'b00000000;
    dataInSlave4 <= 8'b01100110;
end

initial begin // generate clk
    clk = 1;
    forever #10 clk = ~clk;
end
endmodule