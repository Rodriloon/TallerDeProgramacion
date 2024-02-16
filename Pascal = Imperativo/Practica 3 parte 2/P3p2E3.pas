Program P3E3;
type

	alumnos = record
		legajo: integer;
		dni: integer;
		anio: integer;
	end;

	arbol = ^nodo;
	nodo = record
		dato: alumnos;
		HI: arbol;
		HD: arbol;
	end;

	{-------------------PROCESOS-------------------}

procedure generarArbol (var a: arbol);

	procedure leerAlumnos (var A: alumnos);
	begin
		readln(A.anio);
		if (A.anio > 2010) then
		begin
			readln(A.legajo);
			readln(A.dni);
		end;
	end;

	procedure Insertar (var a: arbol; alum: alumnos);
	begin
		if (a = nil) then
		begin
			new(a);
			a^.dato:= alum;
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else
			if (alum.legajo < a^.dato.legajo) then
				Insertar(a^.HI, alum)
			else
				Insertar(a^.HD, alum);
	end;

var
	alum: alumnos;
begin
	a:= nil;
	leerAlumnos(alum);
	while (alum.anio < 2010) do
	begin
		Insertar(a, alum);
		leerAlumnos(alum);
	end;
end;

procedure inferior (a: arbol);

	procedure Informar (a: arbol; legajoInf: integer);
	begin
		if (a <> nil) then
		begin
			if (a^.dato.legajo < legajoInf) then
			begin
				writeln(a^.dato.anio);
				writeln(a^.dato.dni);
				Informar(a^.HD, legajoInf);
				Informar(a^.HI, legajoInf);
			end
			else
				Informar(a^.HI, legajoInf);
		end;
	end;

var
	legajoInf: integer;
begin
	readln(legajoInf);
	Informar(a, legajoInf);
end;

procedure dosValores (a: arbol);

	procedure buscar (a: arbol; legajoMin, legajoMax: integer);
	begin
		if (a <> nil) then
		begin
			if (a^.dato.legajo < legajoMin) then
				buscar(a^.HD, legajoMin, legajoMax)
			else
				if (a^.dato.legajo > legajoMax) then
					buscar(a^.HI, legajoMin, legajoMax)
				else
				begin
					writeln(a^.dato.anio);
					writeln(a^.dato.dni);
					buscar(a^.HI, legajoMin, legajoMax);
					buscar(a^.HD, legajoMin, legajoMax);
				end;
		end;
	end;

var
	legajoMin, legajoMax: integer;
begin
	readln(legajoMin);
	readln(legajoMax);
	buscar(a, legajoMin, legajoMax);
end;

procedure masGrande (a: arbol);

	procedure mayores (a: arbol; var mayor: integer);
	begin
		if (a <> nil) then
		begin
			if (a^.dato.dni > mayor) then
				mayor:= a^.dato.dni;
			mayores(a^.HI, mayor);
			mayores(a^.HD, mayor);
		end;
	end;

var
	mayor: integer;
begin
	mayor:= -1;
	mayores(a, mayor);
	writeln('El dni mas grande es: ', mayor);
end;

function impar (a: arbol): integer;
begin
	if (a = nil) then
		impar:= 0
	else
	begin
		if ((a^.dato.legajo mod 2) = 0) then
			impar:= impar(a^.HI) + impar(a^.HD) + 1
		else
			impar:= impar(a^.HI) + impar(a^.HD);
	end;
end;

	{-------------------PROGRAMA PRINCIPAL-------------------}

var
	a: arbol;
BEGIN
	generarArbol(a);
	inferior(a);
	dosValores(a);
	masGrande(a);
	impar(a);
END.

{Implementar un programa que contenga:
a. Un módulo que lea información de alumnos de Taller de Programación y almacene en una estructura de datos sólo a aquellos alumnos que posean año de ingreso posterior al 2010. 
De cada alumno se lee legajo, DNI y año de ingreso. La estructura generada debe ser eficiente para la búsqueda por número de legajo. 
b. Un módulo que reciba la estructura generada en a. e informe el DNI y año de ingreso de aquellos alumnos cuyo legajo sea inferior a un valor ingresado como parámetro. 
c. Un módulo que reciba la estructura generada en a. e informe el DNI y año de ingreso de aquellos alumnos cuyo legajo esté comprendido entre dos valores que se reciben como parámetro. 
d. Un módulo que reciba la estructura generada en a. y retorne el DNI más grande.
e. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con legajo impar.
}
