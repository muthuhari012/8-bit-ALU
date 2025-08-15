`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/11/2025 09:54:19 PM
// Design Name: 
// Module Name: design
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

module alu8bit (
    input  [7:0] A,
    input  [7:0] B,
    input  [2:0] OP,
    output reg [7:0] Result,
    output reg CarryOut,
    output reg ZeroFlag
);
always @(*) begin
    case (OP)
        3'b000: {CarryOut, Result} = A + B;       // Addition
        3'b001: {CarryOut, Result} = A - B;       // Subtraction
        3'b010: Result = A & B;                   // AND
        3'b011: Result = A | B;                   // OR
        3'b100: Result = A ^ B;                   // XOR
        3'b101: Result = ~A;                      // NOT (on A)
        3'b110: {CarryOut, Result} = A + 1;       // Increment
        3'b111: {CarryOut, Result} = A - 1;       // Decrement
        default: Result = 8'b0;
    endcase
    // CarryOut only for arithmetic ops, so set it to 0 otherwise
    if (OP < 3'b110) CarryOut = 1'b0;
    ZeroFlag = (Result == 8'b0) ? 1'b1 : 1'b0;
end
endmodule

