Program P3E1;
type

	socios = record
		numero: integer;
		nombre: string;
		edad: integer;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: socios;
		HI: arbol;
		HD: arbol;
	end;

	{-------------------PROCESOS-------------------}

procedure crearA (var A: arbol);

	procedure leerDatos (var s: socios);
	begin
		readln(s.numero);
		if (s.numero <> 0) then
		begin
			readln(s.nombre);
			readln(s.edad);
		end;
	end;
	
	procedure agregarArbol (var A: arbol; s: socios);
	begin
		if (A = nil) then
		begin
			new(A);
			A^.dato:= s;
			A^.HI:= nil;
			A^.HD:= nil;
		end
		else begin
			if (s.numero <= A^.dato.numero) then
				agregarArbol(A^.HI, s)
			else
				agregarArbol(A^.HD, s);
		end;
	end;
	
var
	s: socios;
begin
	A:= nil;
	leerDatos(s);
	while (s.numero <> 0) do
	begin
		agregarArbol(A, s);
		leerDatos(s);
	end;
end;

procedure modulo1 (A: arbol);

	procedure buscarNumeroMax (A: arbol; var max: integer);
	begin
		if (A^.HD = nil) then
			max:= A^.dato.numero
		else
			buscarNumeroMax(A^.HD, max);
	end;

var
	max: integer;
begin
	max:= 0;
	buscarNumeroMax(A, max);
	writeln('numero de socio mas alto: ', max);
end;

procedure modulo2 (A: arbol);

	procedure buscarNumeroMin (A: arbol; var min: socios);
	begin
		if (A^.HI = nil) then
			min:= A^.dato
		else
			buscarNumeroMin(A^.HI, min);
	end;

var
	min: socios;
begin
	buscarNumeroMin(A, min);
	writeln('datos del socio con numero mas chico: ', min.numero, '  ', min.nombre, '  ', min.edad);
end;

procedure modulo3 (A: arbol);

	procedure mayorEdad (A: arbol; var total: integer);
	begin
		if (A <> nil) then
		begin
			mayorEdad(A^.HI, total);
			if (A^.dato.edad >= 18) then
				total:= total + 1;
			mayorEdad(A^.HD, total);
		end;
	end;

var
	total: integer;
begin
	total:= 0;
	mayorEdad(A, total);
	writeln('Cantidad de socios mayores de edad: ', total);
end;

procedure modulo4 (A: arbol);
begin
	if (A <> nil) then
	begin
		modulo4(A^.HI);
		A^.dato.edad:= A^.dato.edad + 1;
		modulo4(A^.HD);
	end;
end;

procedure modulo5 (A: arbol);

	function encontrarNum (A: arbol; num: integer): boolean;
	begin
		if (A = nil) then
			encontrarNum:= false
		else begin
			if (A^.dato.numero <> num) then
			begin
				encontrarNum(A^.HI, num);
				encontrarNum(A^.HD, num);
			end
			else
				encontrarNum:= true;
		end;
	end;

var
	num: integer;
begin
	readln(num);
	writeln(encontrarNum(A, num));
end;

procedure modulo6 (A: arbol);

	function encontrarNom (A: arbol; nom: String): boolean;
	begin
		if (A = nil) then
			encontrarNom:= false
		else begin
			if (A^.dato.nombre <> nom) then
			begin
				encontrarNom(A^.HI, nom);
				encontrarNom(A^.HD, nom);
			end
			else
				encontrarNom:= true;
		end;
	end;

var
	nom: String;
begin
	readln(nom);
	writeln(encontrarNom(A, nom));
end;

function modulo7 (A: arbol): integer;
begin
	if (A <> nil) then
	begin
		modulo7:= modulo7(A^.HI) + modulo7(A^.HD) + 1;
	end
	else
		modulo7:= 0;
end;

procedure modulo8 (A: arbol);

	function edadSocios (A: arbol): integer;
	begin
		if (A <> nil) then
			edadSocios:= edadSocios(A^.HI) + edadSocios(A^.HD) + A^.dato.edad
		else
			edadSocios:= 0;
	end;

var
	totalSocios, totalEdades: integer;
begin
	totalSocios := modulo7(A);
    totalEdades := edadSocios(A);
    if totalSocios <> 0 then
        writeln('Promedio de edad: ', totalEdades / totalSocios)
    else
    begin
        writeln('No hay socios.');
    end;
end;

procedure modulo9 (A: arbol);
begin
	if (A <> nil) then
	begin
		modulo9(A^.HI);
		writeln(A^.dato.numero);
		modulo9(A^.HD);
	end;
end;

procedure modulo10(A: arbol);
begin
    if (A <> nil) then
    begin
        modulo10(A^.HD);
        if (A^.dato.numero mod 2 = 0) then
            writeln(A^.dato.numero);
        modulo10(A^.HI);
    end;
end;

	{-------------------PROGRAMA PRINCIPAL-------------------}

var
	A: arbol;
BEGIN
	crearA(A);
	modulo1(A);
	modulo2(A);
	modulo3(A);
	modulo4(A);
	modulo5(A);
	modulo6(A);
	writeln('La cantidad de socios es: ', modulo7(A));
	modulo8(A);
	modulo9(A);
	modulo10(A);
END.

{Escribir un programa que:
a. Implemente un módulo que lea información de socios de un club y las almacene en un árbol
binario de búsqueda. De cada socio se lee número de socio, nombre y edad. La lectura finaliza
con el número de socio 0 y el árbol debe quedar ordenado por número de socio.
b. Una vez generado el árbol, realice módulos independientes que reciban el árbol como parámetro y que :
i. Informe el número de socio más grande. Debe invocar a un módulo recursivo que retorne dicho valor.
ii. Informe los datos del socio con el número de socio más chico. Debe invocar a un módulo recursivo que retorne dicho socio.
iii. Informe el número de socio con mayor edad. Debe invocar a un módulo recursivo que retorne dicho valor.
iv. Aumente en 1 la edad de todos los socios.
v. Lea un valor entero e informe si existe o no existe un socio con ese valor. Debe invocar a un módulo recursivo que reciba el valor leído y retorne verdadero o falso.
vi. Lea un nombre e informe si existe o no existe un socio con ese nombre. Debe invocar a un módulo recursivo que reciba el nombre leído y retorne verdadero o falso.
vii. Informe la cantidad de socios. Debe invocar a un módulo recursivo que retorne dicha cantidad.
viii. Informe el promedio de edad de los socios. Debe invocar al módulo recursivo del inciso vii e invocar a un módulo recursivo que retorne la suma de las edades de los socios.
xi. Informe los números de socio en orden creciente.
x. Informe los números de socio pares en orden decreciente.}
