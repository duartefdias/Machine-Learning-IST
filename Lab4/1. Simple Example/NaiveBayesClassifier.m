%Gaussian distribution (calculates P(x|teta))
%sd=variance ; mu=mean
%y = 1/(2*pi*sd)*exp(-(x-mu).^2/(2*sd^2)) = normpdf()

%instead of calculating the mean and var for the whole line we should be
%calculating the mean and var for each class

%calculates variance for each of the 2 rows of xtrain
sd = var(xtrain, 0, 2);
%calculates the mean for each of the 2 rows of xtrain
mu = mean(xtrain, 2);

%Calculation of P(x|teta1) - NOT what is needed
gauss1 = normpdf(xtrain(1,:), mu(1,1), sd(1,1));
%Calculation of P(x|teta2) - NOT what is needed
gauss2 = normpdf(xtrain(2,:), mu(2,1), sd(2,1));

%Visualize the result
figure;
plot(xtrain(1,:), gauss1)
hold on
plot(xtrain(2,:), gauss2)