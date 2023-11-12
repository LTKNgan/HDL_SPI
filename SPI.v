`timescale 1ns/1ps
module spi(clk,select,dataInMaster,dataInSlave1,dataInSlave2,dataInSlave3,dataInSlave4,miso,mosi,MISO,outMaster,outSlave1,outSlave2,outSlave3,outSlave4);
input clk;
input [4:1] select;
inout [4:1] miso;
inout mosi;
input [7:0] dataInMaster;
input [7:0] dataInSlave1;
input [7:0] dataInSlave2;
input [7:0] dataInSlave3;
input [7:0] dataInSlave4;
output [7:0] outMaster;
output [7:0] outSlave1;
output [7:0] outSlave2;
output [7:0] outSlave3;
output [7:0] outSlave4;

input wire MISO;
assign MISO = select[4]? miso[4]: select[3]? miso[3]:select[2]?miso[2]:select[1]?miso[1]:1'bx; // Tam thoi
// MISO thay the cho miso

master Master(clk,select,dataInMaster,mosi,MISO,outMaster);
slave Slave1(clk,select[1],dataInSlave1,miso[1],mosi,outSlave1);
slave Slave2(clk,select[2],dataInSlave2,miso[2],mosi,outSlave2);
slave Slave3(clk,select[3],dataInSlave3,miso[3],mosi,outSlave3);
slave Slave4(clk,select[4],dataInSlave4,miso[4],mosi,outSlave4);

endmodule
