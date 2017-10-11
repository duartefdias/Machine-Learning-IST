% Made by Francisco Azevedo and Duarte Dias IST, Lisbon
% Machine Learning LAB1-Linear Regression 12/10/2017

%Cleaning up the workspace and loading data
clear;
clc;
close all;
load('data3.mat');

%% Al�nea 3. -> Lasso regression plot with FitInfo.Lambda taken from lasso(X,Y)
[B, FitInfo] = lasso(X,Y);
lassoPlot(B, FitInfo,'PlotType', 'Lambda', 'XScale', 'log');

%% Al�nea 4. -> Plot Y and fit to data. Compute cost with and w/o regula.
FitInfo.Lambda(60)
Blasso_60 = B(:,60);
Blasso_1 = B(:,1);

% Equations for fit with and w/o regularization
Y_no_lambda = Blasso_1(1)*X(:,1) + Blasso_1(2)*X(:,2) + Blasso_1(3)*X(:,3);
Y_lambda = Blasso_60(1)*X(:,1) + Blasso_60(3)*X(:,3);

%Calculate cost with and without regularization
cost_no_lambda = sum(((X*(Blasso_60)) - Y).^2);

new_X = vertcat(X(:,1), X(:,3)); 
cost_lambda = sum(((X*(Blasso_60)) - Y).^2) + sum(abs(Blasso_60));  

%plot 2o grafico
figure();
plot(Y_lambda);
hold on;
plot(Y_no_lambda);

%% Al�nea 5. -> Ridge regression instead of Lasso regression
K = 1;
B1 = ridge(Y, X,FitInfo.Lambda);
figure();
plot(FitInfo.Lambda, B1);