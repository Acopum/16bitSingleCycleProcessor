module clockDivider(clkOld, rst, clkNew);

//50MhZ board, recommend divide by 50000
//Makes 1000Hz or 1000 cycles per second

input clkOld;
input rst;

output reg clkNew;

reg [18:0] counter;

always @(posedge clkOld) begin
	if(rst) begin
		counter <= 19'd0;
		clkNew <= 1'b0;
	end

	else if(counter==19'd500000) begin
		counter <= 19'd0;
		clkNew <= ~clkNew;
	end

	else begin
		counter <= counter + 19'd1;
	end
end

endmodule