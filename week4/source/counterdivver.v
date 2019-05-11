`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:23:15 05/03/2019 
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

// this module input valid in region of 0-11263
module div10(
	input [13:0]D,
	output [10:0]quotient,
	output [3:0]remainder
	);
	wire [30:0]t;
	
	assign t = D*3277; //2^12/10+1~13108, 13108>>2=3277
	assign quotient = t[28:15];
	assign remainder = ((t[14:10]+1)*5)>>4;//10=5*2
endmodule

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

module prescaler(
	input clk,
	input [22:0]div,
	output cout);
	
	reg [23:0]d;
	assign cout = d[23];
	always @(posedge clk) begin
		d = d + div;
	end
endmodule

module disp7seg(
    input clk,
	 input [13:0]num,
	 output [6:0]led7segk,
	 output reg [3:0]led7sega
    );
	reg [2:0]state=0;
	reg [13:0]r1=0;
	wire [10:0]quo;
	wire [3:0]rem;
	
   reg[3:0] I;
	
	div10 d(.D(r1),.quotient(quo),.remainder(rem));
	prescaler p(.clk(clk),.div(1000),.cout(pclk));
	seg7proc s(.I(I),.Seg(led7segk));
	
	always @(posedge pclk) begin
		if(state == 3'd0) begin //initial state
			r1 <= num;
			state <= 3'd1;
		end else if(state == 3'd1)begin
			I = rem;
			r1 <= quo;
			state <= state+1;
			led7sega <= ~(4'b1 << 3);
		end else if(state == 3'd2)begin
			I = rem;
			r1 <= quo;
			state <= state+1;
			led7sega <= ~(4'b1 << 2);
		end else if(state == 3'd3)begin
			I = rem;
			r1 <= quo;
			state <= state+1;
			led7sega <= ~(4'b1 << 1);
		end else begin
			I = rem;
			r1 <= num;
			state <= 3'd1;
			led7sega <= ~(4'b1 << 0);
		end
	end
endmodule

module counter10000(
	input CLK,
	input BTN,
	output [6:0]led7segk,
	output [3:0]led7sega);
	
	reg pbtn=0;
	reg [13:0]num=0;
	wire pclk;

	disp7seg d(.clk(CLK),.num(num),.led7sega(led7sega),.led7segk(led7segk));
	prescaler p(.clk(CLK),.div(1000),.cout(pclk));
	
	always @(posedge(pclk)) begin
		if(pbtn == 0 && BTN == 1) begin
			if(num != 9999) begin
				num <= num + 1;
			end else begin
				num <= 0;
			end
		end
		pbtn <= BTN;
	end
	
endmodule
