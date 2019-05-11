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
	integer J;	// ���[�v�ϐ� (for���ɗp����)
	reg [8:0]Z;

	// Instantiate the Unit Under Test (UUT)
	seg7proc uut (
		.I(I), 
		.Seg(Seg)
	);

	initial begin
		for(J=0; J<16; J=J+1) begin		// 0 ���� 15 �܂ł����
			I <= J;		// ���[�v�ϐ��l���f�R�[�_�ɗ^����
			Z <= 0;		// ���}�[�W������ю��ԃ}�[�W����\��
			#22;
			
			Z <= {1'b0, {3{~Seg[5] ? 1'b0 : 1'bx}}, 1'b0,
					{3{~Seg[4] ? 1'b0 : 1'bx}}, 1'b0};	// ���c�� (E, F) ��\��
			#15
			
			Z <= {~Seg[0] ? 1'b0 : 1'bx, 3'b000, ~Seg[6] ? 1'b0 : 1'bx, 
					3'b000, ~Seg[3] ? 1'b0 : 1'bx};		// ���� (A, D, G) ��\��
			#46
			
			Z <= {1'b0, {3{~Seg[1] ? 1'b0 : 1'bx}}, 1'b0,
					{3{~Seg[2] ? 1'b0 : 1'bx}}, 1'b0};	// �E�c�� (B, C) ��\��
			#15
			
			;
		end
		Z <= 0;	#20	// �E�}�[�W����\��
		$finish;
   end
endmodule

