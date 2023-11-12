module master(clk,select,dataMaster,masterDataOut,masterDataIn,outWave);
input clk;
input [4:1] select;
input [7:0] dataMaster;
input masterDataIn;
output reg masterDataOut;
output reg [7:0] outWave;
//
parameter Slave1 = 4'b0001, Slave2 = 4'b0010, Slave3 = 4'b0100, Slave4 = 4'b1000;
//
reg [7:0] data;
reg en = 0;
integer count = 0;
// 
always @(dataMaster) begin // If dataMaster change the transmission will start begin
    data = dataMaster;
    count = 0;
    outWave = data;
    // select == en, it only active HIGH when only one slave in 4 slaves was selected
    case (select)
    Slave1: en = 1;
    Slave2: en = 1;
    Slave3: en = 1;
    Slave4: en = 1;
    // if number of slaves was selected >= 2, The Transmission didn't started
    default: en = 0;
    endcase
end
//
always @(posedge clk) begin
    if (en) begin
        if (count < 9) begin
            data = data << 1;
            data[0] = masterDataIn;
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
//
always @(negedge clk) begin
    if (en) begin
        masterDataOut = data[7];  
        count = count + 1;
    end
end
//
endmodule