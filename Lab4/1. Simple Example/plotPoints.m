% Code modified by Francisco Azevedo and Duarte Dias at IST,Lisbon 2017

load('data1.mat');
% To change between test and train plot switch xtest with xtrain
%Green  -> Class 1
%Yellow -> Class 2
%Red    -> Class 3
for i = 1:50
    x = xtrain(1, i);
    y = xtrain(2, i);
    plot(x, y, 'g*')
    axis([-5 5 -2 8]);
    hold on
end

for i = 51:100
    x = xtrain(1, i);
    y = xtrain(2, i);
    plot(x, y, 'y*')
    axis([-5 5 -2 8]);
    hold on
end

for i = 101:150
    x = xtrain(1, i);
    y = xtrain(2, i);
    plot(x, y, 'r*')
    axis([-5 5 -2 8]);
    hold on
end