`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:32:09 04/26/2019 
// Design Name: 
// Module Name:    ledblink 
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
module ledblink(
    input CLK,
    output reg LED=1'b0
    );
	 
	 reg [25:0]TIM;
	 always @(posedge CLK) begin
		if(TIM == 26'd25000000) begin
			TIM <= 0;
			LED <= ~LED;
		end else begin
			TIM <= TIM + 26'd1;
		end
	end
endmodule
