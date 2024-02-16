Program P4E1;
type
	rango300 = 1..300;
	
	oficinas = record
		codigo: integer;
		dni: integer;
		valor: real;
	end;
	
	vector = array [rango300] of oficinas;

	{-------------------PROCESOS-------------------}

procedure puntoA (var V: vector; var dimL: integer);

	procedure leerDatos (var o: oficinas);
	begin
		readln(o.codigo);
		if (o.codigo <> -1) then
		begin
			readln(o.dni);
			readln(o.valor);
		end;
	end;

var
	o: oficinas;
begin
	dimL:= 0;
	leerDatos(o);
	while ((o.codigo <> -1) and (dimL < 300)) do
	begin
		dimL:= dimL + 1;
		V[dimL]:= o;
		leerDatos(o);
	end;
end;

procedure puntoB (var V: vector; dimL: integer);
var
	i, j, pos: integer;
	aux: oficinas;
begin
	for i:= 1 to dimL - 1 do
	begin
		pos:= i;
		for j:= i + 1 to dimL do
			if (V[j].codigo < V[pos].codigo) then
				pos:= j;
		aux := V[pos];
		V[pos] := V[i];
		V[i]:= aux;
	end;
end;

procedure puntoC (V: vector; dimL: integer);

	procedure recursivoC(V: vector; dimL: integer; codigoBuscado: integer);
	var
	  izquierda, derecha, medio: integer;
	  encontrado: boolean;
	begin
	  izquierda := 1;
	  derecha := dimL;
	  encontrado := false;

	  while (izquierda <= derecha) and (not encontrado) do
	  begin
		medio := (izquierda + derecha) div 2;

		if V[medio].codigo = codigoBuscado then
		  encontrado := true
		else if V[medio].codigo < codigoBuscado then
		  izquierda := medio + 1
		else
		  derecha := medio - 1;
	  end;

	  if encontrado then
		writeln('Oficina encontrada. DNI del propietario: ', V[medio].dni)
	  else
		writeln('Oficina no encontrada.');
	end;

var
	codigoBuscado: integer;
begin
	readln(codigoBuscado);
	recursivoC(V, dimL, codigoBuscado);
end;

procedure puntoD (V: vector; dimL: integer);

	function recursivoD (V: vector; dimL: integer; var i: integer): real;
	begin
		if (i = dimL) then
			recursivoD:= 0
		else
			i:= i + 1;
			recursivoD:= recursivoD(V, dimL, i) + V[i].valor;
	end;

var
	i: integer;
begin
	i:= 0;
	recursivoD(V, dimL, i);
end;	

	{-------------------PROGRAMA PRINCIPAL-------------------}

var
	V: vector;
	dimL: integer;
BEGIN
	puntoA(V, dimL);
	puntoB(V, dimL);
	puntoC(V, dimL);
	puntoD(V, dimL);
END.

{El administrador de un edificio de oficinas, cuenta en papel, con la información del pago
de las expensas de dichas oficinas. Implementar un programa con:
a) Un módulo que retorne un vector, sin orden, con a lo sumo las 300 oficinas que
administra. Se debe leer, para cada oficina, el código de identificación, DNI del
propietario y valor de la expensa. La lectura finaliza cuando llega el código de
identificación -1.
b) Un módulo que reciba el vector retornado en a) y retorne dicho vector ordenado por
código de identificación de la oficina. Ordenar el vector aplicando uno de los métodos
vistos en la cursada.
c) Un módulo que realice una búsqueda dicotómica. Este módulo debe recibir el vector
generado en b) y un código de identificación de oficina. En el caso de encontrarlo, debe
retornar la posición del vector donde se encuentra y en caso contrario debe retornar 0.
Luego el programa debe informar el DNI del propietario o un cartel indicando que no
se encontró la oficina.
d) Un módulo recursivo que retorne el monto total de las expensas.}
