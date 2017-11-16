% Code developed by Francisco Azevedo and Duarte Dias at IST,Lisbon 2017

% Initializing matrices for calculations
%sd=variance ; mu=mean
sd = ones(2,3);
mu = ones(2,3);

%Calculating the sd and mean for every class and every feature
for i = 1:2
    %Calculates sd for every class of current feature "i"
    sd(i,1) = var(xtrain(i,1:50),1,2);
    sd(i,2) = var(xtrain(i,51:100),1,2);
    sd(i,3) = var(xtrain(i,101:150),1,2);
    
    %Calculates mean for every class of current feature "i"
    mu(i,1) = mean(xtrain(i,1:50), 2);
    mu(i,2) = mean(xtrain(i,51:100), 2);
    mu(i,3) = mean(xtrain(i,101:150), 2);
end

%Lets predict the prob of every 
%The math is multiplying p(Xi|Cn)*p(Xi|Cn)*P(Cn) with i = 1:150 and n = 1,2,3
%P(Cn) is 1/3 for every n and p(Xi|Cn)*p(Xi|Cn) is the multiplication
%between two values of the normpdf of respective feature and class
for i = 1:150
    predict1v(i) = normpdf(xtest(1,i), mu(1,1), sd(1,1)) * normpdf(xtest(2,i), mu(2,1), sd(2,1))*(1/3);
    predict2v(i) = normpdf(xtest(1,i), mu(1,2), sd(1,2)) * normpdf(xtest(2,i), mu(2,2), sd(2,2))*(1/3);
    predict3v(i) = normpdf(xtest(1,i), mu(1,3), sd(1,3)) * normpdf(xtest(2,i), mu(2,3), sd(2,3))*(1/3);
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
        
        
        
        
