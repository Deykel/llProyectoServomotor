`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:54:43 05/27/2015 
// Design Name: 
// Module Name:    PWM 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
// FPGA Pulse Width Modulation (s. f.). Recuperado de //http://www.ece301.com/fpga-projects/53-pwm.html
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module PWM#(parameter sd=39)( input wire clk, rst,input [7:0] entrada, output reg PWM_out
    );
	 
	 
reg[13:0] counter=0;

always@(posedge clk)
if (rst==1) PWM_out=0;
else begin 
begin
counter=counter+1'b1;
	if(counter<=entrada*sd)
	PWM_out=1;
	else PWM_out=0;
	if (counter>=10_000) counter=0;
	

end
end


endmodule
