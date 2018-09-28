%Calculate the coefficient of variation
%Input data set:
%	-Measurement data for which coefficient of variation should be calculated
%Further reading:
%	Vangel, M. G. (1996) "Confidence intervals for a normal coefficient of variation"...
%		The American Statistician 50 (1): 21-26.

%Author: Manuel Weinkauf (Manuel.Weinkauf@unige.ch)
%Version: 1.0
%Date: 14 November 2016

%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%
%This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License.%
%To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/3.0/.                   %
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%

%Creation of test dataset
%v1=randi([4,7],1,10)
%v2=randi([2,12],1,10)

%--------------------------------------------

%Example
%[coeff,ci1,ci2]=coef_var(v1,0.95)
%[coeff,ci1,ci2]=coef_var(v2,0.90)

%--------------------------------------------
%Version History
%1.0	Finished Program
%--------------------------------------------

%**************************************************************************************
%Setting working directory
%cd("C:/R_TestData")

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Function to calculate coefficient of variation incl. 95% confidence...%
%   interval                                                            %
% Necessary input variables:                                            %
%   data: Data values for which coefficient of variatio...              %
%         and its confidence interval should be calculated.             %
%         *1xX*                                                         %
%   conf: Desired level of confidence.                                  %
%         *1x1*                                                         %
% Output data: Coefficient of variation (coeff) and associated...       %
%              confidence interval (ci1, ci2) per group in all...       %
%              parameters.                                              %
% Input dataset: Data for which calculations should be performed...     %
%                (data) and desired confidence level (conf).            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [coeff,ci1,ci2] = coef_var(data,conf)
	%Coefficient of variation
	sd=std(data);
	m=mean(data);
	coeff=sd/m;
	
	%Confidence auxiliary variables
	conf=1-conf;
	v=length(data)-1;
	u1=chi2inv(1-conf/2,v);
	u2=chi2inv(conf/2,v);
	
	%Confidence intervals
	ci1=coeff.*((((((u1+2)/(v+1))-1).*(coeff.^2))+(u1/v)).^(-0.5));
	ci2=coeff.*((((((u2+2)/(v+1))-1).*(coeff.^2))+(u2/v)).^(-0.5));
end