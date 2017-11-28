% Code developed by Francisco Azevedo and Duarte Dias at IST,Lisbon 2017
% Developed for the Lab evaluation of Machine Learning course
clear;

% Change file name here to change between 4.1-4.5
load('chess33n.mat');

% Change parameters here to change between 4.1-4.5
% Trainiing the SVM and plotting results
svmStruct = svmtrain(X,Y,'method','QP','kernel_function','rbf','rbf_sigma',1, 'boxconstraint', 0.1 ,'ShowPlot',true);

classification = svmclassify(svmStruct,X,'ShowPlot',true);

% Calculating error percentages
error_cnt = 0;

for i = 1:length(Y)
    if(classification(i) ~= Y(i))
        error_cnt = error_cnt + 1;
    end
end

classification_error = (error_cnt/length(Y))*100;
