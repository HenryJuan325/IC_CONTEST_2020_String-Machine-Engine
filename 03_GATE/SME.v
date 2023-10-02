`include "SME_COMP.v"
`timescale 1ns/10ps
module SME(clk,reset,chardata,isstring,ispattern,valid,match,match_index);
input clk;
input reset;
input [7:0] chardata;
input isstring;
input ispattern;
output reg match;
output reg[4:0] match_index;
output reg valid;
// reg match;
// reg [4:0] match_index;
// reg valid;


//-----------------------//
//	parameter			 //
//-----------------------//
parameter RESET   = 'd0;
parameter INPUT_S = 'd1;
parameter INPUT_P = 'd2;
parameter COMP  = 'd3;
parameter OUT   = 'd4;
reg [2:0] c_state, n_state;
genvar i;
//-----------------------//
//	reg wire 			 //
//-----------------------//

reg [7:0] str_reg [33:0];
reg [7:0] str_rev [33:0];
reg [7:0] pat_reg [9:0];
reg [5:0] str_len;
reg [3:0] pat_len;

// flag
reg flag_head; 

// comp module
wire ready;
wire match_w;
wire [4:0]match_index_w;
//-----------------------//
//	input block			 //
//-----------------------//
always @(posedge reset, posedge clk)begin
	if(reset)
		c_state <= RESET; 
	else 
		c_state <= n_state;
end

always @(*)begin
	case(c_state) 
	RESET:   if(!reset) 	n_state = INPUT_S; else n_state = RESET;
	INPUT_S: if(!isstring)  n_state = INPUT_P; else n_state = INPUT_S;
	INPUT_P: if(!ispattern) n_state = COMP;    else n_state = INPUT_P;
	COMP:    if(ready)      n_state = OUT;     else n_state = COMP;
	OUT:     if(isstring)   n_state = INPUT_S;
			 else if(ispattern) n_state = INPUT_P;
			 else 				n_state = RESET;
	default: n_state = RESET;
	endcase
end
//-----------------------//
//	input block			 //
//-----------------------//
// string 
generate
for (i = 0; i < 34; i = i + 1) begin
    if (i == 0) begin
        always @(posedge clk or posedge reset) begin
            if (reset) str_reg[i] <= 8'd32;
            else       str_reg[i] <= 8'd32;
        end
    end
    else if (i == 1) begin
        always @(posedge clk or posedge reset) begin
            if (reset) str_reg[i] <= 8'd32;
            else if (isstring)begin
                case (c_state)
                    RESET : str_reg[i] <= chardata;
                    INPUT_S : str_reg[i] <= chardata;
                    OUT : str_reg[i] <= chardata;
                    default : str_reg[i] <= str_reg[i];
                endcase
            end
            else str_reg[i] <= str_reg[i];
        end
    end
    else if (i == 2) begin
        always @(posedge clk or posedge reset) begin
            if (reset) str_reg[i] <= 8'd0;
            else if (isstring) begin
                case (c_state) 
                    RESET : str_reg[i] <= str_reg[i - 1];
                    INPUT_S : str_reg[i] <= str_reg[i - 1];
                    OUT : str_reg[i] <= 8'd32;
                    default : str_reg[i] <= str_reg[i];
                endcase 
            end
            else str_reg[i] <= str_reg[i];
        end
    end
    else begin
        always @(posedge clk or posedge reset) begin
            if (reset) str_reg[i] <= 8'd0;
            else if (isstring) begin
                case (c_state) 
                    RESET : str_reg[i] <= 8'd0;
                    INPUT_S : str_reg[i] <= str_reg[i - 1];
                    OUT : str_reg[i] <= 8'd0;
                    default : str_reg[i] <= str_reg[i];
                endcase 
            end
        end
    end
end
endgenerate


// generate 
// 	for(i = 0; i<34; i = i + 1)begin
// 		if(i == 0) begin
// 			always @(posedge reset, posedge clk)begin
// 				if(reset)
// 					str_reg[i] <= 'd0;
// 				else 
// 					str_reg[i] <= 'd32;
// 			end
// 		end
// 		else if(i == 1) begin
// 			always @(posedge reset, posedge clk)begin
// 				if(reset)
// 					str_reg[i] <= 8'd32;
// 				else 
// 					// if( n_state == OUT)
//                     if (n_state == OUT && isstring) 
// 						str_reg[i] <= 8'd32;
// 					else if(isstring) begin
// 						str_reg[i] <= chardata;
// 					end
//                     else str_reg[i] <= str_reg[i];
// 			end
// 		end
// 		else begin
// 			always @(posedge reset, posedge clk)begin
// 				if(reset)
// 					str_reg[i] <= 'd0;
// 				else 
// 					// if( n_state == OUT)
//                     if (n_state == OUT && ispattern) 
// 						str_reg[i] <= 8'd0;
//                     else if (c_state == OUT && isstring)
//                         str_reg[i] <= 8'd0;
// 					else if(isstring) begin
// 						str_reg[i] <= str_reg[i-1];
// 					end
//                     else str_reg[i] <= str_reg[i];
// 			end
// 		end
// 	end
// endgenerate


always@(posedge reset, posedge clk)begin
	if(reset)begin
		str_len <= 6'd0;
	end
	else begin
        // if (n_state == OUT)
		if(c_state == OUT && isstring) begin
			str_len <= 6'd1;
            $display("hello");
        end
		else if(isstring)
			str_len <= str_len + 6'd1;
        else str_len <= str_len;
	end
end

// pattern 
generate 
	for(i = 0; i<10; i = i + 1)begin
			always @(posedge reset, posedge clk)begin
				if(reset)
					pat_reg[i] <= 'd0;
				else 
					if( n_state == OUT)
						pat_reg[i] <= 'd0;
					else if(ispattern) begin
                        pat_reg[i] <= (i == 9 - pat_len) ? chardata : pat_reg[i];
					end
			end
		// if(i == 9) begin
		// 	always @(posedge reset, posedge clk)begin
		// 		if(reset)
		// 			pat_reg[i] <= 'd0;
		// 		else 
		// 			if( n_state == OUT)
		// 				pat_reg[i] <= 'd0;
		// 			else if(ispattern) begin
        //                 pat_reg[i] <= chardata;
		// 			end
		// 	end
		// end
		// else begin
		// 	always @(posedge reset, posedge clk)begin
		// 		if(reset)
		// 			pat_reg[i] <= 'd0;
		// 		else 
		// 			if( n_state == OUT)
		// 				pat_reg[i] <= 'd0;
		// 			else if(ispattern) begin
		// 				pat_reg[i] <= pat_reg[i+1];
		// 			end
		// 	end
		// end
	end
endgenerate

always @(posedge clk or posedge reset) begin
    if (reset) flag_head <= 1'b0;
    else flag_head <= (n_state == OUT) ? 1'b0 :
                      (ispattern && chardata == 8'd94) ? 1'b1 : flag_head;
end

always@(posedge reset, posedge clk)begin
	if(reset)begin
		pat_len <= 'd0;
	end
	else begin
		if(n_state == OUT)
			pat_len <= 'd0;
		else if(ispattern)
			pat_len <= pat_len + 'd1;
	end
end

//-----------------------//
//	output block		 //
//-----------------------//

always@(posedge reset, posedge clk)begin
	if(reset)
		valid <= 'd0;
	else 
        if(n_state == OUT)
			valid <= 'd1;
		else 
			valid <= 'd0;
end

reg match_reg;
reg [4:0] match_index_reg;
always@(posedge reset, posedge clk)begin
	if(reset)
		match <= 'd0;
	else 
		if(n_state == OUT)
			match <= match_w;
		else 
			match <= 'd0;
end

always@(posedge reset, posedge clk)begin
	if(reset)
		match_index <= 'd0;
	else 
		if(n_state == OUT) begin
            match_index <= match_index_w - 5'd2 + {4'd0, flag_head};
        end
		else 
			match_index <= 'd0;
end
//-----------------------//
//	comp  block  		 //
//-----------------------//
wire [271:0] str_reg_w;
wire [79:0] pat_reg_w;
generate
	for(i = 0; i<34; i= i+1)begin
		assign str_reg_w[i*8+:8] = str_reg[i];
	end
endgenerate

generate
	for(i = 0; i<10; i= i+1)begin
		assign pat_reg_w[i*8+:8] = pat_reg[i];
	end
endgenerate
SME_COMP u1(.reset(reset), .clk(clk), .str_reg_w(str_reg_w), .pat_reg_w(pat_reg_w), .str_len(str_len), .pat_len(pat_len),
			.c_state(c_state), .ready(ready),   .match(match_w),   .match_index(match_index_w)
);

// ------------------------------------------------------------------------------------------------------
// always @(posedge clk or posedge reset) begin
//     if (reset) match_reg <= 1'b0;
//     else match_reg <= (ready == 1'b1) ? match_w : 1'b0;
// end
// 
// always @(posedge clk or posedge reset) begin
//     if (reset) match_index_reg <= 5'd0;
//     else match_index_reg <= (ready == 1'b1) ? match_index_w : 5'd0;
// end
// ------------------------------------------------------------------------------------------------------
/*
module SME_COMP (
        input [7:0] str_reg[33:0],
        input [7:0] pat_reg[7:0],
        input [5:0] str_len,
        input [3:0] pat_len,
        input [1:0] c_state
        output ready,
        output match,
        output [4:0] match_index
);

*/
endmodule
