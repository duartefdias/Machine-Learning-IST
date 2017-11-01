net = patternnet([15]);
net.performFcn = 'mse';
net.layers{1}.transferFcn = 'tansig';
net.layers{2}.transferFcn = 'tansig';

net.divideFcn = 'divideind';
net.divideParam.trainInd = 1:400;
net.divideParam.trainInd = 401:560;


%Train neural network
net.trainFcn = 'traingdx'
net.trainParam.lr = 3; %1.1 for mementum 3 for step
net.trainParam.mc = 0.7; %0.6 for mementu 0.55 for step
net.trainParam.show = 10000;
net.trainParam.epochs = 10000;
net.trainParam.goal = 0.05;

[net,tr]=train(net,X,T);

x_test = X(:,tr.testInd);
t_test = T(:,tr.testInd);
y_test = net(x_test);
plotconfusion(t_test,y_test);
