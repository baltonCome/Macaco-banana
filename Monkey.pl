% Contextualização:
% Comousembanana - indefinido se o macaco tem a banana
% estados (PosicãoHorizontal,Cadeira, PosiçãoVertical, PosiçãoDaCadeira, TerBananas)
% Posicãoqualquer, Posiçãoqualquer1, Posicãoqualquer2 - Posições indefinidas que os objectos podem estar!


%Factos

%AgitarVara
accao(
    estado(meio, emcimacadeira, meio, temvara, naotembanana),
    alcancarbananas,
    estado(meio, emcimacadeira, meio, temvara, tembanana)
).

%Sobe na cadeira
accao(
    estado(Posicaoqualquer, nochao, Posicaoqualquer, temvara, Comousembanana),
    subir,
    estado(Posicaoqualquer, emcimacadeira, Posicaoqualquer, temvara, Comousembanana)
).


%Pega Vara
accao(
    estado(Posicaoqualquer, nochao,Posicaoqualquer, naotemvara, Comousembanana),
    levarVara,
    estado(Posicaoqualquer, nochao, Posicaoqualquer, temvara, Comousembanana)
).


%empurra cadeira
accao(
    estado(Posicaoqualquer1, nochao, Posicaoqualquer1, naotemvara, Comousembanana),
    empurra(Posicaoqualquer1, Posicaoqualquer2),
    estado(Posicaoqualquer2, nochao, Posicaoqualquer2, naotemvara, Comousembanana)
).

%anda
accao(
    estado(Posicaoqualquer1, nochao, Posicaoindefinida, naotemvara, Comousembanana),
    anda(Posicaoqualquer1, Posicaoqualquer2),
    estado(Posicaoqualquer2, nochao, Posicaoindefinida, naotemvara, Comousembanana)
).


%Regras
podealcancar(
    estado(_,_,_,temvara, tembanana)
).

podealcancar(Estado1):-
    accao(Estado1,_, Estado2),
    podealcancar(Estado2).
