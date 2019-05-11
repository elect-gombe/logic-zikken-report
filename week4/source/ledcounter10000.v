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
	 
	 reg [3:0]D1=3'd0;
	 reg [3:0]D2=3'd0;
	 reg [3:0]D3=3'd0;
	 reg [3:0]D4=3'd0;
	 reg [15:0]TIM=15'd0;
	 reg pv;
	 
	seg7 s(.seg(seg),.I1(D4),.I2(D3),.I3(D2),.I4(D1),.K(K),.CLK(CLK));
	
	always @(posedge CLK) begin
		if(TIM == 32'd50000) begin
			if(pv==0&&BTN==1) begin
				if(D1 != 9)begin		D1 <= D1 + 1; end
				else begin 
					D1 <= 0;
					if(D2 != 9)begin D2 <= D2 + 1;end
					else begin
						D2 <= 0;
						if(D3 != 9)begin D3 <= D3 + 1;end
						else begin
							D3 <= 0;
							if(D4 != 9) begin D4 <= D4 + 1;end
							else begin D4 <= 0;end
						end
					end
				end
			end
			pv <= BTN;
		end else begin
			TIM <= TIM + 1;
		end
	end 
endmodule
