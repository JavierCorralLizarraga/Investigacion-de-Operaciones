param D1 := 824;
param D2 := 735;
param D3 := 683;
param D4 := 575;
param P1 := 71.39;
param P2 := 100.63;
param P3 := 50.63;
param A1 := 2538;
param A2 := 3604;
param A3 := 2533;
param K1 := 187547;
param K2 := 471471;
param K3 := 167719;
param C12 := 86;
param C34 := 86;
param C14 := 65;
param C32 := 65;
param C24 := 72;
param C22 := 72;
param C21 := 36;
param C23 := 40;
param C11 := 54;
param C33 := 57;
var B1 binary;
var B2 binary;
var B3 binary;

minimize z: 
B1*K1 + B2*K2 + B3*K3 + B1*P1 + B2*P2 + B3*P3 + B1*C11 + B1*C12 + B1*C14 + B2*C21 + B2*C22 + B2*C23 + B2*C24 + B3*C32 + B3*C33 + B3*C34;

# restriccion de capacidad
subject to c1: B1*A1 <= D1 + D2 + D4; 
subject to c2: B2*A2 <= D2 + D3 + D4; 
subject to c3: B3*A3 <= D1 + D2 + D3 + D4;
# restriccion demanda 
subject to c4: B1*A1 + B2*A2 + B3*A3 >= D1 + D2 + D3 + D4; 
subject to c5: B1*A1 + B2*A2 >= D1; 
subject to c6: B1*A1 + B2*A2 + B3*A3 >= D2; 
subject to c7: B2*A2 + B3*A3 >= D3; 
subject to c8: B1*A1 + B2*A2 + B3*A3 >= D4; 
# restriccion 2 almacenes
subject to c9: B1+B2+B3 = 2;

solve;

display z, B1, B2, B3;

