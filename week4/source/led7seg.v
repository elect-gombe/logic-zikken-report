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

module seg7(
	output [6:0]seg,
	input [3:0]I1,
	input [3:0]I2,
	input [3:0]I3,
	input [3:0]I4,
	output [3:0]K,
	input CLK);
	
	reg [3:0]D;
	reg [15:0] TIM;
	seg7proc u1(.I(D),.Seg(seg));
	 
	reg [1:0]cnt;
	assign K = ~(4'b1 << cnt);
	always @(posedge CLK) begin
		if(TIM == 32'd50000) begin
			cnt <= cnt + 1;
			case(cnt)
				2'd3: begin D <= I1; end
				2'd0: begin D <= I2; end
				2'd1: begin D <= I3; end
				2'd2: begin D <= I4; end
			endcase
			TIM <= 0;
		end else begin
			TIM <= TIM + 1;
		end
	end
endmodule

module counter(
	 input CLK,
	 input BTN,
    output [6:0]seg,
	 output [3:0]K
    );
	seg7 s(.seg(seg),.I1(4'd1),.I2(4'd2),.I3(4'd3),.I4(4'd4),.K(K),.CLK(CLK));
endmodule
