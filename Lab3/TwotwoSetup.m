net = fitnet(40);
net.layers{2}.transferFcn='purelin';

net.performFcn='mse';
net.trainParam.show=10000; % # of epochs in display
net.trainParam.epochs=10000;% max epochs
net.trainParam.goal=0.005; % training goal