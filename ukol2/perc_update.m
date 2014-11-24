function [ w ] = perc_update( p,x,c,lam )
%PERC_UPDATE Summary of this function goes here
%   Detailed explanation goes here
n=size(x,2);
%k=size(x,1);
x1 = [x; ones(1,n)];
for i=1:n
    y=perc_recall(p,x(:,i));
    p=p+lam*(c(i)-y)*x1(:,i)';
end
w=p;
end

