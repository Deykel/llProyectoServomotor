`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:59:56 06/10/2015 
// Design Name: 
// Module Name:    ERROR 
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
module ERROR#( ancho = 19)( input wire Ready,clk , input wire [ancho-1:0] ref, yk, output wire [ancho-1:0] Error, output wire ListoERROR
    );


reg signed [ancho-1:0] ERROR_sig;
reg listo=0;




always@(posedge clk)
begin 
if(Ready)
 begin 
 ERROR_sig<=(ref-19'd128)-(yk-19'd128);
 listo<=1;
 end 
 
 else
	begin 
	listo<=0;
	ERROR_sig<=ERROR_sig;
	
	end
	
end

assign ListoERROR=listo;
assign Error=ERROR_sig;



endmodule
