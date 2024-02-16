Program P3p2E2;
type

	prestamos = record
		isbn: integer;
		numero: integer;
		dia: integer;
		mes: integer;
		diasPrestado: integer;
	end;
	
	prestamoU = record
		numero: integer;
		dia: integer;
		mes: integer;
		diasPrestado: integer;
	end;
	
	lista = ^nodoL;
	nodoL = record
		dato: prestamoU;
		sig: lista;
	end;
	
	prestamoISBN = record
		isbn: integer;
		lista: lista;
	end;
	
	arbol1 = ^nodo1;
	nodo1 = record
		dato: prestamos;
		HI: arbol1;
		HD: arbol1;
	end;
	
	arbol2 = ^nodo2;
	nodo2 = record
		dato: prestamoISBN;
		HI: arbol2;
		HD: arbol2;
	end;
	
	cantidades = record
		isbn: integer;
		cant: integer;
	end;
	
	arbolFG = ^nodoFG;
	nodoFG = record
		dato: cantidades;
		HI: arbolFG;
		HD: arbolFG;
	end;

	{-------------------PROCESOS-------------------}

procedure puntoA (var A1: arbol1; var A2: arbol2);

	procedure agregarAtras (var L: Lista; p2: prestamoU);
	var
		nue, act: Lista;
	begin
		new(nue);
		nue^.dato:= p2;
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

	procedure leerDatos (var p: prestamos; var p2: prestamoISBN);
	var
		act: prestamoU;
	begin
		readln(p.isbn);
		if (p.isbn <> -1) then
		begin
			readln(p.numero);
			readln(p.dia);
			readln(p.mes);
			readln(p.diasPrestado);
			p2.lista:= nil;
			p2.isbn:= p.isbn;
			act.numero:= p.numero;
			act.dia:= p.dia;
			act.mes:= p.mes;
			act.diasPrestado:= p.diasPrestado;
			agregarAtras(p2.lista, act);
		end;
	end;

	procedure agregarArbol1 (var A1: arbol1; p: prestamos);
	begin
		if (A1 = nil) then
		begin
			new(A1);
			A1^.dato:= p;
			A1^.HI:= nil;
			A1^.HD:= nil;
		end
		else begin
			if (A1^.dato.ISBN >= p.isbn) then
				agregarArbol1(A1^.HI, p)
			else
				agregarArbol1(A1^.HD, p);
		end;
	end;
	
	procedure agregarArbol2 (var A2: arbol2; p2: prestamoISBN);
	begin
		if (A2 = nil) then
		begin
			new(A2);
			A2^.dato:= p2;
			A2^.HI:= nil;
			A2^.HD:= nil;
		end
		else begin
			if (A2^.dato.ISBN > p2.isbn) then
				agregarArbol2(A2^.HI, p2)
			else
				if (A2^.dato.ISBN < p2.isbn) then
					agregarArbol2(A2^.HD, p2)
				else begin
					agregarAtras(A2^.dato.lista, p2.lista^.dato);
					p2.lista := p2.lista^.sig;
				end;
		end;
	end;

var
	p: prestamos;
	p2: prestamoISBN;
begin
	A1:= nil;
	A2:= nil;
	leerDatos(p, p2);
	while (p.isbn <> -1) do
	begin
		agregarArbol1(A1, p);
		agregarArbol2(A2, p2);
		leerDatos(p, p2);
	end;
end;

procedure puntoB (A1: arbol1);

	procedure recursivoB (A1: arbol1; var mayor: integer);
	begin
		if (A1 = nil) then
			mayor:= 0
		else begin
			recursivoB(A1^.HD, mayor);
			if (A1^.dato.isbn > mayor) then
				mayor:= A1^.dato.isbn;
		end;
	end;

var
	mayor: integer;
begin
	mayor:= -1;
	recursivoB(A1, mayor);
end;

procedure puntoC (A2: arbol2);

	procedure recursivoC (A2: arbol2; var menor: integer);
	begin
		if (A2 = nil) then
			menor:= -1
		else begin
			recursivoC(A2^.HI, menor);
			if (A2^.dato.isbn < menor) then
				menor:= A2^.dato.isbn;
		end;
	end;

var
	menor: integer;
begin
	menor:= 9999;
	recursivoC(A2, menor);
end;

procedure puntoD (A1: arbol1);

	function recursivoD (A1: arbol1; num: integer): integer;
	begin
		if (A1 = nil) then
			recursivoD:= 0
		else begin
			recursivoD:= recursivoD(A1^.HI, num) + recursivoD(A1^.HD, num);
			if (A1^.dato.numero = num) then
				recursivoD:= recursivoD + 1;
		end;
	end;
	
var
	num: integer;
begin
	readln(num);
	recursivoD(A1, num);
end;

procedure puntoE (A2: arbol2);

	function recursivoE (A2: arbol2; num: integer): integer;
	begin
		if (A2 = nil) then
			recursivoE:= 0
		else begin
			recursivoE:= recursivoE(A2^.HI, num) + recursivoE(A2^.HD, num);
			while (A2^.dato.lista <> nil) do
			begin
				if (A2^.dato.lista^.dato.numero = num) then
					recursivoE:= recursivoE + 1;
			end;
		end;
	end;
	
var
	num: integer;
begin
	readln(num);
	recursivoE(A2, num);
end;

procedure puntoF (A1: arbol1; var AF: arbolFG);

	procedure leer (A1: arbol1; var c: cantidades);
	begin
		c.isbn:= A1^.dato.isbn;
		c.cant:= 1;
	end;

	procedure agregarArbol (var AF: arbolFG; c: cantidades);
	begin
		if (AF = nil) then
		begin
			new(AF);
			AF^.dato:= c;
			AF^.HI:= nil;
			AF^.HD:= nil;
		end
		else begin
			if (AF^.dato.isbn > c.isbn) then
				agregarArbol(AF^.HI, c)
			else
				if (AF^.dato.isbn < c.isbn) then
					agregarArbol(AF^.HD, c)
				else
					AF^.dato.cant:= AF^.dato.cant + 1;
		end;
	end;

var
	c: cantidades;
begin
	AF:= nil;
	while (A1 <> nil) do
	begin
		leer(A1, c);
		agregarArbol(AF, c);
		A1:= A1^.HD
	end;
end;

procedure puntoG (A2: arbol2; var AG: arbolFG);

	procedure leer (A2: arbol2; var c: cantidades);
	var
		total: integer;
	begin
		total:= 0;
		c.isbn:= A2^.dato.isbn;
		while (A2^.dato.lista <> nil) do
		begin
			total:= total + 1;
			A2^.dato.lista:= A2^.dato.lista^.sig;
		end;
		c.cant:= total;
	end;

	procedure agregarArbol (var AG: arbolFG; c: cantidades);
	begin
		if (AG = nil) then
		begin
			new(AG);
			AG^.dato:= c;
			AG^.HI:= nil;
			AG^.HD:= nil;
		end
		else begin
			if (AG^.dato.isbn > c.isbn) then
				agregarArbol(AG^.HI, c)
			else
				if (AG^.dato.isbn < c.isbn) then
					agregarArbol(AG^.HD, c)
				else
					AG^.dato.cant:= AG^.dato.cant + c.cant;
		end;
	end;

var
	c: cantidades;
begin
	AG:= nil;
	while (A2 <> nil) do
	begin
		leer(A2, c);
		agregarArbol(AG, c);
		A2:= A2^.HD;
	end;
end;

procedure puntoH (AG: arbolFG);
begin
	if (AG <> nil) then
	begin
		puntoH(AG^.HI);
		writeln(AG^.dato.isbn);
		writeln(AG^.dato.cant);
		puntoH(AG^.HD);
	end;
end;

procedure puntoI (A1: arbol1);

	function recursivoI (A1: arbol1; menor, mayor: integer):integer; 
	begin
		if (A1 = nil) then
			recursivoI:= 0
		else begin
			if (A1^.dato.isbn > mayor) then
				recursivoI:= recursivoI(A1^.HI, menor, mayor)
			else
				if (A1^.dato.isbn < menor) then
					recursivoI:= recursivoI(A1^.HD, menor, mayor)
				else
					recursivoI:= recursivoI(A1^.HI, menor, mayor) + recursivoI(A1^.HD, menor, mayor) + 1;
		end;
	end;

var
	menor, mayor: integer;
begin
	readln(menor);
	readln(mayor);
	recursivoI(A1, menor, mayor);
end;

procedure puntoJ (A2: arbol2);

	function recursivoJ (A2: arbol2; menor, mayor: integer):integer; 
	var
		total: integer;
	begin
		total:= 0;
		if (A2 = nil) then
			recursivoJ:= 0
		else begin
			if (A2^.dato.isbn > mayor) then
				recursivoJ:= recursivoJ(A2^.HI, menor, mayor)
			else
				if (A2^.dato.isbn < menor) then
					recursivoJ:= recursivoJ(A2^.HD, menor, mayor)
				else begin
					while (A2^.dato.lista <> nil) do
					begin
						total:= total + 1;
						A2^.dato.lista:= A2^.dato.lista^.sig;
					end;
					recursivoJ:= recursivoJ(A2^.HI, menor, mayor) + recursivoJ(A2^.HD, menor, mayor) + total;
				end;
		end;
	end;

var
	menor, mayor: integer;
begin
	readln(menor);
	readln(mayor);
	recursivoJ(A2, menor, mayor);
end;

	{-------------------PROGRAMA PRINCIPAL-------------------}

var
	A1: arbol1;
	A2: arbol2;
	AF: arbolFG;
	AG: arbolFG;
BEGIN
	puntoA(A1, A2);
	puntoB(A1);
	puntoC(A2);
	puntoD(A1);
	puntoE(A2);
	puntoF(A1, AF);
	puntoG(A2, AG);
	puntoH(AG);
	puntoI(A1);
	puntoJ(A2);
END.

{Una biblioteca nos ha encargado procesar la información de los préstamos realizados
durante el año 2021. De cada préstamo se conoce el ISBN del libro, el número de socio, día
y mes del préstamo y cantidad de días prestados. Implementar un programa con: 
a. Un módulo que lea préstamos y retorne 2 estructuras de datos con la información de
los préstamos. La lectura de los préstamos finaliza con ISBN -1. Las estructuras deben ser eficientes para buscar por ISBN.
i. En una estructura cada préstamo debe estar en un nodo.
ii. En otra estructura, cada nodo debe contener todos los préstamos realizados al ISBN. (prestar atención sobre los datos que se almacenan).
b. Un módulo recursivo que reciba la estructura generada en i. y retorne el ISBN más grande.
c. Un módulo recursivo que reciba la estructura generada en ii. y retorne el ISBN más pequeño.
d. Un módulo recursivo que reciba la estructura generada en i. y un número de socio. El módulo debe retornar la cantidad de préstamos realizados a dicho socio.
e. Un módulo recursivo que reciba la estructura generada en ii. y un número de socio. El módulo debe retornar la cantidad de préstamos realizados a dicho socio.
f. Un módulo que reciba la estructura generada en i. y retorne una nueva estructura ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces que se prestó.
g. Un módulo que reciba la estructura generada en ii. y retorne una nueva estructura ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces que se prestó.
h. Un módulo recursivo que reciba la estructura generada en g. y muestre su contenido.
i. Un módulo recursivo que reciba la estructura generada en i. y dos valores de ISBN. El módulo debe retornar la cantidad total de préstamos realizados a los ISBN comprendidos entre los dos valores recibidos (incluidos).
j. Un módulo recursivo que reciba la estructura generada en ii. y dos valores de ISBN. El módulo debe retornar la cantidad total de préstamos realizados a los ISBN comprendidos entre los dos valores recibidos (incluidos).}
