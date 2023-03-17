module fas(a,b,cin,sum_diff,co_borrow);
input a,b,cin;
output sum_diff,co_borrow;

`ifdef dataflow 


assign sum_diff=a^b^cin;
assign co_borrow=(a&b)|(a&cin)|(b&cin);


`else 

assign sum_diff=a^b^cin;
assign co_borrow=(cin&(a~^b))|(~a&b);

 //Bin (A XOR B)? + A?B
/*
xor x1(s1,a,b), x2(sum,s1,cin);
and g1(c1,a,b), g2(c2,a,cin), g3(c3,b,cin);
or(co,c1,c2,c3);
*/
`endif


endmodule
