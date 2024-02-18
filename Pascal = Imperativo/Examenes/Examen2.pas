Program Examen2;
type

	registro = record
		numero: integer;
		dia: integer;
		mes: integer;
		cantidadHoras: integer;
	end;
	
	arbol = ^nodoA;
	nodoA = record
		dato: registro;
		HI: arbol;
		HD: arbol;
	end;
	
	lista = ^nodoL;
	nodoL = record
		dato: registro;
		sig: lista;
	end;

	{-------------------PROCESOS-------------------}

procedure puntoA (var A: arbol);

	procedure leerDatos (var r: registro);
	begin
		readln(r.dia);
		if (r.dia <> 0) then
		begin
			readln(r.mes);
			readln(r.numero);
			readln(r.cantidadHoras);
		end
	end;
	
	procedure agregarArbol (var A: arbol; r: registro);
	begin
		if (A = nil) then
		begin
			new(A);
			A^.dato:= r;
			A^.HI:= nil;
			A^.HD:= nil;
		end
		else begin
			if (A^.dato.numero >= r.numero) then
				agregarArbol(A^.HI, r)
			else
				agregarArbol(A^.HD, r);
		end;
	end;

var
	r: registro;
begin
	A:= nil;
	leerDatos(r);
	while (r.dia <> 0) do
	begin
		agregarArbol(A, r);
		leerDatos(r);
	end;
end;

procedure puntoB (A: arbol; var L: lista);

	procedure agregarAtras (var L: lista; var ult: lista; r: registro);
	var
		nue: lista;
	begin
		new(nue);
		nue^.dato:= r;
		nue^.sig:= nil;
		if (L = nil) then
			L:= nue
		else
			ult^.sig:= nue;
		ult:= nue;
	end;

	procedure recursivoB (A: arbol; menor, mayor: integer; var L: lista; var ult: lista);
	begin
		if (A <> nil) then
		begin
			if (A^.dato.numero > mayor) then
				recursivoB(A^.HI, menor, mayor, L, ult)
			else
				if (A^.dato.numero < menor) then
					recursivoB(A^.HD, menor, mayor, L, ult)
				else begin
					recursivoB(A^.HI, menor, mayor, L, ult);
					agregarAtras(L, ult, A^.dato);
					recursivoB(A^.HD, menor, mayor, L, ult);
				end;
		end;
	end;

var
	menor, mayor: integer;
	ult: lista;
begin
	L:= nil;
	readln(menor);
	readln(mayor);
	recursivoB(A, menor, mayor, L, ult);
end;

function puntoC (L: lista): integer;
begin
	if (L = nil) then
		puntoC:= 0
	else begin
		puntoC:= puntoC(L^.sig) + L^.dato.cantidadHoras;
	end;
end;
	{-------------------PROGRAMA PRINCIPAL-------------------}

var
	A: arbol;
	L: lista;
BEGIN
	puntoA(A);
	puntoB(A, L);
	writeln('El total de horas trabajadas fue: ', puntoC(L));
	
END.

{ Una empresa desea procesa la informacion de las horas trabajadas por sus empleados durante 2021.
 Para ello, la empresa posee registros de las horas trabajadas por cada por cada empleado.
 Cada registro consta del numero de empleado, dia, mes y cantidad de horas trabajadas
 (a lo sumo 8) para dicho dia y mes.

a) Realizar un modulo que lea la info de los empleados y retorne estructura de datos con
 todos los registros leidos. La estructura debe ser eficiente para la busqueda por numero de
 empleado. La lectura finaliza al ingresar un registro con dia 0. Se sugiere utilizar el modulo
 leerRegistro().

b) Realizar un modulo que reciba la estructura genera en a) y dos numeros de empleado X e Y, 
 y retorne todos los registros de horas trabajadas por empleados cuyos numeros esten entre X 
 e Y (incluidos).

c) Realizar un modulo recursivo que reciba la estructura generada en b) y retorne la cantidad
 total de horas trabajadas.}
