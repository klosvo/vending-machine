`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2020 01:01:10 PM
// Design Name: 
// Module Name: SevenSegment
// Project Name: 
// 
//////////////////////////////////////////////////////////////////////////////////

module SevenSegment(numin, segout);
    input [3:0] numin;
    output reg [6:0] segout;

    always @(numin)
    begin
    	// Segment A
        segout[6] <= (numin[3] & numin[1]) | (numin[3] & numin[2]) | 
        			(numin[2] & ~numin[1] & ~numin[0]) | (~numin[3] & ~numin[2] & ~numin[1] & numin[0]);
		
		// Segment B
		segout[5] <= (numin[3]&numin[1]) | (numin[3]&numin[2]) | 
        			(numin[2] & ~numin[1] & numin[0]) | (numin[2] & numin[1] & ~numin[0]);
        
        // Segment C
        segout[4] <= (numin[3]&numin[1]) | (numin[3]&numin[2]) | 
        			(~numin[3] & ~numin[2] & numin[1] & ~numin[0]);

        // Segment D
        segout[3] <= (numin[3] & numin[1]) | (numin[3] & numin[2]) | 
        			(numin[2] & ~numin[1] & ~numin[0]) | (numin[2] & numin[1] & numin[0]) | 
        			(~numin[3] & ~numin[2] & ~numin[1] & numin[0]);
		
		// Segment E
		segout[2] <= numin[0] | (numin[3] & numin[1]) | (numin[2] & ~numin[1]);
        
        // Segment F
        segout[1] <= (numin[3] & numin[1]) | (numin[3] & numin[2]) | 
        			(numin[1] & numin[0]) | (~numin[3] & ~numin[2] & numin[0]) |
        			(~numin[3] & ~numin[2] & numin[1]);

        // Segment G
        segout[0] <= (numin[3] & numin[1]) | (numin[3] & numin[2]) | 
        			(~numin[3] & ~numin[2] & ~numin[1]) | (numin[2] & numin[1] & numin[0]);
        
    end
endmodule

