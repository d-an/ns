function [ delta, s ] = CrossVal( Name1, Name1L, Par1, Name2, Name2L, Par2, Pat, DOut, k )
    
% docasne promenne kvuli testovani:
%%
    In = randn(2, 600);
    c = In(1,:)-3*In(2,:)>=0.5;
    Par1 = {[1 1 -1], 1, 10};
    Par2 = {[1 1 -1], 1, 100};
    Name1 = 'PLearn';
    Name1L = 'PRecall';
    Name2 = 'PLearn';
    Name2L = 'PRecall';
    Pat=In;
    DOut=c;
    k=5;
%%


    n = size(Pat, 2);
    hranice = floor(n/k);
    rndprm = randperm(n);
%%
% zpermutujeme poradi vzoru:
    Pat = Pat(:,rndprm);
    DOut = DOut(rndprm);
%%
% ulozime si indexy (odkud kam) jednotlivych skupin(foldu):
    indx = [linspace(0,k-1,k)*hranice+1; linspace(1,k,k)*hranice];
    %upravime prvek vpravem dolnim rohu pro pripad, kdyby tech
    %pozorovani bylo treba 601, aby to pak taky vyslo:
    indx(2,k)=n;
    err = zeros(k,2);
%%
    % rozdelim data na trenovaci a testovaci (Pat1 je trenovaci, Pat2 je
    % testovaci):
for i=1:k
    
    if i==1
        Pat1 = Pat(:,indx(1,2):indx(2,k));
        DOut1= DOut(indx(1,2):indx(2,k));
        Pat2 = Pat(:,indx(1,1):indx(2,1));
        DOut2= DOut(indx(1,1):indx(2,1));
        
    elseif i==k
        Pat1 = Pat(:,indx(1,1):indx(2,k-1));
        DOut1= DOut(indx(1,1):indx(2,k-1));
        Pat2 = Pat(:,indx(1,k):indx(2,k));
        DOut2= DOut(indx(1,k):indx(2,k));
    
    else
        Pat1 = [Pat(:,indx(1,1):indx(2,i-1)) Pat(:,indx(1,i+1):indx(2,k))];
        DOut1= [DOut(indx(1,1):indx(2,i-1)) DOut(indx(1,i+1):indx(2,k))];
        Pat2 = Pat(:,indx(1,i):indx(2,i));
        DOut2= DOut(indx(1,i):indx(2,i));
    end
     
    
    %Pat1 = Pat(:,1:300);
    %Pat2 = Pat(:,301:600);
    %DOut1 = DOut(1:300);
    %DOut2 = DOut(301:600);
    
    % pouziju trenovaci data pro oba algoritmy a pak pro oba spocitam chybu na
    % testovacich datech: 
    LPar1 = feval(Name1, Pat1, DOut1, Par1);
    Out1 = feval(Name1L, LPar1, Pat2);
    LPar2 = feval(Name2, Pat1, DOut1, Par2);
    Out2 = feval(Name2L, LPar2, Pat2);
    err1 = sum(Out1~=DOut2);
    err2 = sum(Out2~=DOut2);
    % ulozime chyby:
    err(i,:)=[err1 err2];
end
%%
end

