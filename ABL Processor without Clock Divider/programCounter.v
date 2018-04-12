module programCounter(clk,rst,effAddr,currAddr);

input [7:0] effAddr;
input clk;
input rst;

output reg [7:0] currAddr;

always @ (posedge clk) begin
	if(rst) begin
		currAddr = 0;
	end
	else begin
		currAddr=effAddr;
	end
end
endmodule