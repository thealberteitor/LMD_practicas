% Autor:
% Fecha: 15/08/2016

% Ordenacion por permutacion.

ordena1(L,S):-permutacion(L,S),ordenada(S).

permutacion([],[]).
permutacion([H|T],S):-permutacion(T,T1),guarda(H,T1,S).

guarda(X,L,[X|L]).
guarda(X,[H|T],[H|S]):-guarda(X,T,S).

ordenada([]).
ordenada([_]).
ordenada([A,B|T]):-A>=B,ordenada([B|T]).
%-----------------------------------------------------------------------
% Ordenación por inserción

ordena2([],[]).
ordena2([H|T],S):-ordena2(T,R),inserta(H,R,S).

inserta(X,[],[X]).
inserta(X,[H|T],[X,H|T]):-X>=H,!.
inserta(X,[H|T],[H|S]):-inserta(X,T,S).

%-----------------------------------------------------------------------
% Ordenacion por el metodo de la burbuja.

orden_bur(L,L) :-ordenada(L).
orden_bur(L,Lord) :-burbuja(L,L1),orden_bur(L1,Lord).

burbuja([],[]).
burbuja([X],[X]).
burbuja([X,Y|L],Lburb) :-menorig(X,Y),burbuja([Y|L],L1),Lburb = [X|L1].
burbuja([X,Y|L],Lburb) :-menor(Y,X),burbuja([X|L],L1),Lburb = [Y|L1].

%-----------------------------------------------------------------------
% Ordenación por mergesort

ordMezcla([X],[X]):-!.
ordMezcla([],[]).

ordMezcla(L1,L2):-partir(L1,A,B),ordMezcla(A,R1),ordMezcla(B,R2),mezclar(R1,R2,L2).

%partimos la lista pasando un elemento de
%manera intercalada a una u otra lista

partir([],[],[]).
partir([X],[X],[]).

partir([X,Y|Z1],[X|Z2],[Y|Z3]):-partir(Z1,Z2,Z3).

mezclar(L,[],L).
mezclar([],L,L).

mezclar([X|Z1],[Y|Z2],[X|Z3]):- X
mezclar(Z1,[Y|Z2],Z3).

mezclar([X|Z1],[Y|Z2],[Y|Z3]):- X>=Y,mezclar([X|Z1],Z2,Z3).

%-----------------------------------------------------------------------
%Ordenación por selección

ordSeleccion(L1,L2):-seleccion(L1,[],L2).
seleccion([],L2,L2).

seleccion(L1,L2,L3):-menorlista(L1,M),eliminar(M,L1,Laux),setCabeza(M,Laux,[H|T]),

append(L2,H,Laux2),seleccion(T,Laux2,L3).

%ponemos un elemento como cabeza de la lista

setCabeza(H,L,[H|L]).

%eliminamos un elemento X de la lista

eliminar(_,[],[]):-fail.
eliminar(X,[X|R],R).
eliminar(X,[C|R],[C|R1]):- eliminar(X,R,R1).

%-----------------------------------------------------------------------
%Ordenación por quicksort

orden_qks([],[]).
orden_qks([M|CL],Lord):-particion(M,CL,L1,L2),orden_qks(L1,Lord1),orden_qks(L2,Lord2),concatena(Lord1,[M|Lord2],Lord).

%cláusulas para «partición» son:
particion(X,[],[],[]).
particion(M,[X|L],[X|L1],L2):-menor(X,M), particion(M,L,L1,L2).
particion(M,[X|L],L1,[X|L2]):-menorig(M,X), particion(M,L,L1,L2).
