function [p, n] = perc_learn(p,x,c,lam,maxit)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    for n=1:maxit
       if perc_err(p,x,c) == 0
           break;
       else
           p = perc_update(p,x,c,lam);
       end
    end
end

