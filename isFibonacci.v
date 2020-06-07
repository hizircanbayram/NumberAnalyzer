module isFibonacci(
	output reg result,
	output reg[3:0] stuckState,
	//output reg counter,
	input wire clock,
	input wire reset,
	input wire go_i,
	input wire[31:0] number
);

localparam STATE_Initial = 4'd0,
			  STATE_1 = 4'd1,
			  STATE_2 = 4'd2,
			  STATE_3 = 4'd3,
			  STATE_4 = 4'd4,
			  STATE_5 = 4'd5,
			  STATE_6 = 4'd6,
			  STATE_7 = 4'd7,
			  STATE_8 = 4'd8;
			  
reg[3:0] currentState;
reg[3:0] nextState;
reg[31:0] fib1;
reg[31:0] fib2;
reg[31:0] res;

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
			fib1 = -1;
			fib2 = 1;
			res = 0;
			nextState = STATE_2;
		end
		STATE_2: begin
			nextState = STATE_3;
			//nextState = STATE_Initial;
		end
		STATE_3: begin
			res = fib1 + fib2;
			nextState = STATE_4;
			//nextState = STATE_Initial;
		end
		STATE_4: begin
			fib1 = fib2;
			nextState = STATE_5;
			//nextState = STATE_Initial;
		end
		STATE_5: begin
			fib2 = res;
			nextState = STATE_6;
			//nextState = STATE_Initial;
		end
		STATE_6: begin
			if (res == number)
				nextState = STATE_7;
			else if (res > number)
				nextState = STATE_8;
			else
				nextState = STATE_2;
		end
		STATE_7: begin
			result = 1'b1;
			nextState = STATE_Initial;
		end
		STATE_8: begin
			result = 1'b0;
			nextState = STATE_Initial;
		end
	endcase
end
endmodule

			