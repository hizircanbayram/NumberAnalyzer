module numberAnalyzer(isEven, isFibonacci, isPalindrome, stuckStateEven, stuckStateFibonacci, stuckStatePalindrome, inp, reset, go_i, clk);
	output isEven;
	output isFibonacci;
	output isPalindrome;
	output[1:0] stuckStateEven;
	output[3:0] stuckStateFibonacci;
	output[3:0] stuckStatePalindrome;
	input[31:0] inp;
	input reset;
	input go_i;
	input clk;
	wire[1:0] stuckStateEven;
	wire[3:0] stuckStateFibonacci;
	wire[3:0] stuckStatePalindrome;

	isEvenNumber ien(isEven, stuckStateEven, clk, reset, go_i, inp);
	isFibonacci  ifn(isFibonacci, stuckStateFibonacci, clk, reset, go_i, inp);
	isPalindrome ipn(isPalindrome, stuckStatePalindrome, clk, reset, go_i, inp);
		
endmodule