`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:01:39 04/24/2019
// Design Name:   multi
// Module Name:   Z:/multimake/testbench.v
// Project Name:  multimake
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: multi
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testbench;
	integer J;
	integer K;
	// Inputs
	reg [3:0] A;
	reg [3:0] B;

	// Outputs
	wire [7:0] C;

	// Instantiate the Unit Under Test (UUT)
	multi uut (
		.A(A), 
		.B(B), 
		.C(C)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;

		for(J=0; J<16; J=J+1) begin		// 0 ‚©‚ç 15 ‚Ü‚Å‚ð“ü—Í
			for(K=0; K<16; K=K+1) begin		// 0 ‚©‚ç 15 ‚Ü‚Å‚ð“ü—Í
				A=K;
				B=J;
				#3;
			end
		end
	   
		// Add stimulus here

	end
      
endmodule

