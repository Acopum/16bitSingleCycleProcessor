module instructionMem(clk,currAddr,inst);

input clk;
input [7:0] currAddr;

output reg [15:0] inst;
/*
wire [7:0] instUP;
wire [7:0] instDN;

ROM getInstructionUP(
.address(currAddr),
.clock(clk),
.q(instUP)
);

ROM getInstructionDN(
.address(currAddr+8'b00000001),
.clock(clk),
.q(instDN)
);

assign inst = {instUP, instDN};

 
*/
///*
//corrected instruction 8'd44 to be BRN
always @ (negedge clk) begin
	case(currAddr) 
		8'd0:inst=16'b0000000000000000;
		8'd2:inst=16'b0000000000000000;
		8'd4:inst=16'b0111000000000000;
		8'd6:inst=16'b1110000011111111;
		8'd8:inst=16'b1111000000000111;
		8'd10:inst=16'b1110000000011111;
		8'd12:inst=16'b1111000011111111;
		8'd14:inst=16'b1111010011111111;
		8'd16:inst=16'b0101000000000000;
		8'd18:inst=16'b0100010000000000;
		8'd20:inst=16'b1000110000000000;
		8'd22:inst=16'b1101000011111111;
		8'd24:inst=16'b0101000000000000;
		8'd26:inst=16'b1110000011111111;
		8'd28:inst=16'b1000001100000000;
		8'd30:inst=16'b1010000000100100;
		8'd32:inst=16'b0001000100000000;
		8'd34:inst=16'b1001000000100110;
		8'd36:inst=16'b0011000100000000;
		8'd38:inst=16'b0110000000000000;
		8'd40:inst=16'b1011000000110100;
		8'd42:inst=16'b1000001100000000;
		8'd44:inst=16'b1010110000110000;
		8'd46:inst=16'b1001000000010000;
		8'd48:inst=16'b1001000000000100;
		8'd50:inst=16'b0000000000000000;
		8'd52:inst=16'b1101000000011111;
		8'd54:inst=16'b1000100100000000;
		8'd56:inst=16'b1111010000000001;
		8'd58:inst=16'b0010000100000000;
		8'd60:inst=16'b1110000000011111;
		8'd62:inst=16'b1000011000000000;
		8'd64:inst=16'b1100000000000000;
	endcase
end
//*/

endmodule