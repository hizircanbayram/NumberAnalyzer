`define CLOCK_TIME 200

module numberAnalyzerTestBench();
	reg[1:0] counter1;
	reg[1:0] counter2;
	reg[1:0] counter3;
	reg clk;
	reg reset;
	reg go_i;
	reg[31:0] number;
	wire isEven, isFibonacci, isPalindrome;
	wire[1:0] stuckStateEven;
	wire[3:0] stuckStateFibonacci;
	wire[3:0] stuckStatePalindrome;
	// output wire, input reg

	initial begin
		clk <= 1'b0;
		counter1 <= 2'b00;
		counter2 <= 2'b00;
		counter3 <= 2'b00;
		reset <= 1'b0;
		number <= 32'b00000000000000000000011111010010;
		go_i <= 1'b1;
	end

	
	always #`CLOCK_TIME clk <= ~clk;
	numberAnalyzer na(isEven, isFibonacci, isPalindrome, stuckStateEven, stuckStateFibonacci, stuckStatePalindrome, number, reset, go_i, clk);
	// counter'in 0 lanmasi gerekiyor her turdan sonra
	
	
	always @(posedge clk) begin
		if ((stuckStateEven == 2'd2 || stuckStateEven == 2'd3) && counter1 == 0)
			counter1 <= counter1 + 1;
		if ((stuckStateFibonacci == 4'd7 || stuckStateFibonacci == 4'd8) && counter2 == 0)
			counter2 <= counter2 + 1;
		if ((stuckStatePalindrome == 4'd6 || stuckStatePalindrome == 4'd9) && counter3 == 0)
			counter3 <= counter3 + 1;
		if ((counter1 == 1) && (counter2 == 1) && (counter3 == 1))
		begin
			if (isEven == 1)
				$display("%32d is an even number", number);
			else
				$display("%32d is an odd number", number);
			if (isFibonacci== 1)
				$display("%32d is a fibonacci number", number);
			else
				$display("%32d is not a fibonacci number", number);	
			if (isPalindrome == 1)
				$display("%32d is a palindrome number", number);
			else
				$display("%32d is not a palindrome number", number);			
			counter1 <= counter1 + 1;
			counter2 <= counter2 + 1;
			counter3 <= counter3 + 1;
			go_i <= 1'b0;
			// go_i 0'a atanarak, isEvenNumber'da da state 2 ve 3'den sonra initial state'e gecmesi saglanabilir
		end		
	end
	
endmodule