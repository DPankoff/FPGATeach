module synk
(input clk,output v_synk, h_synk, ea,
output [10:0] h_count, output [10:0] v_count );

reg [10:0] count_h = 0;
reg [10:0] count_v = 0;
reg v = 1;
reg h = 1;
reg ea_reg =1;

assign h_count = count_h;
assign v_count = count_v; 
assign v_synk = v;
assign h_synk = h;
assign ea = ea_reg;

always @ (posedge clk)
begin

if ( count_h > 1023) ea_reg = 0;
else if( count_v >767) ea_reg = 0;
else ea_reg = 1;
  
// v-synk
if (count_v == 770) begin
 v = 0;
end

if (count_v == 776) begin
 v = 1;
end
//-----------------------------

// back porch and jump next frame 
if (count_v == 805) begin
 count_v = 0; 
end


//  h - synk 
if (count_h == 1047) begin
 h = 0;
end

if (count_h == 1183) begin
 h = 1;
end 
//-----------------------------

// back porch and jump next line 
if (count_h == 1343) begin
 count_h = 0;
 count_v = count_v + 1;
end
//----------------------------




count_h = count_h + 1;
end
endmodule    