module bit_stream
(input clk, EA,
input [10:0] count_h, count_v,
output red,green,blue);

reg r=0;
reg g=0;
reg b=0;

assign red = r;
assign green = g;
assign blue = b;

always @ (posedge clk)
begin
if(EA) begin
if (count_h < 128)
// красный
begin
r = 1;
b = 0;
g = 0;
end

//желтый
if (count_h > 128)
begin
r = 1;
b = 0;
g = 1;
end

//зеленый
if (count_h > 256)
begin
r = 0;
b = 0;
g = 1;
end
//голубой
if (count_h > 384)
begin
r = 0;
b = 1;
g = 1;
end
// синий
if (count_h > 512)
begin
r = 0;
b = 1;
g = 0;
end

//фиолетовый
if (count_h > 640)
begin
r = 1;
b = 1;
g = 0;
end
// белый
if (count_h > 768)
begin
r = 1;
b = 1;
g = 1;
end

// черный
if (count_h > 896 )
begin
r = 0;
b = 0;
g = 0;
end
end
else begin
r = 0;
b = 0;
g = 0;
end
end 
endmodule