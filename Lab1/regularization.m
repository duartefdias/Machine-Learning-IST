% Made by Francisco Azevedo and Duarte Dias IST, Lisbon
% Machine Learning LAB1-Linear Regression 12/10/2017

%Cleaning up the workspace and loading data
clear;
clc;
close all;
load('data3.mat')

%Create a beta matrix
P = 3;
beta = zeros(50, 3);

%Compute the cost function
LS = ((X*(beta)) - Y).^2;

%Lasso regression plot with FitInfo.Lambda taken from lasso(X,Y)
[B, FitInfo] = lasso(X,Y);
lassoPlot(B, FitInfo,'PlotType', 'Lambda', 'XScale', 'log');
%FitInfo.Lambda
%lassoPlot(B, FitInfo,'PlotType', 'Lambda', 'XScale', 'log');

%Alinha 5. -> Ridge regression instead of Lasso regression
K = 1;
B1 = ridge(X,Y,K);
lassoPlot(B1);