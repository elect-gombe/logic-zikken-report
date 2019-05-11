// Verilog test fixture created from schematic Z:\sevenseg\sevensegdec.sch - Wed Apr 17 16:46:36 2019

`timescale 1ns / 1ps

module sevensegdec_sevensegdec_sch_tb();

// Inputs
   reg [3:0] I;

// Output
   wire [0:6] Y;
	reg [8:0] Z;
	integer J;

// Bidirs

// Instantiate the UUT
   sevensegdec UUT (
		.I(I), 
		.Y(Y)
   );
// Initialize Inputs
initial begin
	I = 0;
	for(J=0; J<16; J=J+1) begin
		I <= J;
		Z <= 0;
		#22;
		Z <= {1'b0, {3{Y[5] ? 1'b0 : 1'bx}}, 1'b0,
					{3{Y[4] ? 1'b0 : 1'bx}}, 1'b0};	// ¶cü (E, F) ‚ð•\Ž¦
			#15
			
		Z <= {Y[0] ? 1'b0 : 1'bx, 3'b000, Y[6] ? 1'b0 : 1'bx, 
					3'b000, Y[3] ? 1'b0 : 1'bx};		// ‰¡ü (A, D, G) ‚ð•\Ž¦
			#46
			
		Z <= {1'b0, {3{Y[1] ? 1'b0 : 1'bx}}, 1'b0,
					{3{Y[2] ? 1'b0 : 1'bx}}, 1'b0};	// ‰Ecü (B, C) ‚ð•\Ž¦
			#15
			
		;
	end
	 Z<= 0;#20
	 $finish;
end

endmodule
