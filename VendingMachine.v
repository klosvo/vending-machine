`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2020 06:44:01 AM
// Design Name: 
// Module Name: VendingMachine
// Project Name: 
// 
//////////////////////////////////////////////////////////////////////////////////


module VendingMachine(Clk, Rst, N, D, Q, Candy, NUM);
    input Clk, Rst, N, D, Q;
    output reg [5:0] NUM;
    output reg Candy;
    
    reg [5:0] State, NextState;
    parameter S0 = 5'b00000, S5 = 5'b00001, S10 = 5'b00010, S15 = 5'b00011, S20 = 5'b00100, S25 = 5'b00101, S30 = 5'b00110, S35 = 5'b00111, S40 = 5'b01000, S45 = 5'b01001;
    parameter R0 = 5'b01010, R5 = 5'b01010, R10 = 5'b01011, R15 = 5'b01100, R20 = 5'b01101;
    
always @(State, N, D, Q) begin
        case (State)
            S0: begin
                NUM <= 0;
                Candy <= 0;
                if(((Q==1) && (N==1)) || ((Q==1) && (D==1)) || ((N==1) && (D==1))) begin
                    NextState <= S0; end  
                else if(N==1) begin
                    NextState <= S5; end
                else if(D==1) begin
                    NextState <= S10; end
                else if(Q==1) begin
                    NextState <= S25; end  
                else begin
                    NextState <= S0; end
                end
            S5: begin
                NUM <= 6'b101;
                Candy <= 0;
                if(((Q==1) && (N==1)) || ((Q==1) && (D==1)) || ((N==1) && (D==1))) begin
                    NextState <= 55; end  
                else if(N==1) begin
                    NextState <= S10; end
                else if(D==1) begin
                    NextState <= S15; end
                else if(Q==1) begin
                    NextState <= S30; end
                else begin
                    NextState <= S5; end
                end
            S10: begin
                NUM <= 6'b1010;
                Candy <= 0;
                if(((Q==1) && (N==1)) || ((Q==1) && (D==1)) || ((N==1) && (D==1))) begin
                    NextState <= S10; end  
                else if(N==1) begin
                    NextState <= S15; end
                else if(D==1) begin
                    NextState <= S20; end
                else if(Q==1) begin
                    NextState <= S35; end
                else begin
                    NextState <= S10; end
                end
            S15: begin
                NUM <= 6'b1111;
                Candy <= 0;
                if(((Q==1) && (N==1)) || ((Q==1) && (D==1)) || ((N==1) && (D==1))) begin
                    NextState <= S15; end  
                else if(N==1) begin
                    NextState <= S20; end
                else if(D==1) begin
                    NextState <= S25; end
                else if(Q==1) begin
                    NextState <= S40; end
                else begin
                    NextState <= S15; end
                end
            S20: begin
                NUM <= 6'b10100;
                Candy <= 0;
                if(((Q==1) && (N==1)) || ((Q==1) && (D==1)) || ((N==1) && (D==1))) begin
                    NextState <= S20; end  
                else if(N==1) begin
                    NextState <= S25; end
                else if(D==1) begin
                    NextState <= S30; end
                else if(Q==1) begin
                    NextState <= S45; end
                else begin
                    NextState <= S20; end
                end
            S25: begin
                NUM <= 6'b11001;
                Candy <= 1;
                NextState <= R0;
                end
            S30: begin
                NUM <= 6'b11110;
                Candy <= 1;
                NextState <= R5;
                end
            S35: begin
                NUM <= 6'b100011;
                Candy <= 1;
                NextState <= R10;
                end
            S40: begin
                NUM <= 6'b101000;
                Candy <= 1;
                NextState <= R15;
                end
            S45: begin
                NUM <= 6'b101101;
                Candy <= 1;
                NextState <= R20;
                end
            R0: begin
                NUM <= 6'b11001;
                Candy <= 1;
                if(Rst==1) begin
                    NextState <= S0; end
                else begin
                    NextState <= R0; end
                end
            R5: begin
                NUM <= 6'b101;
                Candy <= 1;
                if(Rst==1) begin
                    NextState <= S0; end
                else begin
                    NextState <= R5; end
                end
            R10: begin
                NUM <= 6'b1010;
                Candy <= 1;
                if(Rst==1) begin
                    NextState <= S0; end
                else begin
                    NextState <= R10; end
                end
            R15: begin
                NUM <= 6'b1111;
                Candy <= 1;
                if(Rst==1) begin
                    NextState <= S0; end
                else begin
                    NextState <= R15; end
                end
            R20: begin
                NUM <= 6'b11010;
                Candy <= 1;
                if(Rst==1) begin
                    NextState <= S0; end
                else begin
                    NextState <= R20; end
                end
            default: begin
                NUM <= 0;
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




