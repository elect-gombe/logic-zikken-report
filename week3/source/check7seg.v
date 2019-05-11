`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:57:31 04/24/2019 
// Design Name: 
// Module Name:    check7seg 
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
module check7seg(
    input [7:0] A,
    input [3:0] B,
    output [7:0] C,
    output [3:0] D
    );

	assign C=A;
	assign D=B;

endmodule
