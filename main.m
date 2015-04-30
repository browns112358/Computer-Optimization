clc
clear

addpath('Data');

Data=xlsread('MASTER_DATA.xlsx');

remoteness=remote(Data)
