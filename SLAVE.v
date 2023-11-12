module slave(clk,select,dataSlave,slaveDataOut,slaveDataIn,outWave);
input clk;
input select;
input [7:0] dataSlave;
input slaveDataIn;
output reg slaveDataOut;
output reg [7:0] outWave; 
//
reg [7:0] data;
integer count = 0;
//
always @(dataSlave) begin
    count = 0;
    data = dataSlave;
    outWave = data;
end
//
always @(posedge clk) begin
    if (select==1) begin
        if (count < 9) begin
        data = data << 1;
        data[0] = slaveDataIn;
        outWave = data;
        end
        else begin
           outWave = data;
        end
    end
    else begin
        outWave = data;
    end
end
always @(negedge clk) begin
    if (select==1) begin
        slaveDataOut = data[7];
        count = count + 1;
    end
    else begin
        outWave = data;
    end
end
//
endmodule