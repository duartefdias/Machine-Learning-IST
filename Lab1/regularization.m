% Made by Francisco Azevedo and Duarte Dias IST, Lisbon
% Machine Learning LAB1-Linear Regression 12/10/2017

%Cleaning up the workspace and loading data
clear;
clc;
close all;
load('data3.mat')

%Create a beta matrix
P = 3;

%Compute the cost function (compare with previously obtained LS in code1.m
%LS = ((X*(beta)) - Y).^2;

%Lasso regression plot with FitInfo.Lambda taken from lasso(X,Y)
[B, FitInfo] = lasso(X,Y);
lassoPlot(B, FitInfo,'PlotType', 'Lambda', 'XScale', 'log');
%FitInfo.Lambda
%lassoPlot(B, FitInfo,'PlotType', 'Lambda', 'XScale', 'log');
FitInfo.Lambda(60)
Blasso=B(:,60);
Y_0=Blasso(1)*X(:,1)+Blasso(2)*X(:,2)+Blasso(3)*X(:,3);
figure();
%hold on;
plot(Y_0);
%plot 2o grafico

%Alinha 5. -> Ridge regression instead of Lasso regression
K = 1;
B1 = ridge(Y, X,FitInfo.Lambda);
figure();
plot(FitInfo.Lambda, B1);