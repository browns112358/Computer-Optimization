clc
clear

addpath('Data');
%Import all the CSVs
average_income_2010=xlsread('2010_average_income.xlsx');
crime_2010=xlsread('2010_crime.xlsx');
population_2010=xlsread('2010_population.xlsx');
population_2013=xlsread('2013_population.xlsx');
unemployment_2015=xlsread('2015_unemployment.xlsx');
GDP=xlsread('GDP.xlsx');
location=xlsread('location.xlsx');


%Grab the useful Information



%Create a function to find 'Remoteness' of every location