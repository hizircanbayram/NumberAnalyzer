`define CLOCK_TIME 200

module isPalindromeTestBench();
	wire result;
	wire[3:0] stuckState;
	reg clk;
	reg reset;
	reg go_i;
	reg[31:0] number;
	reg counter;
	// output wire, input reg


	initial begin
		clk <= 1'b0;
		counter <= 1'b0;
		reset <= 1'b0;
		number <= 32'b00000000000000000000000010110100;
		go_i <= 1'b1;
	end

	always #`CLOCK_TIME clk <= ~clk;
	isPalindrome ien(result, stuckState, clk, reset, go_i, number);
	// counter'in 0 lanmasi gerekiyor her turdan sonra
	
	
	
	always @(posedge clk) begin
		if ((stuckState == 4'd6 || stuckState == 4'd9) && (counter == 0))
			begin
			$display("result: %1d", result);
			counter <= counter + 1;
			go_i <= 1'b0;
			// go_i 0'a atanarak, isEvenNumber'da da state 2 ve 3'den sonra initial state'e gecmesi saglanabilir
			end		
		//$display("state: %4d, go_i : %1d, result : %1d", stuckState, go_i, result);
	end
	
endmodule