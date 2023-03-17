# modelsim_prac

#### Ex1: Full adder and subtractor 

```
module fas(a,b,cin,sum_diff,co_borrow);
input a,b,cin;
output sum_diff,co_borrow;

`ifdef dataflow 

assign sum_diff=a^b^cin;
assign co_borrow=(a&b)|(a&cin)|(b&cin);

`else 

assign sum_diff=a^b^cin;
assign co_borrow=(cin&(a~^b))|(~a&b);

`endif

endmodule

```

<p>To compile adder type the following</p>

vlog +define+dataflow=df fa.v tb.v

<p>To compile subtractor portion type the following</p>

vlog +define+dataflow=df fa.v tb.v

<p>To simulate without GUI</p>

vsim -c work.tb

<p> To run</p>

run -all
