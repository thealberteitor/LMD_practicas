% Autor:
% Fecha: 15/08/2016

hombre(Alfonsoabuelo).
hombre(Matias).
hombre(Manolo).
hombre(Alfonsopadre).
hombre(Alfonsohijo).
hombre(Alberto).
hombre(Jorge).
hombre(David).

mujer(Adelaabuela).
mujer(Adelamadre).
mujer(Piedad).
mujer(Nuria).

progenitor(Alfonsoabuelo,Alfonsohijo).
progenitor(Alfonsoabuelo,Adelamadre).
progenitor(Matias,Manolo).
progenitor(Matias,Nuria).
progenitor(Alfonsopadre,Alfonsohijo).
progenitor(AlfonsoPadre,Alberto).
progenitor(AlfonsoPadre,Jorge).
progenitor(AlfonsoPadre,David).

progenitor(Adelaabuela,Adelamadre).
progenitor(Adelaabuela,Alfonsopadre).
progenitor(Piedad,Nuria).
progenitor(Piedad,Manolo).
progenitor(Nuria,Alfonsohijo).
progenitor(Nuria,Alberto).
progenitor(Nuria,Jorge).
progenitor(Nuria,David).

pareja(Alfonsoabuelo,Adelaabuela).
pareja(Adelaabuela,Alfonsoabuelo).
pareja(Matias,Piedad).
pareja(Piedad,Matias).
pareja(Alfonsopadre,Nuria).
pareja(Nuria,Alfonsopadre).


%reglas

abuelo(X,Y):-progenitor(M,Y),progenitor(X,M),hombre(X).
abuela(X,Y):-progenitor(M,Y),progenitor(X,M),mujer(X).
hermano(X,Y):-progenitor(Z,X),progenitor(Z,Y),hombre(X).
marido(X,Y):-pareja(X,Y),hombre(X).
esposa(X,Y):-pareja(X,Y),mujer(X).
padre(X,Y):-progenitor(X,Y),hombre(X).
madre(X,Y):-progenitor(X,Y),mujer(X).
nieto(X,Y):-progenitor(Y,Z),progenitor(Z,X),hombre(X).