Program P4E3;
type
	rango10 = 1..10;

	producto = record
		codigo: integer;
		rubro: rango10;
		stock: integer;
		precioU: real;
	end;
	
	arbol = ^nodoA;
	nodoA = record
		dato: producto;
		HI: arbol;
		HD: arbol;
	end;
	
	vector = array [rango10] of arbol;

	{-------------------PROCESOS-------------------}

procedure generarV (var V: vector);

	procedure inicializarVector (var V: vector);
	var
		i: integer;
	begin
		for i:= 1 to 10 do
			V[i]:= nil;
	end;
	
	procedure leerDatos (var p: producto);
	begin
		readln(p.codigo);
		if (p.codigo <> -1) then
		begin
			readln(p.rubro);
			readln(p.stock);
			readln(p.precioU);
		end;
	end;
	
	procedure agregarArbol (var A: arbol; p: producto);
	begin
		if (A = nil) then
		begin
			new(A);
			A^.dato:= p;
			A^.HI:= nil;
			A^.HD:= nil;
		end
		else begin
			if (A^.dato.codigo >= p.codigo) then
				agregarArbol(A^.HI, p)
			else
				agregarArbol(A^.HD, p);
		end;
	end;
	
var
	p: producto;
begin
	inicializarVector(V);
	leerDatos(p);
	while (p.codigo <> -1) do
	begin
		agregarArbol(V[p.rubro], p);
		leerDatos(p);
	end;
end;

procedure puntoB (V: vector);

	procedure recursivoB (A: arbol; ru: rango10; cod: integer; var existe: boolean);
	begin
		if (A = nil) then
			existe:= false
		else begin
			if (A^.dato.codigo = cod) then
				existe:= true
			else
				if (A^.dato.codigo > cod) then
					recursivoB(A^.HI, ru, cod, existe)
				else
					recursivoB(A^.HD, ru, cod, existe)
		end;
	end;

var
	ru: rango10;
	cod: integer;
	existe: boolean;
begin
	readln(ru);
	readln(cod);
	existe:= false;
	recursivoB(V[ru], ru, cod, existe);
end;

procedure puntoC (V: vector);

	procedure recursivoC (A: arbol; var codigo: integer; var stock: integer);
	begin
		if (A = nil) then
		begin
			codigo:= -1;
			stock:= -1;
		end
		else begin
			recursivoC(A^.HD, codigo, stock);
			if (A^.dato.codigo > codigo) then
			begin
				codigo:= A^.dato.codigo;
				stock:= A^.dato.stock;
			end;
		end;
	end;

var
	i: rango10;
	codigo, stock: integer;
begin
	for i:= 1 to 10 do
	begin
		codigo:= -1;
		stock:= 0;
		recursivoC(V[i], codigo, stock);
		writeln('El producto ', codigo, ' tiene un stock de ', stock);
	end;
end;

procedure puntoD (V: vector);

	function recursivoD (A: arbol; codMen: integer; codMay: integer): integer;
	begin
		if (A = nil) then
			recursivoD:= 0
		else begin
			if (A^.dato.codigo < codMen) then
				recursivoD:= recursivoD(A^.HD, codMen, codMay)
			else
				if (A^.dato.codigo > codMay) then
					recursivoD:= recursivoD(A^.HI, codMen, codMay)
				else
					recursivoD:= recursivoD(A^.HI, codMen, codMay) + recursivoD(A^.HD, codMen, codMay) + 1;
		end;
	end;

var
	codMen, codMay, i: integer;
begin
	readln(codMen);
	readln(codMay);
	for i:= 1 to 10 do
	begin
		writeln('La cantidad de productos entre los codigos es: ', recursivoD(V[i], codMen, codMay));
	end;
end;

	{-------------------PROGRAMA PRINCIPAL-------------------}

var
	V: vector;
BEGIN
	generarV(V);
	puntoB(V);
	puntoC(V);
	puntoD(V);
END.

{Un supermercado requiere el procesamiento de sus productos. De cada producto se conoce código, rubro (1..10), stock y precio unitario. Se pide:
a) Generar una estructura adecuada que permita agrupar los productos por rubro. A su vez, para cada rubro, se requiere que la búsqueda de un producto por código sea lo
más eficiente posible. La lectura finaliza con el código de producto igual a -1.
b) Implementar un módulo que reciba la estructura generada en a), un rubro y un código de producto y retorne si dicho código existe o no para ese rubro.
c) Implementar un módulo que reciba la estructura generada en a), y retorne, para cada rubro, el código y stock del producto con mayor código.
d) Implementar un módulo que reciba la estructura generada en a), dos códigos y retorne, para cada rubro, la cantidad de productos con códigos entre los dos valores ingresados.}
