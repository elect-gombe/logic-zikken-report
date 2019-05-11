`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:04:52 04/29/2019 
// Design Name: 
// Module Name:    deltashigma 
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



module prescaler(
	input CLK,
	input [10:0]MLn,
	output Cout
	);
	reg[11:0]DA=0;
	
	assign Cout = DA[11];
	always @(posedge CLK) begin
		DA <= DA+MLn+12'd1;
	end
endmodule

module deltasigma(
    input CLK,
    input [15:0] In,
    output reg Out=0,
	 output reg [16:0]cnt = 0
    );
	 
	 wire pclk;
	 prescaler p(.CLK(CLK),.MLn(11'd500),.Cout(pclk));
	 
	 always @(posedge CLK) begin
		if(cnt[16]) begin
			cnt <= cnt-17'h10000+In;
			Out <= 1;
		end else begin
			cnt <= cnt+In;
			Out <= 0;
		end
	end
endmodule


module testpattern(
	input CLK,
	input [1:0]pattern,
	output out
	);
	wire pclk;
	reg [15:0]count=16'd0;

	deltasigma d(.CLK(CLK),.In(count),.Out(out));

	reg mode;
	prescaler p(.CLK(CLK),.MLn(/*speed,0~2047*/11'd4),.Cout(pclk));
		always @(posedge pclk) begin
		if(pattern == 2'b00) begin
			if(mode) begin
				if(count != 16'hFFFF) begin
					count <= count + 1;
				end else begin
					mode <= 0;
				end
			end else begin
				if(count != 16'h0000) begin
					count <= count - 1;
				end else begin
					mode <= 1;
				end
			end
		end else if(pattern == 2'b01) begin
			count <= 16'h0;
		end else if(pattern == 2'b10) begin
			count <= 16'h6000;
		end else if(pattern == 2'b11) begin
			count <= 16'hFFFF;
		end
	end
endmodule
