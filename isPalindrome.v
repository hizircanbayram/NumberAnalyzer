module isPalindrome(
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
			  STATE_8 = 4'd8,	
			  STATE_9 = 4'd9;
			  
reg[3:0] currentState;
reg[3:0] nextState;
reg[31:0] divisor;
reg[31:0] leading;
reg[31:0] trailing;
reg[31:0] number_reg;

always @ (posedge clock) begin
	if (reset)
		currentState <= STATE_Initial;
	else
		currentState <= nextState;
end

initial begin
	//number_reg <= number;
	currentState <= STATE_Initial;
end



always @ (*) begin
	nextState = currentState;
	stuckState = currentState;
	case (currentState)
		STATE_Initial: begin
			if (go_i) begin
				number_reg = number;
				nextState = STATE_1;		
			end
		end
		STATE_1: begin
			divisor = 1;
			nextState = STATE_2;
		end
		STATE_2: begin
			if (number_reg / divisor >= 10)
				nextState = STATE_3;
			else
				nextState = STATE_4;
		end
		STATE_3: begin
			divisor = divisor * 10;
			nextState = STATE_2;
		end
		STATE_4: begin
			if (number_reg != 0)
				nextState = STATE_5;
			else
				nextState = STATE_9;
		end
		STATE_5: begin
			leading = number_reg / divisor;
			trailing = number_reg % 10;
			if (leading != trailing)
				nextState = STATE_6;
			else
				nextState = STATE_7;
		end
		STATE_6: begin
			result = 0;
			nextState = STATE_Initial;
		end
		STATE_7: begin
			number_reg = (number_reg % divisor) / 10;
			nextState = STATE_8;
		end
		STATE_8: begin
			divisor = divisor / 100;
			nextState = STATE_4;
		end
		STATE_9: begin
			result = 1;
			nextState = STATE_Initial;
		end
	endcase
end
endmodule

			