function [ o ] = sgn( i )
%SGN Summary of this function goes here
%   Detailed explanation goes here

output = sign(i);
if i==0
    output=1;
end
o=output;

end

