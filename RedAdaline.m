
clc; clear;

% Tasa de aprendizaje
ta=0.99;

% Numero de iteracciones
contador = 0;

% Se declara el valor de las entradas
x1 = [0,0,0,1,1,1,1];
x2 = [0,1,1,0,0,1,1];
x3 = [1,0,1,0,1,0,1];

% Se declara el valor de la salida
Y = [1,2,3,4,5,6,7];

% Declaracion de los pesos
W1 = rand(1);
W2 = rand(1);
W3 = rand(1);

i=1;

% Se define el vector error
errorglobal = 1;
error = [1,1,1,1,1,1,1];

while(errorglobal ~=0)
    y = W1*x1(i)+W2*x2(i)+W3*x3(i);
    
    error(i) = Y(i) - y;
    
    W1 = W1 + ta*error(i)*x1(i);
    W2 = W2 + ta*error(i)*x2(i);
    W3 = W3 + ta*error(i)*x3(i);
    
    error(i) = abs(error(i));
    
    i = i+1;
    
    if(i==8)
        i=1;
    end
    
    errorglobal = error(1) + error(2) + error(3) + error(4) + error(5) + error(6) + error(7);
    
    contador = contador + 1;
end

salida = [0,0,0,0,0,0,0];
% Para comprobar
for i=1:7
    C = W1*x1(i)+W2*x2(i)+W3*x3(i);
    salida(i)=C;
end