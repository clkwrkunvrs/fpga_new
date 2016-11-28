`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Travis Keller
// 
// Create Date: 11/03/2016 11:37:49 AM
// Tested: 11/20/2016
// Design Name: 
// Module Name: Moore
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Moore(
    input RST,
    input EN,
    input CLK,
    output[3:0] OUT,
    output [1:0] Cout
    );
    
localparam ZERO = 2'b00, ONE  = 2'b01,
           TWO  = 2'b10, THREE= 2'b11;
    
reg [1:0] state_q, state_d;
reg [3:0] out_q, out_d;
reg [1:0] Cout_q, Cout_d;

assign OUT = ~out_q;
assign Cout = Cout_q;

always @(posedge CLK) begin
    if (RST) begin
        state_d <= ZERO;
        out_d <= 4'b0111;
        Cout_d <= 2'b00;
    end

else if (EN) begin
    case (state_q)
    
    ZERO: begin  //go to one
        state_d <= ONE; 
        out_d <= 4'b1011;
        Cout_d <= 2'b01;
    end
    
    ONE: begin
        state_d <= TWO; //go to two
        out_d <= 4'b1101;
        Cout_d <= 2'b10;
    end
    
    TWO: begin
        state_d <= THREE; //go to three
        out_d <= 4'b1110;
        Cout_d <= 2'b11;
    end
    
    THREE: begin
        state_d <= ZERO; //go back to zero
        out_d <= 4'b0111;
        Cout_d <= 2'b00;
    end
    
    default: state_d = ZERO;
    endcase
end
    

state_q <= state_d;
out_q <= out_d;
Cout_q <= Cout_d;
//ff2_q <= ff2_d;
end

    
endmodule
