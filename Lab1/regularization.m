% Made by Francisco Azevedo and Duarte Dias IST, Lisbon
% Machine Learning LAB1-Linear Regression 12/10/2017

%Cleaning up the workspace and loading data
clear;
clc;
close all;
load('data3.mat')

%% Alínea 3 -> Lasso regression plots (coefficients against lambda) with FitInfo.Lambda taken from lasso(X,Y)
[B, FitInfo] = lasso(X,Y);
lassoPlot(B, FitInfo,'PlotType', 'Lambda', 'XScale', 'log');

% Coefficients are 0 at lambda = 60 for X(:,2) so its an irrelevant feature
FitInfo.Lambda(60)
Blasso = B(:,60);


%% Alínea 4. -> Find Optimal lambda, plot y and fit to data 

% Find optimal lambda
opt_lambda =

% Creating new X and coefficients w/o irrelevant features
new_X = vertcat(X(:,1),X(:,3));
new_beta(1) = B(1,opt_lambda);
new_beta(2) = B(3,opt_lambda);

Y_0 = new_X*new_beta;

plot(Y_0);

% Plot LS w/o regularization to compare
figure();

%% Alínea 5. -> Ridge regression instead of Lasso regression
K = 1;
B1 = ridge(Y, X,FitInfo.Lambda);
figure();
plot(FitInfo.Lambda, B1);