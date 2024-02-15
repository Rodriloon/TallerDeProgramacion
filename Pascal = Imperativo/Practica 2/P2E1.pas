program P2E1;
type
	
	listaE = ^nodo;
	nodo = record
		dato: char;
		sig: listaE;
	end;
	
	listaA = array [1..10] of char;

	{-------------------PROCESOS-------------------}

procedure puntoA (var LA: listaA);

	procedure recursivoA (var LA: listaA; dimL: integer);
	var
		aux: char;
	begin
		readln(aux);
		if (aux <> '.') then
		begin
			LA[dimL]:= aux;
			recursivoA(LA, dimL + 1);
		end;
	end;

var
	dimL: integer;
begin
	dimL:= 1;
	recursivoA(LA, dimL);
end;

procedure puntoB (LA: listaA);
var
	dimL: integer;
begin
	dimL:= 1;
	while (LA[dimL] <> '.') do
	begin
		writeln(LA[dimL]);
		dimL:= dimL + 1;
	end;
		writeln(LA[dimL]);
end;

procedure puntoC (LA: listaA);

	procedure recursivoC (LA: listaA; dimL: integer);
	begin
		if (LA[dimL] <> '.') then
		begin
			writeln(LA[dimL]);
			recursivoC(LA, dimL + 1);
		end;
	end;

var
	dimL: integer;
begin
	dimL:= 1;
	recursivoC(LA, dimL);
end;

procedure puntoD (var cantC: integer);
var
	aux: char;
begin
	readln(aux);
	if (aux <> '.') then
	begin
		cantC:= cantC + 1;
		puntoD(cantC);
	end;
end;

procedure puntoE (var LE: listaE);

	procedure recursivoE (var LE: listaE);
	var
		aux: char;
	begin
		readln(aux);
		if (aux <> '.') then
		begin
			LE^.dato:= aux;
			recursivoE(LE^.sig);
		end;
	end;

begin
	LE:= nil;
	recursivoE(LE);
end;

procedure puntoF (LE: listaE);
begin
	if (LE <> nil) then
	begin
		writeln(LE^.dato);
		puntoF(LE^.sig);
	end;	
end;

procedure puntoG (LE: listaE);
begin
	if (LE <> nil) then
	begin
		puntoG(LE^.sig);
		writeln(LE^.dato);
	end;	
end;

	{-------------------PROGRAMA PRINCIPAL-------------------}

var
	LA: listaA;
	cantC: integer;
	LE: listaE;
BEGIN
	puntoA(LA);
	puntoB(LA);
	puntoC(LA);
	puntoD(cantC);
	puntoE(LE);
	puntoF(LE);
	puntoG(LE);
END.

{1.- Implementar un programa que invoque a los siguientes módulos.
a. Un módulo recursivo que permita leer una secuencia de caracteres terminada en punto, los almacene en un vector con dimensión física igual a 10 y retorne el vector.
b. Un módulo que reciba el vector generado en a) e imprima el contenido del vector.
c. Un módulo recursivo que reciba el vector generado en a) e imprima el contenido del vector..
d. Un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y retorne la cantidad de caracteres leídos. El programa debe informar el valor retornado.
e. Un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y retorne una lista con los caracteres leídos.
f. Un módulo recursivo que reciba la lista generada en e) e imprima los valores de la lista en el mismo orden que están almacenados.
g. Implemente un módulo recursivo que reciba la lista generada en e) e imprima los valores de la lista en orden inverso al que están almacenados.}
