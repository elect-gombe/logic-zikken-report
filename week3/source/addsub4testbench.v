`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:46:17 04/24/2019
// Design Name:   ADDER4
// Module Name:   Z:/adder4/testbench.v
// Project Name:  adder4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ADDER4
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
	reg [3:0] A;
	reg [3:0] B;
	reg SIG;

	// Outputs
	wire [3:0] S;
	wire C;

	// Instantiate the Unit Under Test (UUT)
	ADDER4 uut (
		.A(A), 
		.B(B), 
		.SIG(SIG), 
		.S(S), 
		.C(C)
	);
	integer J;
	integer K;
	integer SI;

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		SIG = 0;

		// Wait 100 ns for global reset to finish
		#10;
		for(SI=0; SI<2; SI=SI+1) begin		// 0 ‚©‚ç 15 ‚Ü‚Å‚ð“ü—Í
			for(J=0; J<16; J=J+1) begin		// 0 ‚©‚ç 15 ‚Ü‚Å‚ð“ü—Í
				for(K=0; K<16; K=K+1) begin		// 0 ‚©‚ç 15 ‚Ü‚Å‚ð“ü—Í
					A=K;
					B=J;
					SIG = SI;
					#3;
				end
			end
		end
		// Add stimulus here

	end
      
endmodule

