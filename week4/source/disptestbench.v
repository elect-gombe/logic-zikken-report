`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:23:53 05/05/2019
// Design Name:   counter
// Module Name:   /home/gombe/workspace/verilogtest/counter10000/countertestbench.v
// Project Name:  counter10000
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module countertestbench;

	// Inputs
	reg clk;
	reg [13:0]num;

	// Outputs
	wire [3:0] I4;
	wire [3:0] I3;
	wire [3:0] I2;
	wire [3:0] I1;

	// Instantiate the Unit Under Test (UUT)
	disp7seg uut (
		.clk(clk), 
		.I4(I4),
		.I3(I3),
		.I2(I2),
		.I1(I1),
		.num(num)
	);
	
	always begin
		clk = 1;
		#1;
		clk = 0;
		#1;
	end

	initial begin
		num <= 1;
		#32
		num <= 21;
		#32
		num <= 9999;
		#32
		num <= 1234;
		#32
		$finish;
	end
      
endmodule

