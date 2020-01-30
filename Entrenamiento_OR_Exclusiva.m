% Entrenamiento Backpropagetion
% Compuerta OR
clc; clear all;

% Factor de aprendizaje
n = 0.01;
iteracciones = 0;

% Valor de las entradas
X1 = [5,2,4,10];
X2 = [10,2,6,3];

% Valor de la salida
Y = [0,1,0,1];

% Inicialización aleatoria de los pesos
W = [1,1,1,1,1,1,1,1,1,1,1,1,1,1];
for i=1:14
    W(i) = rand(1);
end

i=1;

% Se declara el error
errorglobal = 4;
error = [1,1,1,1];

while (errorglobal ~= 0)
    
    % Se encuentran las salidas de la primera capa
    Y1 = tansig((W(1)*X1(i)+W(2)*X2(i)));
    Y2 = tansig((W(3)*X1(i)+W(4)*X2(i)));
    Y3 = tansig((W(5)*X1(i)+W(6)*X2(i)));
    % Se encuentran las salidas de la segunda capa
    Y4 = tansig((W(7)*Y1+W(8)*Y2+W(9)*Y3));
    Y5 = tansig((W(10)*Y1+W(11)*Y2+W(12)*Y3));
    % Se encuentra la salida de la tercera capa
    Y6 = hardlim((W(13)*Y4+W(14)*Y5));
    
    % Calculamos el error
    error(i) = Y(i) - Y6;
    
    % Se sacan los gradiente locales de cada neurona
    g4 = W(13)*error(i);
    g5 = W(14)*error(i);
        
    g1 = W(7)*g4 + W(10)*g5;
    g2 = W(8)*g4 + W(11)*g5;
    g3 = W(9)*g4 + W(12)*g5;
    
    %Se ajustan los pesos 
    W(1) = W(1) + n*g1*((1-Y1^2))*X1(i);
    W(2) = W(2) + n*g1*((1-Y1^2))*X2(i);       
    W(3) = W(3) + n*g2*((1-Y2^2))*X1(i);
    W(4) = W(4) + n*g2*((1-Y2^2))*X2(i);
    W(5) = W(5) + n*g3*((1-Y3^2))*X1(i);       
    W(6) = W(6) + n*g3*((1-Y3^2))*X2(i);
    
    W(7) = W(7) + n*g4*((1-Y4^2))*Y1;
    W(8) = W(8) + n*g4*((1-Y4^2))*Y2;
    W(9) = W(9) + n*g4*((1-Y4^2))*Y3;
    
    W(10) = W(10) + n*g5*((1-Y5^2))*Y1;
    W(11) = W(11) + n*g5*((1-Y5^2))*Y2;
    W(12) = W(12) + n*g5*((1-Y5^2))*Y3;
    
    W(13) = W(13) + n*(0)*error(i)*Y4;
    W(14) = W(14) + n*(0)*error(i)*Y5;
    
    error(i) = abs(error(i));
    
    %Error global
    errorglobal = error(1) + error(2) + error(3) + error(4)
    
    i = i + 1;
    iteracciones = iteracciones + 1;
    
    if(i==5)
        i = 1;
    end
    
    % Error aceptable
    if(errorglobal <= 0.01)
        break;
    end
    
end

salida = [1,1,1,1];
% Se comprueba la salida de la red neuronal
for i = 1:4
    % Se encuentran las salidas de la primera capa
    Y1 = tansig((W(1)*X1(i)+W(2)*X2(i)));
    Y2 = tansig((W(3)*X1(i)+W(4)*X2(i)));
    Y3 = tansig((W(5)*X1(i)+W(6)*X2(i)));
    % Se encuentran las salidas de la segunda capa
    Y4 = tansig((W(7)*Y1+W(8)*Y2+W(9)*Y3));
    Y5 = tansig((W(10)*Y1+W(11)*Y2+W(12)*Y3));
    % Se encuentra la salida de la tercera capa
    Y6 = hardlim((W(13)*Y4+W(14)*Y5));
    
    % Calculamos el error
    salida(i) = Y6;
end
disp(salida);