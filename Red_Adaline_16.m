
clc; clear;

% Tasa de aprendizaje
ta=0.6;

% Contador de iteracciones
contador = 0;

% Se declara el valor de las entradas
x1 = [0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1];
x2 = [0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1];
x3 = [0,0,0,0,1,1,1,1,0,0,0,0,1,1,1,1];
x4 = [0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1];

% Se declara el valor de la salida
Y = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15];

% Declaracion de los pesos
W1 = rand(1);
W2 = rand(1);
W3 = rand(1);
W4 = rand(1);

i=1;

errorglobal = 1;
error = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1];

while(errorglobal ~= 0)
    y = W1*x1(i)+W2*x2(i)+W3*x3(i)+W4*x4(i);
    
    error(i) = Y(i) - y;
    
    W1 = W1 + ta*error(i)*x1(i);
    W2 = W2 + ta*error(i)*x2(i);
    W3 = W3 + ta*error(i)*x3(i);
    W4 = W4 + ta*error(i)*x4(i);
    
    error(i) = abs(error(i));
    
    i = i+1;
    
    if(i==17)
        i=1;
    end
    
    errorglobal = error(1) + error(2) + error(3) + error(4) + error(5) + error(6) + error(7) + error(8) + ...
        error(9) + error(10) + error(11) + error(12) + error(13) + error(14) + error(15) + error(16);
    
    contador = contador + 1;
end

salida = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
% Para comprobar
for i=1:16
    C = W1*x1(i)+W2*x2(i)+W3*x3(i)+W4*x4(i);
    salida(i)=C;
end