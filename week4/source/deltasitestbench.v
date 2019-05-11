`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:10:33 04/29/2019
// Design Name:   deltashigma
// Module Name:   /home/gombe/workspace/verilogtest/deltatest/testbench.v
// Project Name:  deltatest
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: deltashigma
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testbench;

	// Inputs
	reg CLK;

	// Outputs
	wire Out;
	// Instantiate the Unit Under Test (UUT)
	
	testpattern tst (
		.CLK(CLK),
		.pattern(2'b10),
		.out(Out)
		);

	always begin
		#1
		CLK = 1;
		#1
		CLK = 0;
	end
	
	initial begin
		// Initialize Inputs
		CLK = 0;

		// Wait 100 ns for global reset to finish
		#50;
		#10000000

		$finish;
        
		// Add stimulus here

	end
      
endmodule

