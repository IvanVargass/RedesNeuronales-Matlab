% Red neuronal con 3 neuronas

clc; clear;

% Valor de las entradas y salidas
P1 = [0,0,1,1];
P2 = [0,1,0,1];
A1 = [0,1,0,0];
A2 = [0,0,1,0];
Y = [0,1,1,0];

% Valor de los pesos
W = [1,1,1,1,1,1,1,1,1];
for i=1:9
    W(i) = rand(1);
end

% Termino independiente
b = 1;

% Se hace el llamado a la funcion perceptron para la neurona 1
[W00,W11,W21] = perceptron(W(1),W(2),W(3),P1,P2,A1,b);
% Se hace el llamado a la funcion perceptron para la neurona 2
[W01,W12,W22] = perceptron(W(4),W(5),W(6),P1,P2,A2,b);
% Se hace el llamado a la funcion perceptron para la neurona 3
[W02,WC1,WC2] = perceptron(W(7),W(8),W(9),A1,A2,Y,b);

% Para comprobar
s1 = [0,0,0,0];
s2 = [0,0,0,0];
salida = [0,0,0,0];

% Comprobando el valor de salida de la red neuronal
for i=1:4
    y1 =( P1(i)*W11 + P2(i)*W21 + W00*b );
    y2 =( P1(i)*W12 + P2(i)*W22 + W01*b );
    
    if(y1>=b)
    y1 = 1;
    else
    y1 = 0;
    end
    
    if(y2>=b)
    y2 = 1;
    else
    y2 = 0;
    end
    
    s1(i)=y1;
    s2(i)=y2;
    
    y = ( s1(i)*WC1 + s2(i)*WC2 + W02*b );
    
    if(y>=b)
    y = 1;
    else
    y = 0;
    end
    
    salida(i) = y;
end


