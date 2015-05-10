function [b] = l2regress(Data)

A = xlsread(Data);
y = A(:,6);
x = [ones(length(y),1), A(:,1:5), A(:,7:11)];

b = regress(y,x);
end
