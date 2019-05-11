`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:29:57 04/24/2019 
// Design Name: 
// Module Name:    multitest 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module multitest(
    input [3:0] A,
    input [3:0] B,
    output [7:0] C,
    output signed [7:0] Cs
    );
	 
	 wire signed [3:0]As = A;
	 wire signed [3:0]Bs = B;
	 assign C = A*B;
	 assign Cs = As*Bs;

endmodule
