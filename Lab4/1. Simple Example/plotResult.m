load('data1.mat');
NaiveBayesClassifier();

for i = 1:150
    if(result(i) == 1)
        x = xtest(1, i);
        y = xtest(2, i);
        plot(x, y, 'g*')
        hold on
    elseif(result(i) == 2)
        x = xtest(1, i);
        y = xtest(2, i);
        plot(x, y, 'y*')
        hold on
    elseif(result(i) == 3)
        x = xtest(1, i);
        y = xtest(2, i);
        plot(x, y, 'r*')
        hold on
    end
end