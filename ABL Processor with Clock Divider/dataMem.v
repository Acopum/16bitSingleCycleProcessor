module dataMem(clk,rst,DATAOP,useAddr,readReg1,dataOut);

input rst;
input DATAOP;
input [7:0] useAddr;
input [7:0] readReg1;
input clk;

output [7:0] dataOut;

reg [7:0] memory [0:255];

always @(DATAOP) begin
	if(DATAOP == 1) begin
		memory[useAddr] <= readReg1;
	end
end

assign dataOut = memory[useAddr];

endmodule