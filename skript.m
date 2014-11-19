
p = [1 1 -1]
    

%%
x = [1 2 1 4; 
    -1 -3 4 2]
%%
    c=[0 1 0 1]
    %%
    
lam=1
perc_recall(p, x(:,1))
%%
extended = [x(:,1); ones(1, size(x(:,1),2))]

p*extended