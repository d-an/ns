for i=1:9
    Wecka{i}=digits(:,i)/digits(:,i)
end
%%
for i=1:9
    wecko=zeros(48,48)
    for j=1:9
        wecko=wecko+Wecka{j}
    end
    Wecka2{i}=wecko
end

%%

k=1;
for i=1:k
    subplot(1,k,i)
    imagesc(reshape(sgn(Wecka2{k}*digits(:,i)),8,6))
end
%%

perm=randperm(4)
W(perm(1),:)
W
%%
