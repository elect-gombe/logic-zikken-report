`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:19:06 04/24/2019
// Design Name:   ADDER
// Module Name:   Z:/adder/testbench.v
// Project Name:  adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ADDER
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
	reg A;
	reg B;
	reg C;

	// Outputs
	wire S;
	wire Co;

	// Instantiate the Unit Under Test (UUT)
	ADDER uut (
		.A(A), 
		.B(B), 
		.C(C), 
		.S(S), 
		.Co(Co)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		C = 0;

		// Wait 100 ns for global reset to finish
		#10;
		// Initialize Inputs
		A = 0;		B = 0;		C = 0;		#10;
		A = 1;		B = 0;		C = 0;		#10;
		A = 0;		B = 1;		C = 0;		#10;
		A = 1;		B = 1;		C = 0;		#10;
		A = 0;		B = 0;		C = 1;		#10;
		A = 1;		B = 0;		C = 1;		#10;
		A = 0;		B = 1;		C = 1;		#10;
		A = 1;		B = 1;		C = 1;		#10;
        
		// Add stimulus here

	end
      
endmodule

