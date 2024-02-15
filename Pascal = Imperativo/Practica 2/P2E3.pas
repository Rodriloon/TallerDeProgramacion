Program P2E3;
type

	lista = ^nodo;
	nodo = record
		dato: integer;
		sig: lista;
	end;

	{-------------------PROCESOS-------------------}

procedure puntoA (var L: lista);

	procedure recursivoA (var L: lista);
	var
		nue: lista;
	begin
		new(nue);
		Randomize;
		nue^.dato:= random(100);
		writeln(nue^.dato);
		if (nue^.dato <> 0) then
		begin
			nue^.sig:= L;
			L:= nue;
			recursivoA(L^.sig);
		end;
	end;

begin
	L:= nil;
	recursivoA(L);
end;

procedure puntoB (L: lista);

	procedure recursivoB (L: lista; var valM: integer);
	begin
		if (L <> nil) then
		begin
			if (valM > L^.dato) then
			begin
				valM:= L^.dato;
				recursivoB(L^.sig, valM);
			end;
		end;
	end;

var
	valM: integer;
begin
	valM:= 9999;
	recursivoB(L, valM);
end;

procedure puntoC (L: lista);

	procedure recursivoC (L: lista; var valM: integer);
	begin
		if (L <> nil) then
		begin
			if (valM < L^.dato) then
			begin
				valM:= L^.dato;
				recursivoC(L^.sig, valM);
			end;
		end;
	end;

var
	valM: integer;
begin
	valM:= -1;
	recursivoC(L, valM);
end;

procedure puntoD (L: lista);

	procedure recursivoD (L: lista; num: integer; var seEncuentra: boolean);
	begin
		if (L <> nil) then
		begin
			if (L^.dato = num) then
			begin
				seEncuentra:= true;
			end
			else
				recursivoD(L^.sig, num, seEncuentra);
		end;
	end;

var
	seEncuentra: boolean;
	num: integer;
begin
	seEncuentra:= false;
	readln(num);
	recursivoD(L, num, seEncuentra);
	writeln(seEncuentra);
end;

	{-------------------PROGRAMA PRINCIPAL-------------------}

var
	L: lista;
BEGIN
	writeln('llegue');
	puntoA(L);
	writeln('llegue');
	puntoB(L);
	writeln('llegue');
	puntoC(L);
	writeln('llegue');
	puntoD(L);
	writeln('llegue');
END.

{Escribir un programa que:
a. Implemente un módulo recursivo que genere una lista de números enteros “random” mayores a 0 y menores a 100. Finalizar con el número 0.
b. Implemente un módulo recursivo que devuelva el mínimo valor de la lista.
c. Implemente un módulo recursivo que devuelva el máximo valor de la lista.
d. Implemente un módulo recursivo que devuelva verdadero si un valor determinado se encuentra en la lista o falso en caso contrario.}
