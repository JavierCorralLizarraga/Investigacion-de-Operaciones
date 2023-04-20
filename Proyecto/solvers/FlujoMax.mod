var xs1 >= 0 integer; var xs2 >= 0 integer; var xs3 >= 0 integer; 
var x14 >= 0 integer; var x1n >= 0 integer; 
var x24 >= 0 integer;
var x34 >= 0 integer; var x3n >= 0 integer; 
var x4n >= 0 integer;

maximize Flujo:
xs1 + xs2 + xs3;

# restricciones de conservacion
subject to Nodo1: xs1 = x14 + x1n;
subject to Nodo2: xs2 = x24;
subject to Nodo3: xs3 = x34 + x3n;
subject to Nodo4: x14 + x24 + x34 = x4n;

# restricciones de capacidad
subject to Neqc0: xs1 <= 10; 
subject to Neqc1: xs2 <= 15; 
subject to Neqc2: xs3 <= 20; 
subject to Neqc3: x14 <= 5; 
subject to Neqc4: x1n <= 10; 
subject to Neqc5: x24 <= 12;
subject to Neqc6: x34 <= 15; 
subject to Neqc7: x3n <= 5; 
subject to Neqc8: x4n <= 20;

#model FlujoMax.mod; 
option solver gurobi;
solve; 
display Flujo,xs1,xs2,xs3,x14,x1n,x24,x34,x3n,x4n;

