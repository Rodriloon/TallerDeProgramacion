Program P3E2;
type

	ventas = record
		codigo: integer;
		fecha: integer;
		cantidad: integer;
	end;
	
	productos = record
		codigo: integer;
		cantidad: integer;
	end;
	
	arbol1 = ^nodo1;
	nodo1 = record
		dato: ventas;
		HI: arbol1;
		HD: arbol1;
	end;
	
	arbol2 = ^nodo2;
	nodo2 = record
		dato: productos;
		HI: arbol2;
		HD: arbol2;
	end;

	{-------------------PROCESOS-------------------}

procedure puntoA (var A1: arbol1; var A2: arbol2);

	procedure leerVentas (var ven: ventas; var prod: productos);
    begin
        readln(ven.codigo);
        if (ven.codigo <> 0) then
        begin
            readln(ven.fecha);
            readln(ven.cantidad);
            prod.codigo:= ven.codigo;
            prod.cantidad:= ven.cantidad;
        end;
    end;
	
	procedure agregarArbol1 (var A1: arbol1; ven: ventas);
    begin
        if (A1 = nil) then
        begin
            new(A1);
            A1^.dato:= ven;
            A1^.HI:= nil;
            A1^.HD:= nil;
        end
        else begin
            if (ven.codigo <= A1^.dato.codigo) then
                agregarArbol1(A1^.HI, ven)
            else
                agregarArbol1(A1^.HD, ven);
        end;
    end;
	
	procedure agregarArbol2 (var A2: arbol2; prod: productos);
    begin
        if (A2 = nil) then
        begin
            new(A2);
            A2^.dato:= prod;
            A2^.HI:= nil;
            A2^.HD:= nil;
        end
        else begin
            if (prod.codigo < A2^.dato.codigo) then
                agregarArbol2(A2^.HI, prod)
            else
                if (prod.codigo > A2^.dato.codigo) then
                    agregarArbol2(A2^.HD, prod)
                else
                    A2^.dato.cantidad:= A2^.dato.cantidad + prod.cantidad;
        end;
    end;

var
	ven: ventas;
	prod: productos;
begin
	A1:= nil;
    A2:= nil;
    leerVentas(ven, prod);
    while (ven.codigo <> 0) do
    begin
        agregarArbol1(A1, ven);
        agregarArbol2(A2, prod);
        leerVentas(ven, prod);
    end;
end;

procedure puntoB (A1: arbol1);

	function buscar1 (A1: arbol1; num: integer): integer;
	var
		aux: integer;
	begin
		if (A1 = nil) then
			buscar1:= 0
		else begin
			if (A1^.dato.codigo = num) then
				aux:= A1^.dato.cantidad
			else
				aux:= 0;
			buscar1:= buscar1(A1^.HI, num) + buscar1(A1^.HD, num) + aux;
		end;
	end;

var
	num: integer;
begin
	readln(num);
	writeln('La cantidad total es: ', buscar1(A1, num));
end;

procedure puntoC (A2: arbol2);

	function buscar2 (A2: arbol2; num: integer): integer;
	begin
		if (A2 = nil) then
			buscar2:= 0
		else begin
			if (A2^.dato.codigo > num) then
				buscar2:= buscar2(A2^.HI, num)
			else
				if (num > A2^.dato.codigo) then
					buscar2:= buscar2(A2^.HD, num)
				else
					buscar2:= A2^.dato.cantidad
		end;
	end;

var
	num: integer;
begin
	readln(num);
	writeln('La cantidad total es: ', buscar2(A2, num));
end;

	{-------------------PROGRAMA PRINCIPAL-------------------}

var
	A1: arbol1;
	A2: arbol2;
BEGIN
	puntoA(A1,A2);
	puntoB(A1);
	puntoC(A2);
END.

{Escribir un programa que:
a. Implemente un módulo que lea información de ventas de un comercio. De cada venta se lee
código de producto, fecha y cantidad de unidades vendidas. La lectura finaliza con el código de
producto 0. Un producto puede estar en más de una venta. Se pide:
i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de
producto.
ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la
cantidad total de unidades vendida.
Nota: El módulo debe retornar los dos árboles.
b. Implemente un módulo que reciba el árbol generado en i. y un código de producto y retorne la cantidad total de unidades vendidas de ese producto.
c. Implemente un módulo que reciba el árbol generado en ii. y un código de producto y retorne la cantidad total de unidades vendidas de ese producto.}
