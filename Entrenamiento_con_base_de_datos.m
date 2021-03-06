% ENTRENAMIENTO DE RED NEURONAL CON TOOLBOX

% ENTRADAS
% LA PRIMERA COLUMNA REPRESENTA LA INTENSIDAD 
% LA SEGUNDA COLUMNA REPRESENTA LA DIsTANCIA L�NEA - DESCARGA
P = [43,8,34,30,11,74,41,37,14,42,30,3,57,10,16,9,17,11,54,9,13,47,8,11,16,17,22,18,31,7,20,38,16,...
     25,16,66,47,53,23,18,24,18,36,33,58,41,6,23,6,38,16; 68,27,416,114,21,433,66,497,374,242,4,219,...
     340,299,467,331,119,5,481,98,69,288,499,235,292,254,366,397,39,246,395,178,329,9,203,388,232,36,...
     123,128,112,160,16,449,18,310,435,427,82,117,269];
% SALIDAS
T = [0,1,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,1,0,0,0,0,1,0,1,0,0,0,0,0,0];

% ESTRUCTURA DE LA RED CON FUNCIONES DE ACTIVACI�N
net = newff([4 499; 4 499],[10 1],{'logsig' 'purelin'});
% N�MERO DE ITERACCIONES
net.trainParam.epochs = 500;
% ERROR PERMITIDO
net.trainParam.goal = 0.000000000001;
% ENTRENAMIENTO DE LA RED
net = train(net,P,T);
% VALIDACI�N
Y = sim(net,P);
% GR�FICA
plot(P,T,P,Y,'o')