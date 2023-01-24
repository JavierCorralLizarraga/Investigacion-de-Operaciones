% clase 5 I de O
f = [.25, .21, .22, 16, 25, 18]; % funcion de costos a minimizar
% matriz de restricciones
A = [
    1,1,1,0,0,0;
    -1,-1,-1,0,0,0;
    1,0,0,-200,0,0;
    0,1,0,0,-200,0;
    0,0,1,0,0,-200
    ];
b = [200,-200,0,0,0]'; 
intcon = 4:6; % variables enteras (por posicion de la f 
Aeq = [];
beq = [];
lb = zeros(6,1); % lower bound
ub = [Inf, Inf, Inf,1,1,1]; % upper bound
x = intlinprog(f,intcon,A,b,Aeq,beq,lb,ub)
