`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:14:48 04/24/2019 
// Design Name: 
// Module Name:    leddim 
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
module leddim(
    input CLK,
    input BTN,
    output reg LED = 1'b0
    );
	 
	always @(posedge CLK) begin
		LED <= LED ^ BTN;
	end
endmodule
