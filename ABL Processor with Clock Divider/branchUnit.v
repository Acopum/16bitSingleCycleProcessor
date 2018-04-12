module branchUnit(clk,rst,BROP,ZERO,NEG,brAddr,currAddr,effAddr);

input clk;
input [2:0] BROP;
input ZERO;
input NEG;
input [7:0] brAddr;
input [7:0] currAddr;
input rst;

output wire [7:0] effAddr;

reg [7:0] linkRegister;

assign effAddr = 		(rst == 1)? 8'd0: //Reset
							(BROP == 3'b000)? currAddr+8'b00000010://Regular
							(BROP == 3'b001&&ZERO==1)? brAddr: //BRZ
							(BROP == 3'b001&&ZERO==0)? currAddr+8'b00000010: //BRZ
							(BROP == 3'b010&&NEG==1)? brAddr: //BRN
							(BROP == 3'b010&&NEG==0)? currAddr+8'b00000010:	//BRN
							(BROP == 3'b011)? brAddr: //BRSUB
							(BROP == 3'b100)? brAddr: //BR
							(BROP == 3'b101)? linkRegister: //RETURN
							currAddr+8'b00000010;

initial begin
	linkRegister <= 0;
end
							
always @(posedge clk) begin

	if(BROP == 3'b011) begin
		linkRegister <= currAddr+8'b00000010;
	end
	
end

endmodule