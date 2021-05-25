# Unsupervised outlier detection in multidimensional data
This code is for unsupervised outlier detection using BADk scheme 
Two parameters are adjustable according to the dataset under consideration. These parameters are 'k' and 'c'. The values of 'k' can range between 1 <= k < m, where m is total number of observations in a data. The recommended value of c is 1.5 or 3 however this can be selected form a range [1,10]. Small values of c will remove more outliers and larger values will remove less outliers.

Input is given as a variable saved by name 'Data' which can be m x n matrix where m are observations and n are attributes. In order to compute AUC true labels are provided as a variable named as 'T' (size of T is mx1).

For Demo, run Testing_boxplot.m' file, where three datasets are provided as demonstration. Uncomment the data of your choice, by default dataset 1 is being used.

We request you to cite the following if you use this code:
1. Rehman, Atiq, and Samir Brahim Belhaouari. "Unsupervised Outlier Detection in Multidimensional Data.", Journal of Big Data, (2021).
