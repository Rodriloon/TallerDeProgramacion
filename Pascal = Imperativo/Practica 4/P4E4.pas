Program P4E4;
type

	reclamo = record
		codigo: integer;
		anio: integer;
		tipo: string;
	end;
	
	lista = ^nodoL;
	nodoL = record
		dato: reclamo;
		sig: lista;
	end;
	
	persona = record
		dni: integer;
		cant: integer;
		lista: lista;
	end;
	
	arbol = ^nodoA;
	nodoA = record
		dato: persona;
		HI: arbol;
		HD: arbol;
	end;

	{-------------------PROCESOS-------------------}

procedure puntoA (var A: arbol);

	procedure agregarAdelante (var L: lista; r: reclamo);
	var
	nue: lista;
	begin
		new(nue);
		nue^.dato:= r;
		nue^.sig:= L;
		L:= nue;
	end;
	
	procedure leerDatos (var p: persona);
	var
		act: reclamo;
	begin
		p.lista:= nil;
		readln(act.codigo);
		if (act.codigo <> -1) then
		begin
			readln(act.anio);
			readln(act.tipo);
			readln(p.dni);
			p.cant:= 1;
			agregarAdelante(p.lista, act);
		end;
	end;
	
	procedure agregarArbol (var A: arbol; p: persona);
	begin
		if (A = nil) then
		begin
			new(A);
			A^.dato:= p;
			A^.HI:= nil;
			A^.HD:= nil;
		end
		else begin
			if (A^.dato.dni > p.dni) then
				agregarArbol(A^.HI, p)
			else
				if (A^.dato.dni < p.dni) then
					agregarArbol(A^.HD, p)
				else begin
					if (p.lista <> nil) then
					begin
						agregarAdelante(A^.dato.lista, p.lista^.dato);
						A^.dato.cant := A^.dato.cant + p.cant;
						p.lista := p.lista^.sig;
					end;
				end;
		end;
	end;

var
	p: persona;
begin
	A:= nil;
	leerDatos(p);
	while (p.lista^.dato.codigo <> -1) do
	begin
		agregarArbol(A, p);
		leerDatos(p);
	end;
end;

procedure puntoB (A: arbol);

	function recursivoB (A: arbol; X: integer): integer;
	begin
		if (A = nil) then
			recursivoB:= -1
		else begin
			if (A^.dato.dni > X) then
				recursivoB(A^.HI, X)
			else
				if (A^.dato.dni < X) then
					recursivoB(A^.HD, X)
				else begin
					recursivoB:= A^.dato.cant;
				end;
		end;
	end;

var
	X: integer;
begin
	readln(X);
	writeln('La cantidad de reclamos del dni ingresado es: ', recursivoB(A, X));
end;

procedure puntoC (A: arbol);

	function recursivoC (A: arbol; menor, mayor: integer): integer;
	begin
		if (A = nil) then
			recursivoC:= 0
		else begin
			if (A^.dato.dni > mayor) then
				recursivoC:= recursivoC(A^.HI, menor, mayor)
			else
				if (A^.dato.dni < menor) then
					recursivoC:= recursivoC(A^.HD, menor, mayor)
				else
					recursivoC:= recursivoC(A^.HI, menor, mayor) + recursivoC(A^.HD, menor, mayor) + A^.dato.cant;
		end;
	end;

var
	menor, mayor: integer;
begin
	readln(menor);
	readln(mayor);
	writeln('La cantidad de reclamos efectuados por todos los DNI comprendidos entre los dos DNI recibidos es ', recursivoC(A, menor, mayor));
end;

procedure puntoD (A: arbol);

	procedure recursivoD (A: arbol; aniazo: integer);
	begin
		if (A <> nil) then
		begin
			recursivoD(A^.HI, aniazo);
			if (A^.dato.lista^.dato.anio = aniazo) then
				writeln(A^.dato.lista^.dato.codigo);
			recursivoD(A^.HD, aniazo);
		end;
	end;

var
	aniazo: integer;
begin
	readln(aniazo);
	recursivoD(A, aniazo);
end;

	{-------------------PROGRAMA PRINCIPAL-------------------}

var
	A: arbol;
BEGIN
	puntoA(A);
	puntoB(A);
	puntoC(A);
	puntoD(A);
END.

{Una oficina requiere el procesamiento de los reclamos de las personas. De cada reclamo
se lee código, DNI de la persona, año y tipo de reclamo. La lectura finaliza con el código de igual a -1. Se pide:
a) Un módulo que retorne estructura adecuada para la búsqueda por DNI. Para cada DNI se deben tener almacenados cada reclamo y la cantidad total de reclamos que realizó.
b) Un módulo que reciba la estructura generada en a) y un DNI y retorne la cantidad de reclamos efectuados por ese DNI.
c) Un módulo que reciba la estructura generada en a) y dos DNI y retorne la cantidad de reclamos efectuados por todos los DNI comprendidos entre los dos DNI recibidos.
d) Un módulo que reciba la estructura generada en a) y un año y retorne los códigos de los reclamos realizados en el año recibido.}
