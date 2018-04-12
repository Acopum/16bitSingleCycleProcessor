module registerMem(rst,clk,regAddr1,regAddr2,immVal,WRITEREG,REGOP,wrData,readReg1,readReg2,
						 outReg0, outReg1, outReg2, outReg3,inTerminal,outTerminal);

input [1:0] regAddr1;
input [1:0] regAddr2;
input [7:0] immVal;
input WRITEREG;
input [2:0] REGOP;
input [7:0] wrData;
input rst;
input clk;

output [7:0] readReg1;
output [7:0] readReg2;

output [7:0] outReg0;
output [7:0] outReg1;
output [7:0] outReg2;
output [7:0] outReg3;

input [7:0] inTerminal;
output reg [7:0] outTerminal;

reg [7:0] regUse[3:0];

assign readReg1 = regUse[regAddr1];
assign readReg2 = regUse[regAddr2];

assign outReg0 = regUse[0];
assign outReg1 = regUse[1];
assign outReg2 = regUse[2];
assign outReg3 = regUse[3];

always @(posedge clk) begin

	if(rst) begin
		regUse[0] <= 0;
		regUse[1] <= 0;
		regUse[2] <= 0;
		regUse[3] <= 0;
	end
	
	else begin
		
		if(WRITEREG==1) begin
			regUse[regAddr1] <= wrData;
		end
		
		if(REGOP[2] == 1) begin
			case(REGOP[1:0]) 
				2'b00://LOADIMM
						 regUse[regAddr1] <= immVal;
						
				2'b01://MOV
						 regUse[regAddr1] <= regUse[regAddr2];
						
				2'b10://OUT
						 outTerminal <= regUse[regAddr1];
						
				2'b11://IN
						 regUse[regAddr1] <= inTerminal;
			endcase
		end
	end
end

endmodule