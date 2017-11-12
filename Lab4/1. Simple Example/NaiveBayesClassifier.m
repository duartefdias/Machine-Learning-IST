%Gaussian distribution (calculates P(x|teta))
%sd=variance ; mu=mean
%y = 1/(2*pi*sd)*exp(-(x-mu).^2/(2*sd^2)) = normpdf()

% %Calculation of P(x|teta1) - NOT what is needed
% gauss1 = normpdf(xtrain(1,:), mu(1,1), sd(1,1));
% %Calculation of P(x|teta2) - NOT what is needed
% gauss2 = normpdf(xtrain(2,:), mu(2,1), sd(2,1));

% %Visualize the result
% figure;
% plot(xtrain(1,:), gauss1)
% hold on
% plot(xtrain(2,:), gauss2)

%Calculating the sd and mean for every class and every feature
sd = ones(2,3);
mu = ones(2,3);

for i = 1:2
    %Calculates sd for every class of current feature
    sd(i,1) = var(xtrain(i,1:50),1,2);
    sd(i,2) = var(xtrain(i,51:100),1,2);
    sd(i,3) = var(xtrain(i,101:150),1,2);
    
    %Calculates mean for every class of current feature
    mu(i,1) = mean(xtrain(i,1:50), 2);
    mu(i,2) = mean(xtrain(i,51:100), 2);
    mu(i,3) = mean(xtrain(i,101:150), 2);
end

%Example: lets predict the prob of an example belonging to class 1
%The math is just multiplying p(x1|C1)*p(x2|C1)*P(C1)
predict1 = normpdf(xtest(1,70), mu(1,1), sd(1,1))*normpdf(xtest(2,70), mu(2,1), sd(2,1))*(1/3)

%Class 2?
predict2 = normpdf(xtest(1,70), mu(1,2), sd(1,2))*normpdf(xtest(2,70), mu(2,2), sd(2,1))*(1/3)

%HOW ABOUT 3 YOU MOFOS?
predict3 = normpdf(xtest(1,70), mu(1,3), sd(1,3))*normpdf(xtest(2,70), mu(2,3), sd(2,3))*(1/3)

disp('winner is 2 MOFOS!')

for i = 1:150
    predict1v(i) = normpdf(xtest(1,i), mu(1,1), sd(1,1))*normpdf(xtest(2,i), mu(2,1), sd(2,1))*(1/3);
    predict2v(i) = normpdf(xtest(1,i), mu(1,2), sd(1,2))*normpdf(xtest(2,i), mu(2,2), sd(2,2))*(1/3);
    predict3v(i) = normpdf(xtest(1,i), mu(1,3), sd(1,3))*normpdf(xtest(2,i), mu(2,3), sd(2,3))*(1/3);
end

miss = 0;

for i = 1:150
    if predict1v(i) > predict2v(i) && predict1v(i) > predict3v(i)
        result(i) = 1;
    end
    if predict2v(i) > predict1v(i) && predict2v(i) > predict3v(i)
        result(i) = 2;
    end
    if predict3v(i) > predict1v(i) && predict3v(i) > predict2v(i)
        result(i) = 3;
    end
    if result(i) ~= ytest(i)
        miss = miss + 1;
    end
end

 %Error in %
 error = miss/150;
 disp('calculated error is:')
 disp(error)
        
        
        
        
