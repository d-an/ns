%% Jednoduchý úvod do MATABu
% Názov je skratka MATrix LABoratory
% Program navrhnutý na maticové výpočty pred viac než 20 rokmi
%% 
% 
%  Hlavné použitie programu:
% 
% * riešenie sústav lineárnych rovníc
% * počítanie vlastných čísel, vlastných vektorov
% * faktorizácia matíc
% * bohaté grafické možnosti
% * vlastný programovací jazyk
% * navrhnutý na numerické riešenie - nie symbolické (ale už tiež umožňuje
% pomocou špecializovaných balíkov - Toolboxov)
%% 
% Absolútna väčšina funkcií MATLABu je implementovaná v |GNU Octave|.
% |Octave| je voľne šíriteľné vo verziách pre Unix (Linux) i pre Windows.
% Nemá grafické IDE. Nemá toolboxy. Kreslenie grafov nie je v |Octave|
% integrované. Typicky sa rieši pomocou |GNU Plot|.
%% Jednoduché výpočty
% Ako vkladať čísla, vektory a matice a základné výpočty s nimi.
% 
% Základným dátovým typom sú n-rozmerné polia (primárne dvojrozmerné -
% matice) reálnych čísel. Zapisujú sa do hranatých zátvoriek. Oddeľovačom
% sú medzery, tabelátory a čiarky v riadkoch, stredníky a znaky konca riadku
% oddeľujú riadky. Najprv vektory - riadkový |x| a stĺpcový |y|. Ich súčinom je
% matica.
x=[2,3,4]
%%
y=[1;2]
%%
z=y*x

%% 
%  Vloženie matice
% 
% * na jednom riadku, alebo
% * na viacerých riadkoch
A=[2.3  4.8 9.2; 21.34 1.3e12 9] 
%%
% Pri výpise matice |A| je pred maticou vypísaný spoločný koeficient
% |1.0e+012 *|, ktorým majú byť vynásobené všetky prvky matice
B = [ 1 9 23
        21 2 1
        9 11 99]
%%
% Skaláry sú matice s rozmermi |1x1|
a = 3.1
%%
u = a*z
%% 
% MATLAB rozlišuje veľké a malé písmená. Premenné sa nedeklarujú. Zoznam
% definovaných premenných sa zistí príkazom |who|
who
%%
% Podrobnejšie informácie o premenných dá príkaz |whos| alebo okno
% *Workspace*
whos
%%
% Aritmetika MATLABu je "robustná"
nekonecno = a/0
%%
nula = 1 / nekonecno
%%
CoJeTo = nekonecno / nekonecno
%%
% Vydrží aj odmocňovanie záporných čísel
sqrt(-1)
%%
% MATLAB vie počítať s komplexnými číslami. Imaginárna jednotka sa značí
% buď |i| alebo |j|
(1+2i)*(1-2j)
%%
% MATLAB je vlastne veľmi výkonná kalkulačka. Výsledok posledného výrazu
% (neuloženého do premennej) je v premennej |ans|
% 
2^3
%%
2^4
%%
2^100
%%
20^3-3*23/8
%%
sqrt(ans)
%%
% Ovláda mnoho aritmetických, goniometrických a iných funkcií:
sin(4)
%%
sin(3*pi)+cos(1.23)^2
%%
log(2430)
%%
% Aký základ používa funkcia |log|? Pomôže nám nápoveda
help log
%%
% Dokonalejšia nápoveda je hypertextová nápoveda prístupná cez tlačítko
% |Start > Help| alebo cez tlačítko so znakom '?' v modrom krúžku na
% toolbare pod menu. O funkciách sa dá ľahko zistiť nápoveda cez tlačítko _fx_ 
% vedľa promptu v príkazovom okne *Command Window*. Ďalšími možnosťami sú
% demo-videa a demo príklady.
%%
% 
% <<FuncHelp.jpg>>
% 
%% Aritmetické operácie s maticami
% Bežné aritmetické operácie ale i *delenie maticou*!
%
% *Štandardné operácie*
%
% Ak výraz končí bodkočiarkou ';', tak sa jeho výsledok nezobrazí.
% Sčítanie, odčítanie
A = [1 2 3; 2 3 1; 0 7 3];
B = [1 1 1; 3 2 1; 7 6 5];
C = [3 3; 3 3; 4 3];
whos
%%
A+B
%%
A-B
%%
% Príkaz A+C; spôsobí chybové hlásenie
% 
%  Error using ==> plus
%  Matrix dimensions must agree.
%
%  Error in ==> Uvod at 124
%
%%
% Maticové násobenie:
D = A*C
%%
A*B
%%
B
%%
% Násobenie skalárom:
3*B
%%
% Násobenie po zložkách |.*|:
A.*B
%%
% *Transpozícia matice*
%
% Pre maticu reálnych čísel |A| je |A'| transponovaná matica k matici |A|.
A = [ 1 2 3; 4 5 6]
%%
A'
%%
% V skutočnosti je |A'| matica (komplexne) konjugovaná k matici |A|, to
% znamená, že ak |A| obsahuje komplexné čísla s nenulovou imaginárnou
% časťou, tak po transpozícii sú u imaginárnych častí opačné znamienka
B = A+i*(rand(2,3)-0.5)
%%
B'
%%
% Ak aj v prípade komplexných čísel potrebujeme iba transponovanú maticu
% bez zmeny znamienok, tak sa pred apostrof vloží bodka:
B.'
%%
% *Generovanie matíc*
%
% |zeros(m,n)| je nulová matica _mxn_
zeros(2,3)
%%
% |ones(m,n)| je matica _mxn_ obsahujúca samé jedničky
ones(2,3)
%%
% |eye(n)| je jednotková matica _nxn_
eye(3)
%%
% |diag(v)| je diagonálna matica, ktorá je nulová a na diagonále sú prvky z
% vektora |v|
diag([1,2,3])
%%

%%
% *Riešenie sústavy lineárnych rovníc "delením maticou"*
%
% Ak matica _A_ nie je singulárna, tak sústava rovníc 
% 
% $$Ax=b$$ 
%
% má riešenie
%
% $$x=A^{-1}b$$
%
% V MATLABe je na to operátor "delenia zľava" vo forma
% opačného lomítka. Najprv vygenerujeme náhodnú maticu _A_
A=rand(3,3)
%%
% Náhodný vektor _b_
b=rand(3,1)
%%
% Potom sústavu 
%
% $$Ax=b$$ 
% 
% vyriešime:
x=A\b
%%
% Výsledok (získaný iteratívnou numerickou metódou) skontrolujeme:
A*x-b
%% Generovanie vektorov
% Pre rôzne účely sú často treba vektory reprezentujúce lineárne a iné typy postupností.
%
% Rastúca postupnosť celých čísel od |A| do |B| sa vygeneruje zápisom
% |A:B|
t = 1:6
%%
% Jedná sa o aritmetickú postupnosť, veľkosť kroku môže byť ľubovoľná 
% Napríklad postupnosť od |A| do |B| s krokom |Krok| sa zapíše ako |A:Krok:B|
t=-1:0.2:1
%%
% Aj negatívny krok je možný
t = 20:-3:1
%%
% Podobne funguje funkcia |linspace(A,B,N)|, ktorá vráti |N| čísel, ktoré
% interval 
% 
% $$<A,B>$$ 
%
% rozdelia rovnomerne na |N-1| dielikov.
linspace(0,1,11)
%%
% Logaritmickú postupnosť medzi |10^A| a |10^B| generuje funkcia |logspace(A,B,N)|
logspace(1,6,7)
%% Vektorizované funkcie
% Pokiaľ je to zmysluplné, tak všetky funkcie v MATLABe sú tzv.
% vektorizované. To znamená, že je možné im ako argument dať vektor a
% výsledkom bude aplikácia funkcie na každý prvok vektora.
% Napríklad tabuľka funkcie _sin(2t)_ na intervale
%
% $$ <0 ,\pi>$$
 t = 0:0.1:pi
 %%
tab = sin(2*t)
%% 
% Graf tejto funkcie potom môžeme jednoducho zobraziť
plot(t,tab)
%%
% Pozor na násobenie a umocňovanie. Typicky potrebujeme výpočet po
% zložkách. Príklad: výpočet funkcie
%
% $$1/(1+x^2)$$
x = -2:0.1:2;
y = 1./(1+x.^2);
plot(x,y)
%% Kreslenie grafov
% MATLAB umožňuje kresliť 2D i 3D grafy.
% Už sme videli kreslenie 2D grafu pomocou funkcie |plot(x,y)|. Táto funkcia je
% rozšírená. Tretí parameter udáva paremetre zobrazenia grafu.
% Napríklad farbu grafu - červený graf:
plot(x,y,'r')
%%
% Zelený graf čiarkovaný:
plot(x,y,'g--')
%%
% Bez spojovania zobrazených bodov. Body v tvare krúžkov:
plot(x,y,'o')
%%
% Bez spojovania zobrazených bodov. Body v tvare krížikov:
plot(x,y,'+')
%%
% Ďalšie možnosti viz nápoveda funkcie |plot|.
%
% Popisy grafu je možné meniť.
% |xlabel('string')| a |ylabel('string')| zmenia popisy x-ovej a y-ovej osy
% grafu.
xlabel('x hodnoty');
ylabel('1/(1+x^2)');
plot(x,y)
%% 
% |grid| pridá do grafu pravouhlú mriežku.
% |hold on| "podrží" graf a dovolí pridávať do obrázku grafy ďalších
% funkcií
hold on
plot(x,sin(x))
%%
% |hold off| ukončí "držanie" grafu.
hold off
%%
% Viacej grafov je možné nakresliť aj pridaním ďalších parametrov do
% volania |plot|.
plot(x,y,'r+--',x,sin(x),'go:')
%% Ďalšie užitočné príkazy
% |max(x)| v prípade, že |x| je vektor, tak je to jeho maximálny prvok. Ak
% je |x| matica, tak vráti maximálne prvky v jednotlivých stĺpcoch. Ďalšie
% možnosti sú popísané v nápovede.
x
%%
max([2, -33.1,14,9])
%%
A
%%
max(A)
%%
% Podobne funguje |min(x)|.
%
% |abs(x)| počíta absolútnu hodnotu prvkov z |x|.
abs([1, -3,-4, 2])
%%
% |size(x)| vráti vektor s rozmermi matice |x| v jednotlivých dimenziách
size(D)
%%
% |length(x)| vráti "dĺžku" poľa |x|, tj. |max(size(x))|.
length(D)
%%
% |save fname| uloží stav všetkých definovaných premenných do súboru
% |fname.mat|
%  save 'c:\MatLab\Tst.mat'
%%
% |save fname var1 var2| uloží iba obsahy vymenovaných premenných
%
% |load fname| načíta obsah premenných zo súboru |fname.mat|.
%
% |quit| ukončí MATLAB
%% Práca s prvkami matíc
C
%%
C(2,1)
%%
% Druhý riadok matice |C|
C(2,:)
%%
% Druhý a tretí riadok matice |C|
C(2:3,:)
%%
% Prvý stĺpec matice |C|
C(:,1)
%%
% Vybrané prvky vektora
x=0:2:14
%%
idx = [ 3 1 4];
x(idx)
%%
% Takéto indexovanie je možné využiť i na zmenu prvkov v matici (vektore)
x(idx)=[1,2,3]
%% Formát výstupu
% Štandardne MATLAB vypisuje čísla na obmedzený počet platných číslic (5) a
% medzi riadky výstupu vkladá často prázdne riadky. To sa dá zmeniť. Väčší
% počet platných číslic získame príkazom
format long
A
%%
% Je možné si vynútiť exponenciálny tvar zápisu čísel
format long e
A
%%
% Alebo krátky zápis v exponenciálnom tvare
format short e
A
%%
% Alebo krátky zápis bez vynúteného exponenciálneho tvaru - ak je to nutné,
% tak sa exponenciálny tvar použije, inak nie
format short
A
%%
% Ale za najužitočnejšie považujem možnosť vynechať zbytočné prázdne riadky
% na výstupe a výstup "skompaktniť"
format compact
A
%% Ďalšie možnosti - budú predstavené na ďalšom cvičení
% 
% * programovanie v MATLABe
% * riedke matice
% * štruktúry
% * bunkové polia (cell arrays)
% 
%% Úloha
% Nakreslite "žblunknutie kameňa do vody" ako 3D-graf funkcie dvoch
% premenných. Vlny by sa mohli počítať ako |sin(|_vzdialenosť od počiatku
% súradníc_|)|. So vzdialenosťou od počiatku súradníc by výška vĺn mala klesať.






