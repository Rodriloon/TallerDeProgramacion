Program P3p2E1;
type

	producto = record
		codigo: integer;
		cantVendidas: integer;
		monto: real;
	end;
	
	venta = record
		codigoVen: integer;
		codigoProd: integer;
		cantidad: integer;
		precio: real;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: producto;
		HI: arbol;
		HD: arbol;
	end;

	{-------------------PROCESOS-------------------}

procedure puntoA (var A: arbol);

	procedure leerDatos (var p: producto; var v: venta);
	begin
		readln(v.codigoVen);
		if (v.codigoVen <> -1) then
		begin	
			readln(v.codigoProd);
			readln(v.cantidad);
			readln(v.precio);
			p.codigo:= v.codigoProd;
			p.cantVendidas:= v.cantidad;
			p.monto:= (v.cantidad * v.precio);
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
			if (A^.dato.codigo > p.codigo) then
				agregarArbol(A^.HI, p)
			else
				if (A^.dato.codigo < p.codigo) then
					agregarArbol(A^.HD, p)
				else begin
					A^.dato.cantVendidas:= A^.dato.cantVendidas + p.cantVendidas;
					A^.dato.monto:= A^.dato.monto + p.monto;
				end;
		end;
	end;

var
	p: producto;
	v: venta;
begin
	A:= nil;
	leerDatos(p, v);
	while (v.codigoVen <> -1) do
	begin
		agregarArbol(A, p);
		leerDatos(p, v);
	end;
end;

procedure puntoB (A: arbol);

	procedure imprimir (p: producto);
	begin
		writeln(p.codigo);
		writeln(p.cantVendidas);
		writeln(p.monto);
	end;
	
begin
	if (A <> nil) then
	begin
		puntoB(A^.HI);
		imprimir(A^.dato);
		puntoB(A^.HD);
	end;
end;

procedure puntoC (A: arbol);

	procedure recursivoC (A: arbol; var mayor: integer; var codigoM: integer);
	begin
		if (A = nil) then
		begin
			mayor:= -1;
			codigoM:= -1;
		end
		else begin
			recursivoC(A^.HI, mayor, codigoM);
			if (A^.dato.cantVendidas > mayor) then
			begin
				mayor:= A^.dato.cantVendidas;
				codigoM:= A^.dato.codigo;
			end;
			recursivoC(A^.HD, mayor, codigoM);
		end;
	end;

var
	mayor, codigoM: integer;
begin
	codigoM:= -1;
	mayor:= -1;
	recursivoC(A, mayor, codigoM);
end;

procedure puntoD (A: arbol);

	function menores (A: arbol; tope: integer): integer;
	begin
		if (A = nil) then
			menores:= 0
		else begin
			if (A^.dato.codigo < tope) then
			begin
				menores:= menores(A^.HI, tope) + menores(A^.HD, tope);
				menores:= menores + 1;
			end
			else
				menores:= menores(A^.HI,tope);
		end;
	end;

var
	tope: integer;
begin
	readln(tope);
	writeln('La cantidad de códigos menores que él que hay en la estructura es: ', menores(A, tope));
end;

procedure puntoE (A: arbol);

	procedure recursivoE (A: arbol; minimo, maximo: real; var montoTotal: real);
	begin
		if (A <> nil) then
        begin
            if (A^.dato.codigo >= minimo) and (A^.dato.codigo < maximo) then
            begin
                montoTotal:= montoTotal + A^.dato.monto;
                recursivoE(A^.HI, minimo, maximo, montoTotal);
                recursivoE(A^.HD, minimo, maximo, montoTotal);
            end
            else if (A^.dato.codigo < minimo) then
                recursivoE(A^.HD, minimo, maximo, montoTotal)
            else
                recursivoE(A^.HI, minimo, maximo, montoTotal);
        end;
	end;

var
	minimo, maximo, montoTotal: real;
begin
	montoTotal:= 0;
	readln(minimo);
	readln(maximo);
	writeln('El monto total entre los dos valores es: ', montoTotal);
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
END.

{Implementar un programa modularizado para una librería que:
a. Almacene los productos vendidos en una estructura eficiente para la búsqueda por código de producto.
 De cada producto deben quedar almacenados la cantidad total de unidades vendidas y el monto total. De cada venta se lee código de venta, código del
producto vendido, cantidad de unidades vendidas y precio unitario. El ingreso de las ventas finaliza cuando se lee el código de venta -1.
b. Imprima el contenido del árbol ordenado por código de producto.
c. Contenga un módulo que reciba la estructura generada en el punto a y retorne el código de producto con mayor cantidad de unidades vendidas.
d. Contenga un módulo que reciba la estructura generada en el punto a y un código de producto y retorne la cantidad de códigos menores que él que hay en la estructura.
e. Contenga un módulo que reciba la estructura generada en el punto a y dos códigos de producto y retorne el monto total entre todos los códigos de productos 
 comprendidos entre los dos valores recibidos (sin incluir).}
