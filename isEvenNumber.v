module isEvenNumber(
	output reg result,
	output reg[1:0] stuckState,
	//output reg counter,
	input wire clock,
	input wire reset,
	input wire go_i,
	input wire[31:0] number
);

localparam STATE_Initial = 2'd0,
			  STATE_1 = 2'd1,
			  STATE_2 = 2'd2,
			  STATE_3 = 2'd3;
			  
reg[1:0] currentState;
reg[1:0] nextState;


always @ (posedge clock) begin
	if (reset)
		currentState <= STATE_Initial;
	else
		currentState <= nextState;
end

initial begin
	currentState <= STATE_Initial;
end



always @ (*) begin
	nextState = currentState;
	stuckState = currentState;
	case (currentState)
		STATE_Initial: begin
			if (go_i)
				nextState = STATE_1;
		end
		STATE_1: begin
			result = 1'b0;
			if (number % 2 == 0) 
				nextState = STATE_2;
			else
				nextState = STATE_3;
		end
		STATE_2: begin
			result = 1'b1;
			nextState = STATE_Initial;
		end
		STATE_3: begin
			result = 1'b0;
			nextState = STATE_Initial;
		end
	endcase
end
endmodule

			