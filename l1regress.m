function [bhat] = l1regress(Data)

A = xlsread(Data);
y = A(:,6);
x = [ones(length(y),1), A(:,1:5), A(:,7:11)];

n=size(x,1);
m=size(x,2);
% vectors and matrices for linprog
f=[ones(n,1);ones(n,1);zeros(m,1)];
Aeq=[eye(n),-eye(n),x];
beq=y;
lb=[zeros(n,1);zeros(n,1);-inf*ones(m,1)];
ub=inf*ones(m+2*n,1);

% Solve the linear program
[bhat,~,~]=linprog(f,[],[],Aeq,beq,lb,ub);

% Pick out betas from (u,v,beta)-vector.
bhat=bhat(end-m+1:end);

end
