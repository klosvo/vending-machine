`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2020 11:57:27 AM
// Design Name: 
// Module Name: Button_Sync
// Project Name: 
//////////////////////////////////////////////////////////////////////////////////

module Button_Sync(Clk, Rst, bi, bo);
    input Clk, Rst, bi;
    output reg bo;

    reg [2:0] State, NextState;
    parameter S0=2'b00, S1=2'b01, S2 = 2'b10;

    always @(State, bi) begin
        case (State)
            S0: begin
                bo <= 0;
                if(bi==1) begin
                    NextState <= S1; end
                else begin
                    NextState <= S0; end
                end
            S1: begin
                bo <= 1;
                NextState <= S2;
                end
            S2: begin
                bo <= 0;
                if(bi==0) begin  
                    NextState <= S0; end
                else begin
                    NextState <= S2; end
                end
            default: begin
                bo <= 1'b0;
                NextState <= S0;
                end
        endcase
    end
    
    always @(posedge Clk)
    begin
        if (Rst == 1)
            State <= S0;
        else
            State <= NextState;
    end
    
endmodule
