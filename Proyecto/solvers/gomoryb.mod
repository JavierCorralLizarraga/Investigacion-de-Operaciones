var x1 >= 0 integer;
var x2 >= 0 integer;
var x3 >= 0 integer;
var x4 >= 0 integer;

maximize z:
5*x1 + 4*x2 + 4*x3 + 2*x4;

subject to c1: x1 + 3*x2 + 2*x3 + x4 <= 10;
subject to c2: 5*x1 + x2 + 3*x3 + 2*x4 <= 15;
subject to c3: x1 + x2 + x3 + x4 <=  6;


#model gomoryb.mod; 
option solver gurobi;
solve; 
display z,x1,x2,x3,x4;