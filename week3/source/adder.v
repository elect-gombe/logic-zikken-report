`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:00:13 04/24/2019 
// Design Name: 
// Module Name:    ADDER 
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
