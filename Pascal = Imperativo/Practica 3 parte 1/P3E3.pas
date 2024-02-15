Program P3E3;
type

	finales = record
		codigo: integer;
		nota: real;
	end;
	
	Lista = ^nodo;
	nodo = record
		dato: finales;
		sig: Lista;
	end;
	
	alumnos = record
		legajo: integer;
		dni: integer;
		ingreso: integer;
		listaF: Lista;
	end;
	
	arbol = ^nodoA;
	nodoA = record
		dato: alumnos;
		HI: arbol;
		HD: arbol;
	end;

	{-------------------PROCESOS-------------------}

procedure puntoA (var A: arbol);

	procedure agregarAtras (var L: Lista; f: finales);
	var
		nue, act: Lista;
	begin
		new(nue);
		nue^.dato:= f;
		nue^.sig:= nil;
		if (L = nil) then
			L:= nue
		else begin
			act:= L;
			while (act^.sig <> nil) do
				act:= act^.sig;
			act^.sig:= nue;
		end;
	end;

	procedure leerDatos (var alum: alumnos);
	var
		act: finales;
	begin
		readln(alum.legajo);
		if (alum.legajo <> 0) then
		begin
			readln(alum.dni);
			readln(alum.ingreso);
			alum.listaF:= nil;
			readln(act.codigo);
			while (act.codigo <> -1) do
			begin
				readln(act.nota);
				agregarAtras(alum.listaF, act);
				readln(act.codigo);
			end;
		end;
	end;
	
	procedure agregarArbol (var A: arbol; alum: alumnos);
	begin
		if (A = nil) then
		begin
			new(A);
			A^.dato:= alum;
			A^.HI:= nil;
			A^.HD:= nil;
		end
		else begin
			if (alum.legajo <= A^.dato.legajo) then
				agregarArbol(A^.HI, alum)
			else
				agregarArbol(A^.HD, alum);
		end;
	end;

var
	alum: alumnos;
begin
	A:= nil;
	leerDatos(alum);
	while (alum.legajo <> 0) do
	begin
		agregarArbol(A, alum);
		leerDatos(alum);
	end;
end;

procedure puntoB (A: arbol);

	procedure recursivoB (A: arbol; tope: integer);
	begin
		if (A <> nil) then
		begin
			if (A^.dato.legajo < tope) then
			begin
				writeln(A^.dato.dni);
				writeln(A^.dato.ingreso);
				recursivoB(A^.HD, tope);
			end
			else
				recursivoB(A^.HI, tope);
		end
		else
			writeln('No se encontraron alumnos con legajo inferior al ingresado');
	end;

var
	tope: integer;
begin
	readln(tope);
	recursivoB(A, tope);
end;

function puntoC (A: arbol): integer;
begin
	if (A = nil) then
	begin
		puntoC:= 0;
	end
	else begin
		puntoC:= A^.dato.legajo;
		puntoC:= puntoC(A^.HD);
	end;
end;

procedure puntoD (A: arbol);

	procedure recursivoD (A: arbol; var maximo: integer);
	begin
		if (A = nil) then
			maximo:= 0
		else begin
			recursivoD(A^.HI, maximo);
			if (maximo < A^.dato.dni) then
				maximo:= A^.dato.dni;
			recursivoD(A^.HD, maximo);
		end;
	end;

var
	maximo: integer;
begin
	maximo:= -1;
	recursivoD(A, maximo);
end;

function puntoE (A: arbol): integer;
begin
	if (A = nil) then
		puntoE:= 0
	else begin
		puntoE:= puntoE(A^.HI) + puntoE(A^.HD);
		if (A^.dato.legajo mod 2 = 1) then
			puntoE:= puntoE + 1;
	end;
end;

function calcularPromedio(listaFinales: Lista): real;
var
	sumaNotas: real;
	cantidadNotas: integer;
	nodoActual: Lista;
begin
	sumaNotas := 0;
	cantidadNotas := 0;
	nodoActual := listaFinales;
	while nodoActual <> nil do
	begin
		sumaNotas := sumaNotas + nodoActual^.dato.nota;
		cantidadNotas := cantidadNotas + 1;
		nodoActual := nodoActual^.sig;
	end;
	if cantidadNotas > 0 then
		calcularPromedio := sumaNotas / cantidadNotas
	else
		calcularPromedio := 0;
end;

procedure puntoF(A: arbol);
	
	procedure recursivoF(A: arbol; var maxLegajo: integer; var maxPromedio: real);
	var
		promedioActual: real;
	begin
		if (A <> nil) then
		begin
			promedioActual := calcularPromedio(A^.dato.listaF);
			if (promedioActual > maxPromedio) then
			begin
				maxPromedio := promedioActual;
				maxLegajo := A^.dato.legajo;
			end;
			recursivoF(A^.HI, maxLegajo, maxPromedio);
			recursivoF(A^.HD, maxLegajo, maxPromedio);
		end;
	end;

var
    legajoMaxPromedio: integer;
    maxPromedio: real;
begin
    legajoMaxPromedio := 0;
    maxPromedio := 0;
    recursivoF(A, legajoMaxPromedio, maxPromedio);
    writeln('El legajo del alumno con mas promedio es:', legajoMaxPromedio, ', con un promedio de: ', maxPromedio);
end;

procedure puntoG(A: arbol);

	procedure recursivoG (A: arbol; promMinimo: real);
	var
		promedioAct: real;
	begin
		if (A <> nil) then
		begin
			promedioAct:= calcularPromedio(A^.dato.listaF);
			if (promedioAct > promMinimo) then
			begin
				writeln(A^.dato.legajo);
				writeln(promedioAct);
			end;
			recursivoG(A^.HI, promMinimo);
			recursivoG(A^.HD, promMinimo);
		end;
	end;

var
	promMinimo: real;
begin
    readln(promMinimo);
    recursivoG(A, promMinimo);
end;

	{-------------------PROGRAMA PRINCIPAL-------------------}

var
	A: arbol;
BEGIN
	puntoA(A);
	puntoB(A);
	puntoC(A);
	puntoD(A);
	puntoE(A);
	puntoF(A);
	puntoG(A);
END.


{Implementar un programa que contenga:
a. Un módulo que lea información de alumnos de Taller de Programación y los almacene en
una estructura de datos. De cada alumno se lee legajo, DNI, año de ingreso y los códigos y
notas de los finales rendidos. La estructura generada debe ser eficiente para la búsqueda por
número de legajo. La lectura de los alumnos finaliza con legajo 0 y para cada alumno el ingreso
de las materias finaliza con el código de materia -1.
b. Un módulo que reciba la estructura generada en a. y retorne los DNI y año de ingreso de aquellos alumnos cuyo legajo sea inferior a un valor ingresado como parámetro.
c. Un módulo que reciba la estructura generada en a. y retorne el legajo más grande.
d. Un módulo que reciba la estructura generada en a. y retorne el DNI más grande.
e. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con legajo impar.
f. Un módulo que reciba la estructura generada en a. y retorne el legajo y el promedio del alumno con mayor promedio.
g. Un módulo que reciba la estructura generada en a. y un valor entero. Este módulo debe retornar los legajos y promedios de los alumnos cuyo promedio supera el valor ingresado.}
