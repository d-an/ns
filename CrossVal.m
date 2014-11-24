function [ delta, s] = CrossVal( Name1, Name1L, Par1, Name2, Name2L, Par2, Pat, DOut, k )
    
    n = size(Pat, 2);
    hranice = floor(n/k);
%%
% ulozime si indexy (odkud kam) jednotlivych skupin(foldu):
    indx = [linspace(0,k-1,k)*hranice+1; linspace(1,k,k)*hranice];
    %upravime prvek vpravem dolnim rohu pro pripad, kdyby tech
    %pozorovani bylo treba 601, aby to pak taky vyslo:
    indx(2,k)=n;
    err = zeros(k,2); %do err ulozime chyby, az je budeme mit
%%
    % rozdelim data na trenovaci a testovaci: 
for i=1:k
    
    if i==1
        Pat_train = Pat(:,indx(1,2):indx(2,k));
        DOut_train= DOut(indx(1,2):indx(2,k));
        Pat_test = Pat(:,indx(1,1):indx(2,1));
        DOut_test= DOut(indx(1,1):indx(2,1));
        n_test = indx(2,1)-indx(1,1)+1; %pro pozdejsi deleni poctu spatne klasifikovanych poctem testovacich dat
        
    elseif i==k
        Pat_train = Pat(:,indx(1,1):indx(2,k-1));
        DOut_train= DOut(indx(1,1):indx(2,k-1));
        Pat_test = Pat(:,indx(1,k):indx(2,k));
        DOut_test= DOut(indx(1,k):indx(2,k));
        n_test = indx(2,k)-indx(1,k)+1;
        
    else
        Pat_train = [Pat(:,indx(1,1):indx(2,i-1)) Pat(:,indx(1,i+1):indx(2,k))];
        DOut_train= [DOut(indx(1,1):indx(2,i-1)) DOut(indx(1,i+1):indx(2,k))];
        Pat_test = Pat(:,indx(1,i):indx(2,i));
        DOut_test= DOut(indx(1,i):indx(2,i));
        n_test = indx(2,i)-indx(1,i)+1;
    end
     
    
    % pouziju trenovaci data pro oba algoritmy a pak pro oba spocitam chybu na
    % testovacich datech: 
    LPar1 = feval(Name1, Pat_train, DOut_train, Par1);
    Out1 = feval(Name1L, LPar1, Pat_test);
    LPar2 = feval(Name2, Pat_train, DOut_train, Par2);
    Out2 = feval(Name2L, LPar2, Pat_test);
    err1 = sum(Out1~=DOut_test)/n_test;
    err2 = sum(Out2~=DOut_test)/n_test;
    % ulozime chyby do err:
    err(i,:)=[err1 err2];
end
%spocteme rozdily chyb:
err = err(:,1)-err(:,2);
%vratime prumerny rozdil chyb a odchylku:
delta = mean(err); 
s = sqrt(sum((err-delta).^2)/(k*(k-1)));
%%
end

