function [ q ] = randn2d( p, kresli )
%RANDN2D Summary of this function goes here
%   Detailed explanation goes here
n=size(p,2);
q=[];
if nargin == 2
    clf
    hold on
end
for i=1:n
   x = p(2,i)+sqrt(p(4,i))*randn(1,p(1,i));
   y = p(3,i)+sqrt(p(5,i))*randn(1,p(1,i));
   q = [q, [x;y]];
   if nargin==2
     scatter(x,y);
   end
end
q=q(:,randperm(sum(p(1,:))));
hold off
end

