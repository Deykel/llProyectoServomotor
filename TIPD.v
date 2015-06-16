`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:39:30 06/10/2015 
// Design Name: 
// Module Name:    TIPD 
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
module TIPD#( ancho = 19, signo = 1, magnitud = 18, precision = 0)(input wire ReadyData,clk,rst,input wire [ancho-1:0] ref, input wire [7:0] yk, output wire [ancho-1:0] SumaOut
    );
	  
	 
//
wire signed [ancho-1:0] ykaux={{11{1'b0}},yk};
wire signed [ancho-1:0] yk1aux={{11{1'b0}},yk1};
wire signed [ancho-1:0] ek;
ERROR#( .ancho(ancho)) Merror( .Ready(ReadyData),.clk(clk) , .ref(ref), .yk(ykaux), .Error(ek), .ListoERROR(errorlisto));

//registros anteriores 
wire signed [ancho-1:0] i1,I,P,D,ykout;
wire signed [7:0] yk1;


RegistroNbits#(.bits(8))YK1(.clk(clk), .reset(rst) ,.en(sumalisto) ,.dd(yk) ,.qq(yk1));
RegistroNbits#(.bits(ancho))IK1(.clk(clk), .reset(rst) ,.en(sumalisto) ,.dd(I) ,.qq(i1));



IPD2#( .ancho(ancho), .signo(signo), .magnitud(magnitud), .precision(precision)) MIPD(.clk(clk),.ReadyE(errorlisto), .yk(ykaux),.yk1(yk1aux),.i1(i1),.error(ek), .Integral(I),.Proporcional(P),.Derivada(D),.IPDready(IPDlisto));




	 
	 
SumaFinal#( .ancho(ancho)) SumaSalida(.Integral(I),.Proporcional(P),.Derivada(D),.clk(clk),.IPDready(IPDlisto), .SumaReady(sumalisto), .SumaIPD(SumaOut)    );
 
	 
endmodule






