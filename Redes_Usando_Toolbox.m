% Ejemplo 1
net = newp([0 1; -2 2],1,'hardlim');
P = [0 0 1 1; 0 1 0 1];
T = [0 1 1 1];
net.trainParam.epochs = 20;
net = train(net,P,T);
Y = sim(net,P)

% Ejemplo 2
P = [0 1 2 3 4 5 6 7 8 9 10; 
     0 2 4 6 8 9 10 4 3 2 5];
T = [0 1 2 3 4 3 2 1 2 3 4];
net = newff([0 10; 0 10],[5 1],{'tansig' 'purelin'});
net.trainParam.epochs = 100;
net = train(net,P,T);
Y = sim(net,P);
plot(P,T,P,Y,'o')
