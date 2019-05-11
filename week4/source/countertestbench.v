`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:46:05 04/24/2019
// Design Name:   counter
// Module Name:   Z:/counter/testbench.v
// Project Name:  counter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: counter
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
	wire [3:0] D;

	// Instantiate the Unit Under Test (UUT)
	counter uut (
		.CLK(CLK), 
		.D(D)
	);

	always begin
		CLK = 1;
		#5
		CLK = 0;
		#5;
	end
	initial begin
		// Initialize Inputs
		CLK = 0;
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

