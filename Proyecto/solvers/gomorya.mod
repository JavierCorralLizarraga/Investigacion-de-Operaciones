var x1 >= 0 integer;
var x2 >= 0 integer;

maximize z:
5*x1 + 9*x2;

subject to c1: -x1 + 5*x2 <= 3;
subject to c2: 5*x1 + 3*x2 <= 27;

#model gomorya.mod; 
option solver gurobi;
solve; 
display z,x1,x2;