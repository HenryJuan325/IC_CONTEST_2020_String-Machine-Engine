`timescale 1ns/10ps
module SME_COMP (
        input reset,
        input clk,
        input [271:0] str_reg_w,
        input [79:0] pat_reg_w,
        input [5:0] str_len,
        input [3:0] pat_len,
        input [2:0] c_state,
        output reg ready,
        output reg match,
        output reg [4:0] match_index
);

// ----------------------------------------------------------------------------
// parameter & genvar
// ----------------------------------------------------------------------------
parameter HEAD = 8'd94;
parameter TAIL = 8'd36;
parameter DOT = 8'd46;
parameter SPACE = 8'd32;

parameter COMP = 'd3;

parameter S_IDLE = 'd0;
parameter S_CLEAN = 'd5;
parameter S_COMP = 'd1;
parameter S_CHECK = 'd2;
parameter S_OUTPUT = 'd4;

genvar i;

// ----------------------------------------------------------------------------
// reg & wire
// ----------------------------------------------------------------------------


reg [7:0] str_buf[33:0];
reg [9:0] flag;
reg [2:0] cs;



wire [7:0] str_reg[33:0];
wire [7:0] pat_reg[9:0];
generate
for(i = 0; i<34; i= i+1)begin
	assign str_reg[i] = str_reg_w[8*i +:8];
end
endgenerate
generate
for(i = 0; i<10; i= i+1)begin
	assign pat_reg[i] = pat_reg_w[8*i +:8];
end
endgenerate


// ----------------------------------------------------------------------------
// Design
// ----------------------------------------------------------------------------

generate 
for (i = 0; i < 10; i = i + 1) begin
    always @(posedge clk or posedge reset) begin
        if (reset) flag[i] <= 1'b0;
        else begin
            case (cs) 
                S_IDLE : flag[i] <= 1'b1;
                S_COMP : begin
                    if (9 - i < pat_len) begin
                        if ((pat_reg[i] == HEAD || pat_reg[i] == TAIL) && str_buf[i + 24] == SPACE) flag[i] <= 1'b1;
                        else if (pat_reg[i] == str_buf[i + 24]) flag[i] <= 1'b1;
                        else if (pat_reg[i] == DOT && match_index != 5'd0) flag[i] <= 1'b1;
                        else flag[i] <= 1'b0;
                    end
                    else flag[i] <= 1'b1;
                end
                S_CHECK : flag[i] <= (flag == 10'b11_1111_1111 || str_buf[33] == 8'd0) ? flag[i] : 1'b1;
                default : flag[i] <= flag[i];
            endcase
        end
    end
end
endgenerate

// always @(posedge clk or posedge reset) begin
//     if (reset) cnt <= 3'd0;
//     else begin
//         case (cs) 
//             S_COMP : cnt <= (cnt != pat_len) ? cnt + 3'd1 : 3'd0;
//             default : cnt <= 3'd0;
//         endcase
// 
//     end
// end

generate
for (i = 0; i < 34; i = i + 1) begin
    if (i != 0) begin
        always @(posedge clk or posedge reset) begin
            if (reset) str_buf[i] <= 8'd0; 
            else begin
                case (cs)
                    S_IDLE : str_buf[i] <= (c_state == COMP) ? str_reg[i] : 8'd0;
                    S_CLEAN : str_buf[i] <= (str_buf[33] == 8'd32) ? str_buf[i] : str_buf[i - 1];
                    S_COMP : str_buf[i] <= str_buf[i - 1];
                    default : str_buf[i] <= str_buf[i];
                endcase
            end
        end
    end
    else begin
        always @(posedge clk or posedge reset) begin
            if (reset) str_buf[i] <= 8'd0; 
            else begin
                case (cs)
                    S_IDLE : str_buf[i] <= (c_state == COMP) ? str_reg[i] : 8'd0;
                    S_CLEAN : str_buf[i] <= (str_buf[33] == 8'd32) ? str_buf[i] : 8'd0;
                    S_COMP : str_buf[i] <= 8'd0;
                    default : str_buf[i] <= str_buf[i];
                endcase
            end
        end
    end
end
endgenerate



// ----------------------------------------------------------------------------
// FSM & Output 
// ----------------------------------------------------------------------------
always @(posedge clk or posedge reset) begin
    if (reset) cs <= S_IDLE;
    else if (c_state == COMP) begin
        case (cs) 
            S_IDLE : cs <= S_CLEAN;
            S_CLEAN : cs <= (str_buf[33] == 8'd32) ? S_COMP : S_CLEAN;
            S_COMP : cs <= S_CHECK; 
            S_CHECK : cs <= (flag == 10'b11_1111_1111 || str_buf[33] == 8'd0) ? S_OUTPUT : S_COMP;
            // S_OUTPUT : cs <= S_IDLE;
            default : cs <= S_IDLE;
        endcase 
    end
    else cs <= S_IDLE;
end

always @(posedge clk or posedge reset) begin
    if (reset) match_index <= 5'd0;
    else begin
        case (cs)
            S_IDLE : match_index <= 5'd0;
            S_COMP : match_index <= match_index + 5'd1; 
            default : match_index <= match_index;
        endcase 
    end 
end

always @(posedge clk or posedge reset) begin
    if (reset) match <= 1'b0;
    else if (cs == S_OUTPUT) match <= (flag == 10'b11_1111_1111) ? 1'b1 : 1'b0;
    else match <=1'b0;
end

always @(posedge clk or posedge reset) begin
    if (reset) ready <= 1'b0;
    else if (cs == S_OUTPUT) ready <= 1'b1;
    else ready <= 1'b0;
end



endmodule 
