% Contextualização:
% Comousembanana - indefinido se o macaco tem a banana
% estados (PosicãoHorizontal,Cadeira, PosiçãoVertical, PosiçãoDaCadeira, TerBananas)
% Posicãoqualquer, Posiçãoqualquer1, Posicaoqualquer2 - Posições indefinidas que os objectos podem estar!

%Factos

%Pega Banana
accao(
    estado(meio, emcimacadeira, meio, temvara, naotembanana),
    alcancarbananas,
    estado(meio, emcimacadeira, meio, temvara, tembanana)
).

%Pega Vara
accao(
    estado(Posicaoqualquer, emcimacadeira, Posicaoqualquer, naotemvara, Comousembanana),
    levarVara,
    estado(Posicaoqualquer, emcimacadeira, Posicaoqualquer, temvara, Comousembanana)
).

%Sobe na cadeira
accao(
    estado(Posicaoqualquer, nochao, Posicaoqualquer, naotemvara, Comousembanana),
    subir,
    estado(Posicaoqualquer, emcimacadeira, Posicaoqualquer, naotemvara, Comousembanana)
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

podealcancar(
    estado(_,_,_,temvara, tembanana)
).

podealcancar(Estado1):-
    accao(Estado1,_, Estado2),
    podealcancar(Estado2).
