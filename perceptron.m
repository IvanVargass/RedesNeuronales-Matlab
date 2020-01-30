
function [w0,w1,w2] = perceptron(w0,w1,w2,x1,x2,Y,b0)

% Valor de errores
error = [1,1,1,1];
errorglobal = error(1) + error(2) + error(3) + error(4);

i = 1;

while(errorglobal~=0)
        y =( w1*x1(i) + w2*x2(i) + w0*b0);
        
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
end

end