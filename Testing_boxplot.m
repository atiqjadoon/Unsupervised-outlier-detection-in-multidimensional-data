%% This code is for unsupervised outlier detection using BADk scheme 
% Two parameters are adjustable according to the dataset under
% consideration. These parameters are 'k' and 'c'. The values of 'k' can
% range between 1 <= k < total number of observations in a data.
% The recommended values of c are 1.5 or 3 however these can be selected
% form a range [1,10] lower values will remove more outliers and higher
% values will remove less outliers.
% Input is given as Data which can be m x n matrix where m are observations and n are
% attributes. In order to compute AUC true labels are provided as T (size
% of T is mx1).

clear all
close all
clc

%% load a dataset and select values for k and c, examples of 3 different datasets are given.
% Simply provide your data as Data and true-labels as T, and comment the
% below section to evaluate your own data.

load T4_8K.mat; k = 25; c = 2.8;            % Dataset 1
% load cluto.mat; k = 5; c = 4;             % Dataset 2
% load complex9.mat; k = 15; c = 3;         % Dataset 3

Data=[a,b];                                 % Data contains the data with rows as observations and columns as atributes.
T=isnan(truth);
T=double(T);                                % T contains the true labels for each observation in data



%% BADk
tic
[temp,outlierPOS]=BADk(Data,c,k); % outlier detection using BADk
toc

Pre=zeros(length(truth),1);
Pre(outlierPOS)=1;




[~,~,~,AUC] = perfcurve(T,Pre,'1')            % Computing Area under the curve


%% Visual results for 2 dimensional datasets.
[~, Col]=size(Data);
if Col == 2
F=find(T==0);
F1=find(T==1);
RGB=zeros(length(Data),3);
RGB(F,:)=repmat([0.1 0.2 0.3],length(F),1);
RGB(F1,:)=repmat([1 0.5 0.5],length(F1),1);
figure
subplot(2,1,1)
scatter(a(T==0),b(T==0),[],T(T==0))
hold on
scatter(a(T==1),b(T==1),[],T(T==1))
title ('True Labels')
legend('inliers','outliers')

subplot(2,1,2)
F=find(Pre==0);
F1=find(Pre==1);
RGB=zeros(length(Data),3);
RGB(F,:)=repmat([0.1 0.2 0.3],length(F),1);
RGB(F1,:)=repmat([1 0.5 0.5],length(F1),1);
scatter(a(F),b(F),[],RGB(F,:))
hold on
scatter(a(F1),b(F1),[],RGB(F1,:))
legend('inliers','outliers')
title (['BADk Results for k = ',num2str(k),' and c1=c2= ',num2str(c)])

end


