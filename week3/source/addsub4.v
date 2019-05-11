`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:26:46 04/24/2019 
// Design Name: 
// Module Name:    adder4 
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
module HADDER(
	input A,
	input B,
	output S,
	output Co
	);
	assign Co = A & B;
	assign S = A ^ B;
endmodule

module ADDER(
    input A,
    input B,
    input C,
    output S,
    output Co
    );
	 wire F;
	 wire G;
	 wire H;
	 
	HADDER U1(.A(A), .B(B), .S(F), .Co(G));
	HADDER U2(.A(F), .B(C), .S(S), .Co(H));
	assign Co = G | H;
endmodule


module ADDER4(
    input [3:0] A,
    input [3:0] B,
    input SIG,
    output [3:0] S,
    output C
    );
	
	wire [3:0]Ba;
	wire [3:0]Co;
	assign Ba = {4{SIG}}^B;
	
	ADDER U0(.A(A[0]),.B(Ba[0]),.C(SIG),.S(S[0]),.Co(Co[0]));	
	ADDER U1(.A(A[1]),.B(Ba[1]),.C(Co[0]),.S(S[1]),.Co(Co[1]));
	ADDER U2(.A(A[2]),.B(Ba[2]),.C(Co[1]),.S(S[2]),.Co(Co[2]));
	ADDER U3(.A(A[3]),.B(Ba[3]),.C(Co[2]),.S(S[3]),.Co(Co[3]));
	assign C = Co[3];

endmodule
