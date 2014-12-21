w_i_h = [ 1.40000 0.40000
         -2.00000 0.80000];

w_h_o = [2.30000 -1.00000];

b_h = [ 0.00000
       -0.50000];

b_o = 0.40000;

w_i_hb=[w_i_h b_h];

w_h_ob=[w_h_o b_o];
alpha=1.2;
p2=[1; -1];
desired = 0.2;
%%

%vystup site pred prvni upravou vah vychazi (y_o):
p2_rozs = [p2; 1]; 
y_h = logsig(w_i_hb*p2_rozs); %vystup skryte vrstvy
y_h_rozs = [y_h; 1];
y_o = w_h_ob*[y_h; 1]; %2.0459, ma byt ale 0.2

%%
delta_o = (desired - y_o)*alpha*y*(1-y_o);
%%
w_h_ob_2 = w_h_ob + alpha*delta_o.*y_h_rozs'; % nove vahy ze skryte do vystupni vrstvy
%%
delta_h = w_h_ob'*delta_o*alpha.*y_h_rozs.*(1-y_h_rozs); % delty ve skryte vrstve
%%
w_i_hb_2 = w_i_hb + alpha*[p2_rozs'; p2_rozs'].*[delta_h(1:2) delta_h(1:2) delta_h(1:2)] %nove vahy ze vstupni do skryte vrstvy
 %%

% nyni spocitejme vystup site s pouzitim techto aktualizovanych vah:
y_h_2 = logsig(w_i_hb_2*p2_rozs); %vystup skryte vrstvy
y_h_2_rozs = [y_h_2; 1];
y_o_2 = w_h_ob_2*[y_h_2; 1]; 
