`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 02/25/2020 11:51:24 AM
// Design Name: 
// Module Name: ClkDiv
// Project Name: 
//////////////////////////////////////////////////////////////////////////////////

module ClkDiv(Clk, Rst, ClkOut);
    input Clk, Rst;
    output reg ClkOut;
    //to create 1 Hz clock from 100-MHz on the board M=10^6
    //parameter DivVal = 50000000; //to create 1 Hz clock from 100-MHz on the board
    parameter DivVal = 24999; // need to go from 100Mhz to 2000 hz - > freq of clockout = freq of board clock/2[divval+1]
    reg [25:0] DivCnt;
    reg ClkInt;
    always @(posedge Clk) begin
        if(Rst == 1) begin
            DivCnt <=0;
            ClkOut <=0;
            ClkInt <=0;
        end
        else begin
            if(DivCnt == DivVal) begin
                ClkOut <=~ClkInt;
                ClkInt <= ~ClkInt;
                DivCnt <= 0;
            end
            else begin
                ClkOut <= ClkInt;
                ClkInt <= ClkInt;
                DivCnt <= DivCnt +1;
            end
        end
    end
endmodule