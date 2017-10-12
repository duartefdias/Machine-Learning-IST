% Made by Francisco Azevedo and Duarte Dias IST, Lisbon
% Machine Learning LAB1-Linear Regression 12/10/2017

%Cleaning up the workspace and loading data
clear;
clc;
close all;
load('data3.mat');

%% Alínea 3. -> Lasso regression plot with FitInfo.Lambda taken from lasso(X,Y)
[B, FitInfo] = lasso(X,Y);
lassoPlot(B, FitInfo,'PlotType', 'Lambda', 'XScale', 'log');

%% Alínea 4. -> Plot Y and fit to data. Compute cost with and w/o LASSO
mean_x1 = mean(X(:,1));
mean_x2 = mean(X(:,2));
mean_x3 = mean(X(:,3));
mean_y = mean(Y);

c_X(:,1) = X(:,1) - mean_x1;
c_X(:,2) = X(:,2) - mean_x2;
c_X(:,3) = X(:,3) - mean_x3;
c_Y = Y - mean_y;

FitInfo.Lambda(60)
Blasso_60 = B(:,60);
Blasso_1 = B(:,1);

% Equations for fit with and w/o LASSO
Y_LS = Blasso_1(1)*c_X(:,1) + Blasso_1(2)*c_X(:,2) + Blasso_1(3)*c_X(:,3);
Y_lasso = Blasso_60(1)*c_X(:,1) + Blasso_60(3)*c_X(:,3);

%Calculate cost without LASSO
cost_LS = sum(((Y_LS) - c_Y).^2);

%Calculate cost with LASSO
cost_lasso = sum(((Y_lasso) - c_Y).^2);  

%plot 2o grafico
figure();
plot(Y_lasso);
hold on;
plot(Y_LS);
title('Plot of Y value (with and w/o LASSO) against X');
ylabel('Y data');
xlabel('X data');

%% Alínea 5. -> Ridge regression instead of Lasso regression
K = 1;
B1 = ridge(Y, X,FitInfo.Lambda);

% Equation for fit with Ridge
Y_ridge = B1(1,60)*c_X(:,1) + B1(2,60)*c_X(:,2) + B1(3,60)*c_X(:,3);

% Calculate cost for Ridge
cost_ridge = sum(((Y_ridge) - c_Y).^2);

plot(Y_ridge);
legend('LASSO','LS','Ridge');

figure();
plot(FitInfo.Lambda, B1);
title('Trace plot of coefficients fit by Ridge');
xlabel('Lambda');