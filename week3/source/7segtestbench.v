`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:26:11 04/24/2019
// Design Name:   seg7proc
// Module Name:   Z:/seg7proc/testbench.v
// Project Name:  seg7proc
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: seg7proc
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testbench;
	// Inputs
	reg [3:0] I;

	// Outputs
	wire [6:0] Seg;
	integer J;	// ループ変数 (for文に用いる)
	reg [8:0]Z;

	// Instantiate the Unit Under Test (UUT)
	seg7proc uut (
		.I(I), 
		.Seg(Seg)
	);

	initial begin
		for(J=0; J<16; J=J+1) begin		// 0 から 15 までを入力
			I <= J;		// ループ変数値をデコーダに与える
			Z <= 0;		// 左マージンおよび字間マージンを表示
			#22;
			
			Z <= {1'b0, {3{~Seg[5] ? 1'b0 : 1'bx}}, 1'b0,
					{3{~Seg[4] ? 1'b0 : 1'bx}}, 1'b0};	// 左縦線 (E, F) を表示
			#15
			
			Z <= {~Seg[0] ? 1'b0 : 1'bx, 3'b000, ~Seg[6] ? 1'b0 : 1'bx, 
					3'b000, ~Seg[3] ? 1'b0 : 1'bx};		// 横線 (A, D, G) を表示
			#46
			
			Z <= {1'b0, {3{~Seg[1] ? 1'b0 : 1'bx}}, 1'b0,
					{3{~Seg[2] ? 1'b0 : 1'bx}}, 1'b0};	// 右縦線 (B, C) を表示
			#15
			
			;
		end
		Z <= 0;	#20	// 右マージンを表示
		$finish;
   end
endmodule

