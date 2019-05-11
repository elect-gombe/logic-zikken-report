`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:53:45 04/24/2019 
// Design Name: 
// Module Name:    multi 
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
module multi(
    input [3:0] A,
    input [3:0] B,
    output [7:0] C
    );

	assign C=(A&{4{B[0]}})+((A&{4{B[1]}})<<1)+((A&{4{B[2]}})<<2)+((A&{4{B[3]}})<<3);
endmodule
