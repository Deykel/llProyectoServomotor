`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:40:51 06/10/2015 
// Design Name: 
// Module Name:    IPD2 
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
module IPD2#( ancho = 20, signo = 1, magnitud = 18, precision = 0)( input wire clk,  ReadyE, input wire [ancho-1:0] yk,yk1,i1,error, output wire [ancho-1:0] Integral,Proporcional,Derivada, output wire IPDready 
    );


localparam [ancho-1:0] Ki=19'd7;
localparam [ancho-1:0] Kp=19'd18;
localparam [ancho-1:0] Kd=19'd150;


reg signed [ancho-1:0] Integral_sig;
reg signed [ancho-1:0] Proporcional_sig;
reg signed [ancho-1:0] Derivada_sig;


reg listo=0;


always@(posedge clk )
	begin 
	
	if(ReadyE)
		begin 
		Integral_sig<=(Ki*error)+i1;
		Proporcional_sig<= Kp*(yk-19'd128);
		Derivada_sig<= Kd*((yk-19'd128)-((yk1)-(19'd128)));
		listo<=1;
		end
	else 
	begin 
	Integral_sig<=Integral_sig;
	Proporcional_sig<= Proporcional_sig;
	Derivada_sig<= Derivada_sig;
	listo<=0;
	end
	
	
	end 

assign IPDready=listo;
assign Integral=Integral_sig;
assign Proporcional=Proporcional_sig;
assign Derivada=Derivada_sig;





endmodule
