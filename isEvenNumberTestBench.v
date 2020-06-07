`define CLOCK_TIME 200

module isEvenNumberTestBench();
	wire result;
	reg[2:0] counter;
	reg clk;
	reg reset;
	reg go_i;
	reg[31:0] number;
	// output wire, input reg

	initial begin
		clk <= 1'b0;
		counter <= 3'b000;
		reset <= 1'b0;
		number <= 32'b00000000000000000000000011111011;
		go_i <= 1'b1;
	end

	always #`CLOCK_TIME clk <= ~clk;
	isEvenNumber ien(result, clk, reset, go_i, number);
	// counter'in 0 lanmasi gerekiyor her turdan sonra
	

	
	always @(posedge clk) begin
		if (counter == 3'b000)
			go_i <= 1'b1;
		else 
			go_i <= 1'b0;
		if (counter == 3'b011)
			begin
			$display("result: %1d", result);
			end
		if (counter <= 3'b100)
			counter <= counter + 1;		
	end
	
endmodule