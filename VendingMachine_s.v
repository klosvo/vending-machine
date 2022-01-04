`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2020 12:01:02 PM
// Design Name: 
// Module Name: VendingMachine_s
// Project Name: 
//////////////////////////////////////////////////////////////////////////////////

module VendingMachine_s(Clk, Reset, N, D, Q, Candy, out7, en_out);
    input Clk, Reset, N, D, Q;
    output [3:0] en_out, out7;
    output Candy;
    wire ClkOut, boN, boD, boQ;
    wire [5:0] NUM;
    
    ClkDiv ClkDiv_1(Clk, 1'b0, ClkOut);
    
    Button_Sync Button_Sync_N(ClkOut, Reset, N, boN);
    Button_Sync Button_Sync_D(ClkOut, Reset, D, boD);
    Button_Sync Button_Sync_Q(ClkOut, Reset, Q, boQ);
    
    VendingMachine VendingMachine_1(ClkOut, Reset, boN, boD, boQ, Candy, NUM);
    //SevenSegment SS_1(NUM, out7);
    TwoDigitDisplay(Clk, NUM, out7, en_out);
    
endmodule
