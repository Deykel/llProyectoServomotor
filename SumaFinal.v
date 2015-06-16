`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:18:13 06/10/2015 
// Design Name: 
// Module Name:    SumaFinal 
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
module SumaFinal#( ancho = 19)(input wire [ancho-1:0] Integral,Proporcional,Derivada, input wire clk, IPDready, output SumaReady, output wire [ancho-1:0] SumaIPD    );



reg signed[ancho-1:0] Suma_sig;
reg listo=0;



always@(posedge clk) begin 

if (IPDready)
	begin	
	Suma_sig<=Integral-Proporcional-Derivada;
	listo<=1;
	
	end
else 
		begin
		listo<=0;
		Suma_sig<=Suma_sig;
		
		end

	end
	
assign SumaIPD=Suma_sig;
assign SumaReady=listo;




endmodule
