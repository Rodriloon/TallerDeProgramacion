Program Examen3;
type

	pedido = record
		fecha: integer;
		monto: real;
	end;
	
	lista = ^nodoL;
	nodoL = record
		dato: pedido;
		sig: lista;
	end;
	
	usuario = record
		dni: integer;
		nombre: string;
		lista: lista;
	end;
	
	arbol = ^nodoA;
	nodoA = record
		dato: usuario;
		HI: arbol;
		HD: arbol;
	end;

	{-------------------PROCESOS-------------------}

procedure punto1 (var A: arbol);

	procedure agregarAtras (var L: lista; var ult: lista; p: pedido);
	var
		nue: lista;
	begin
		new(nue);
		nue^.dato:= p;
		nue^.sig:= nil;
		if (L = nil) then
			L:= nue
		else
			ult^.sig:= nue;
		ult:= nue;
	end;
	
	procedure leerDatos (var u: usuario; var ult: lista);
	var
		p: pedido;
	begin
		readln(p.monto);
		if (p.monto <> 0) then
		begin
			readln(u.dni);
			readln(u.nombre);
			readln(p.fecha);
			u.lista:= nil;
			agregarAtras(u.lista, ult, p);
		end;
	end;
	
	procedure agregarArbol (var A: arbol; u: usuario; var ult: lista);
	begin
		if (A = nil) then
		begin
			new(A);
			A^.dato:= u;
			A^.HI:= nil;
			A^.HD:= nil;
		end
		else begin
			if (A^.dato.dni > u.dni) then
				agregarArbol(A^.HI, u, ult)
			else
				if (A^.dato.dni < u.dni) then
					agregarArbol(A^.HD, u, ult)
				else
					ult := A^.dato.lista;
					while (ult^.sig <> nil) do
						ult := ult^.sig;
					agregarAtras(ult, ult, u.lista^.dato);
		end;
	end;

var
	u: usuario;
	ult: lista;
begin
	A:= nil;
	ult:= nil;
	leerDatos(u, ult);
	while (u.lista^.dato.monto <> 0) do
	begin
		agregarArbol(A, u, ult);
		leerDatos(u, ult);
	end;
end;

procedure punto2 (A: arbol);

	function contarPedidos(L: lista; fec: integer): integer;
	var
		contador: integer;
	begin
		contador := 0;
		while (L <> nil) do
		begin
			if (L^.dato.fecha = fec) then
				contador := contador + 1;
			L := L^.sig;
		end;
		contarPedidos := contador;
	end;
	
	function recursivo2 (A: arbol; fec: integer): integer;
	begin
		if (A = nil) then
			recursivo2:= 0
		else
			recursivo2:= recursivo2(A^.HI, fec) + recursivo2(A^.HD, fec) + contarPedidos(A^.dato.lista, fec);
	end;

var
	fec: integer;
begin
	readln(fec);
	writeln('La cantidad de clientes que realizaron pedidos en la fecha es: ', recursivo2(A, fec));
end;

procedure punto3 (A: arbol);

	procedure sumarPedidos(L: lista; var totalA: real; var totalP: integer);
	begin
		while (L <> nil) do
		begin
			totalA := totalA + L^.dato.monto;
			totalP := totalP + 1;
			L := L^.sig;
		end;
	end;

	procedure recursivo3 (A: arbol; buscar: integer);
	var
		totalA: real;
		totalP: integer;
	begin
		if (A <> nil) then
		begin
			if (A^.dato.dni > buscar) then
				recursivo3(A^.HI, buscar)
			else
				if (A^.dato.dni < buscar) then
					recursivo3(A^.HD, buscar)
				else begin
					totalA:= 0;
					totalP:= 0;
					sumarPedidos(A^.dato.lista, totalA, totalP);
					writeln('El total abonado es: ', totalA:0:2);
					writeln('El total de pedidos fue: ', totalP);
				end;
		end;
	end;

var
	buscar: integer;
begin
	readln(buscar);
	recursivo3(A, buscar);
end;

	{-------------------PROGRAMA PRINCIPAL-------------------}

var
	A: arbol;
BEGIN
	punto1(A);
	punto2(A);
	punto3(A);
END.

{ Una pizzeria recibe pedidos telefonicos de sus clientes. De cada pedido interesa conocer: 
 DNI del cliente, nombre, fecha y monto a abonar del pedido

1- Lea la informacion de los pedidos telefonicos hasta ingresar uno con monto 0. A partir de 
 esto, genere una estructura que almacene para cada DNI de cliente, su nombre y una lista con
 informacion de la fecha y monto de los pedidos realizados. La estructura debe estar ordenada
 por DNI y ser eficiente para la busqueda por dicho criterio.
2- Informe la cantidad de clientes que realizaron pedidos en una fecha que se lee por teclado
3- Informar el total abonado y el total de pedidos realizados por el cliente cuyo DNI coincide
 con uno ingresado.}
