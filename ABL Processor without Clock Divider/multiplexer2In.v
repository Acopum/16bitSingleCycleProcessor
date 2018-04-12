module multiplexer2In(resultData,resultALU,select,dataOut);

input [7:0] resultData;
input [7:0] resultALU;
input select;

output reg [7:0] dataOut;

always @(*) begin
	case(select)
		1'b0: dataOut = resultData;
		1'b1: dataOut = resultALU;
	endcase
end

endmodule