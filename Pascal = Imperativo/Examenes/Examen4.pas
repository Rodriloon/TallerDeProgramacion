Program Examen4;
type

	alumno = record
		nombre: string;
		dni: integer;
		tiempo: real;
	end;
	
	arbol = ^nodoA;
	nodoA = record
		dato: alumno;
		HI: arbol;
		HD: arbol;
	end;
	
	lista = ^nodoL;
	nodoL = record
		dato: alumno;
		sig: lista;
	end;

	{-------------------PROCESOS-------------------}

procedure puntoA (var A: arbol);

	procedure leerDatos(var a: alumno);
	begin
		readln(a.dni);
		if (a.dni <> 0) then
		begin
			readln(a.nombre);
			readln(a.tiempo);
		end;
	end;
	
	procedure agregarArbol (var A: arbol; alum: alumno);
	begin
		if (A = nil) then
		begin
			new(A);
			A^.dato:= alum;
			A^.HI:= nil;
			A^.HD:= nil;
		end
		else begin
			if (A^.dato.tiempo >= alum.tiempo) then
				agregarArbol(A^.HI, alum)
			else
				agregarArbol(A^.HD, alum);
		end;
	end;

var
	alum: alumno;
begin
	A:= nil;
	leerDatos(alum);
	while (alum.dni <> 0) do
	begin
		agregarArbol(A, alum);
		leerDatos(alum);
	end;
end;

procedure puntoB (A: arbol; var L: lista);

	procedure agregarAtras (var L: lista; var ult: lista; a: alumno);
	var
		nue: lista;
	begin
		new(nue);
		nue^.dato:= a;
		nue^.sig:= nil;
		if (L = nil) then
			L:= nue
		else
			ult^.sig:= nue;
		ult:= nue;
	end;

	procedure pasarDatos (A: arbol; var L: lista; var ult: lista; max, min: integer);
	begin
		if (A <> nil) then
		begin
			if (A^.dato.tiempo >= max) then
				pasarDatos(A^.HI, L, ult, max, min)
			else
				if (A^.dato.tiempo < min) then
					pasarDatos(A^.HD, L, ult, max, min)
				else begin
					pasarDatos(A^.HI, L, ult, max, min);
					agregarAtras(L, ult, A^.dato);
					pasarDatos(A^.HD, L, ult, max, min);
				end;
		end;
	end;

var
	ult: lista;
	max, min: integer;
begin
	L:= nil;
	ult:= nil;
	readln(max);
	readln(min);
	pasarDatos(A, L, ult, max, min);
end;

procedure puntoC (A: arbol; var nombre: string; var dni: integer);
begin	if (A <> nil) then
    begin
        while (A^.HI <> nil) do
            A := A^.HI;
        nombre := A^.dato.nombre;
        dni := A^.dato.dni;
    end;
end;

	{-------------------PROGRAMA PRINCIPAL-------------------}

var
	A: arbol;
	L: lista;
	nombre: string;
	dni: integer;
BEGIN
	puntoA(A);
	puntoB(A, L);
	puntoC(A, nombre, dni);
END.

{}
