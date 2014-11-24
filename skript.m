stream = RandStream.getGlobalStream; reset(stream)
In = randn(2, 600);
c = In(1,:)-3*In(2,:)>=0.5;
Par1 = {[1 1 -1], 1, 10};
Par2 = {[1 1 -1], 1, 100};

%porovnani perceptronoveho algoritmu pro 10 a 100 epoch:
[d,s] = CrossVal('PLearn', 'PRecall', Par1, 'PLearn', 'PRecall', Par2, In, c, 5)

t = tinv(0.975, 4);

% 95% interval spolehlivosti pro rozdil chyby:
[d-s*t, d+s*t]

%%
stream = RandStream.getGlobalStream; reset(stream)
In = randi(20, 4, 300);
c = In(1,:)-3*In(2,:)+2*In(3,:)-In(4,:)>=0;
Par3 = {[1 1 1 1 -1], 1, 40};
%%
[d,s] = CrossVal('PLearn', 'PRecall', Par3, 'Memorizer', 'MemorizerRecall', Par3, In, c, 6)
t = tinv(0.975, 5)

% 95% interval spolehlivosti pro rozdil chyby:
[d-s*t, d+s*t]

%%