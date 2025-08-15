`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/11/2025 09:55:28 PM
// Design Name: 
// Module Name: testbench
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
module tb_alu8bit;
    reg  [7:0] A, B;
    reg  [2:0] OP;
    wire [7:0] Result;
    wire CarryOut, ZeroFlag;

    alu8bit uut (
        .A(A), .B(B), .OP(OP),
        .Result(Result), .CarryOut(CarryOut), .ZeroFlag(ZeroFlag)
    );

    initial begin
        // Test addition
        A = 8'h0A; B = 8'h05; OP = 3'b000; #10;
        // Test subtraction
        A = 8'h0A; B = 8'h03; OP = 3'b001; #10;
        // Test AND
        A = 8'hFF; B = 8'h0F; OP = 3'b010; #10;
        // Test OR
        A = 8'hF0; B = 8'h0F; OP = 3'b011; #10;
        // Test XOR
        A = 8'hAA; B = 8'h55; OP = 3'b100; #10;
        // Test NOT
        A = 8'hA5; B = 8'h00; OP = 3'b101; #10;
        // Test Increment
        A = 8'h09; OP = 3'b110; #10;
        // Test Decrement
        A = 8'h01; OP = 3'b111; #10;
        $finish;
    end
endmodule
