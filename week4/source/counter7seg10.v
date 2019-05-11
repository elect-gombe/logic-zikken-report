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
    input [3:0] I,
    output reg [6:0] Seg
    );

	always @(*) begin
		case(I)
			4'd0: begin Seg <= ~7'b0111111; end
			4'd1: begin Seg <= ~7'b0000110; end
			4'd2: begin Seg <= ~7'b1011011; end
			4'd3: begin Seg <= ~7'b1001111; end
			4'd4: begin Seg <= ~7'b1100110; end
			4'd5: begin Seg <= ~7'b1101101; end
			4'd6: begin Seg <= ~7'b1111101; end
			4'd7: begin Seg <= ~7'b0000111; end
			4'd8: begin Seg <= ~7'b1111111; end
			4'd9: begin Seg <= ~7'b1101111; end
		endcase
	end
endmodule

module counter(
    input BTN,
	 input CLK,
    output [6:0]seg,
	 output [3:0]K
    );
	 reg[32:0] TIM = 0;
	 reg pv;
	 reg [3:0]D;
	 
	 seg7proc u1(.I(D),.Seg(seg));
	 
	 assign K=4'b0111;
	 
	 always @(posedge CLK) begin
		if(TIM == 32'd250000) begin
			TIM <= 0;
			if(pv == 0 && BTN != pv) begin
				if(D != 9)begin
					D <= D + 1;
				end else begin
					D <= 0;
				end
			end
			pv <= BTN;
		end else begin
			TIM <= TIM + 32'd1;
		end
	end
endmodule
