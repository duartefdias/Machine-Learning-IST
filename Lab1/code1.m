% Made by Francisco Azevedo and Duarte Dias IST, Lisbon
% Machine Learning LAB1-Linear Regression 12/10/2017

%Cleaning up the workspace and loading data
clear;
clc;
close all;

%Data to be SELECTED BY USER
load('data1.mat');
P = 2;

%Expand original data to match polynomial degree of the used model
beta = zeros(P+1, 1);
x = feature_map(x, P);

%Computes LS estimation and fits the polynomial (degree P) to data
LS = compute_cost(x, y, beta);
beta = normal(x, y, beta);

%Sorting the arrays to have proper plots
sorted_x = sort(x(:,2));
sorted_y = ones(length(y),1);

y1= x*beta;

for i = 1:length(x)
    for j = 1:length(x)
        if(sorted_x(i) == x(j,2))
            sorted_y(i) = y1(j);
        end
    end
end

%Plots data
plot(x(:,2), y, 'rx', 'MarkerSize', 10);
hold on;

%Plots the fitted polynomial
plot(sorted_x , sorted_y(:,1), '-');
ylabel('y data');
xlabel('x data');
title('fitted polynomial to data');
