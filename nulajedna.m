function [ output ] = nulajedna( input )
%NULAJEDNA Summary of this function goes here
%   Detailed explanation goes here
k=10;
n = size(input,2);
out = zeros(k,n);
for i=1:n
    if input(i)==0
        out(:,i)=[1, zeros(1,9)]';
    elseif input(i)==9
        out(:,i)=[zeros(1,9), 1]';
    else
        out(:,i)=[zeros(1,input(i)), 1, zeros(1,9-input(i))]';
    end
end
output = out;

