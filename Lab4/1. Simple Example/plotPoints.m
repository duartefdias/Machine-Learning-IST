load('data1.mat');
% To change between test and train plot switch xtest with xtrain
%Green  -> Class 1
%Yellow -> Class 2
%Red    -> Class 3
for i = 1:50
    x = xtest(1, i);
    y = xtest(2, i);
    plot(x, y, 'g*')
    hold on
end

for i = 51:100
    x = xtest(1, i);
    y = xtest(2, i);
    plot(x, y, 'y*')
    hold on
end

for i = 101:150
    x = xtest(1, i);
    y = xtest(2, i);
    plot(x, y, 'r*')
    hold on
end