Program Examen1;
type

	recital = record
		nombre: string;
		monto: real;
		fecha: char;
		cant: integer;
	end;
	
	arbol = ^nodoA;
	nodoA = record
		dato: recital;
		HI: arbol;
		HD: arbol;
	end;
	
	lista = ^nodoL;
	nodoL = record
		dato: recital;
		sig: lista;
	end;

	{-------------------PROCESOS-------------------}

procedure puntoA (var A: arbol);

	procedure leerDatos (var r: recital);
	begin
		readln(r.nombre);
		if (r.nombre <> 'ZZZ') then
		begin
			readln(r.monto);
			readln(r.fecha);
			readln(r.cant);
		end;
	end;
	
	procedure agregarArbol (var A: arbol; r: recital);
	begin
		if (A = nil) then
		begin
			new(A);
			A^.dato:= r;
			A^.HI:= nil;
			A^.HD:= nil;
		end
		else begin
			if (A^.dato.monto >= r.monto) then
				agregarArbol(A^.HI, r)
			else
				agregarArbol(A^.HD, r);
		end;
	end;

var
	r: recital;
begin
	A:= nil;
	leerDatos(r);
	while (r.nombre <> 'ZZZ') do
	begin
		agregarArbol(A, r);
		leerDatos(r);
	end;
end;

procedure puntoB (A: arbol; var L: lista; menor, mayor: real);

	procedure insertarOrdenado (var L: lista; r: recital);
	var
		nue: lista;
		act, ant: lista;
	begin
		new(nue);
		nue^.dato:= r;
		act:= L;
		ant:= L;
		while (act <> nil) and (r.monto < act^.dato.monto) do	//MEN A MAY
		begin
			ant:= act;
			act:= act^.sig;
		end;
		if (act = ant) then
			L:= nue
		else
			ant^.sig:= nue;
		nue^.sig:= act;
	end;
	
	procedure recursivoB (A: arbol; var L: lista; menor, mayor: real);
	begin
		if (A = nil) then
			L:= nil
		else begin
			if (A^.dato.monto > mayor) then
				recursivoB(A^.HI, L, menor, mayor)
			else
				if (A^.dato.monto < menor) then
					recursivoB(A^.HD, L, menor, mayor)
				else begin
					recursivoB(A^.HI, L, menor, mayor);
					insertarOrdenado(L, A^.dato);
					recursivoB(A^.HD, L, menor, mayor);
				end;
		end;
	end;

begin
	L:= nil;
	recursivoB(A, L, menor, mayor);
end;

procedure puntoC (L: lista; var cant: integer);

	function recursivoC(L: lista): integer;
	begin
		if (L = nil) then
			recursivoC:= 0
		else begin
			if (L^.dato.cant > 12) then
				recursivoC:= recursivoC(L^.sig) + 1
			else
				recursivoC:= recursivoC(L^.sig);
		end;
	end;

begin
	cant:= 0;
	cant:= recursivoC(L);
end;

	{-------------------PROGRAMA PRINCIPAL-------------------}

var
	A: arbol;
	L: lista;
	menor, mayor: real;
	cant: integer;
BEGIN
	puntoA(A);
	readln(menor);
	readln(mayor);
	puntoB(A, L, menor, mayor);
	puntoC(L, cant);
END.

{El teatro musicalisimo ofrece sus instalaciones para que bandas de musica puedan dar sus recitales. De cada recital se
 conoce: el nombre de la banda, la fecha del recital, la cantidad de canciones tocadas y el monto recaudado por la venta
 de entradas.
A) Implemente un modulo que lea registros de recitales de manera sucesiva hasta que se ingrese "ZZZ" como nombre
 de banda. Los recitales se pueden leer en cualquier orden. Todos los recitales leidos deben almacenarse en una
 estructura que permita el recorrido optimo por monto recaudado.
B) Implemente un modulo que reciba la estructura cargada y dos valores (ej: 200 y 500) y devuelva una lista con
 todos los recitales cuyo monto recaudado se encuentra entre esos dos valores leidos (ambos inclusive). La lista
 resultante debe estar ordenada por monto de mayor a menor.
C) Implemente un modulo recursivo que reciba la lista creada en B) y devuelva la cantidad de recitales que tocaron
 mas de 12 canciones.}
