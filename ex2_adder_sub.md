#### adder and subtractor using  diffrent modeling styles

```
module fas(a,b,cin,sum_diff,co_borrow);
input a,b,cin;
output sum_diff,co_borrow;

reg sum_diff_reg;
reg co_borrow_reg;

`ifdef adder

assign sum_diff=a^b^cin;
assign co_borrow=(a&b)|(a&cin)|(b&cin);

`elsif subtract

assign sum_diff=a^b^cin;
assign co_borrow=(cin&(a~^b))|(~a&b);

`elsif behave_adder

always@(a,b,cin)
begin

 sum_diff_reg=a^b^cin;
 co_borrow_reg=(a&b)|(a&cin)|(b&cin);

end

 assign sum_diff=sum_diff_reg;
 assign co_borrow=co_borrow_reg;

`else

always@(a,b,cin)
begin

 sum_diff_reg=a^b^cin;
 co_borrow_reg=(cin&(a~^b))|(~a&b);

end

 assign sum_diff=sum_diff_reg;
 assign co_borrow=co_borrow_reg;

`endif

endmodule
```

#### Testbench 
```

`timescale 1ns/1ns

module tb;


reg a,b,cin;
wire sum_diff,co_borrow;
integer i;
fas dut(a,b,cin,sum_diff,co_borrow);

initial begin
$monitor("a %b, b  %b,cin  %b,sum_diff  %b,co_borrow  %b",a,b,cin,sum_diff,co_borrow);
for(i=0;i<8;i=i+1)
begin
{a,b,cin}=i;
#5;
end
#5;
$finish;
end
endmodule
```
