
clc; clear;

% Varible contandor
contador = 0;

% Valor de las entradas
x1 = [0,1,0,0];
x2 = [0,0,1,0];

% Valor de la salida
Y = [0,1,1,0];

% Valor de los pesos
w0 = rand(1);
w1 = rand(1);
w2 = rand(1);
% w0 = 1.5; 
% w1 = 0.5;
% w2 = 1.5;
b0 = 1;

% Valor de errores
error = [1,1,1,1];
errorglobal = error(1) + error(2) + error(3) + error(4);

i = 1;

while(errorglobal~=0)
        y=( w1*x1(i) + w2*x2(i) + w0*b0);
        
        if(y>=b0)
        y = 1;
        else
        y = 0;
        end
        
        error(i) = Y(i) - y;
        
        if(error(i) ~= 0)
            w1 = w1 + (error(i) * x1(i));
            w2 = w2 + (error(i) * x2(i));
            w0 = w0 + (error(i) * b0);
        end
        
        error(i) = abs(error(i));
        
        if(i==4)
            i = 1;
        else
            i = i + 1;
        end
        
        errorglobal = error(1) + error(2) + error(3) + error(4);
        
        contador = contador + 1;
end

vector = [0,0,0,0];
% Para comprobar
for i=1:4
    C =( w1*x1(i) + w2*x2(i) + w0*b0 );
    if(C>=b0)
    C = 1;
    else
    C = 0;
    end
    vector(i)=C;
end

