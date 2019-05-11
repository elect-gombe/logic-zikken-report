`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:15:28 04/24/2019 
// Design Name: 
// Module Name:    seg7proc 
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
module seg7proc(
    input [2:0] I,
    output reg [6:0] Seg
    );

	always @(*) begin
		case(I)
			3'd0: begin Seg <= ~7'b0111111; end
			3'd1: begin Seg <= ~7'b0000110; end
			3'd2: begin Seg <= ~7'b1011011; end
			3'd3: begin Seg <= ~7'b1001111; end
			3'd4: begin Seg <= ~7'b1100110; end
			3'd5: begin Seg <= ~7'b1101101; end
			3'd6: begin Seg <= ~7'b1111101; end
			3'd7: begin Seg <= ~7'b0000111; end
		endcase
	end
endmodule
