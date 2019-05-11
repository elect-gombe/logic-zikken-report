`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:41:59 04/24/2019 
// Design Name: 
// Module Name:    counter 
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
module counter(
    input CLK,
    output reg[3:0] D = 0
    );
	always @(posedge CLK) begin
		if(D == 4'd9) begin
			D <= 0;
		end else begin
			D <= D + 4'd1;
		end
	end
endmodule
