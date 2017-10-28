net = fitnet(40);  %single hidden layer with 0 units
net.layers{2}.transferFcn='purelin'; %setting the activation of the output layer to linear

net.performFcn='mse'; %defining cost function = mean squared error
net.trainParam.show=10000; % # of epochs in display
net.trainParam.epochs=10000;% max epochs
net.trainParam.goal=0.005; % training goal

%Start Neural Network Toolbox GUI
%nnstart

%Training without validation set
net.divideParam.trainRatio = 1;
net.divideParam.valRatio   = 0;
net.divideParam.testRatio  = 0;

%Train neural network
[net,tr]=train(net,X,T)