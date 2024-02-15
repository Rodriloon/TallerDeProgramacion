Program P2E4;
type

	vector = array [1..20] of integer;

{-------------------PROCESOS-------------------}

procedure puntoA(var V: vector);

	procedure recursivoA(var V: vector; var dimL: integer);
	begin
		Randomize;
		if (dimL < 20) then
		begin
			V[dimL]:= random(100);
			recursivoA(V, dimL + 1);
		end;
	end;

var
	dimL: integer;
begin
	dimL:= 1;
	recursivoA(V, dimL);
end;

procedure puntoB(V: vector);

	procedure recursivoB(V: vector; var max: integer; var dimL: integer);
	begin
		if (dimL <= 20) then
		begin
			if (V[dimL] > max) then
			begin
				max:= V[dimL];
			end;
			recursivoB(V, max, dimL + 1);
		end;
	end;

var
	dimL, max: integer;
begin
	dimL:= 1;
	max:= -1;
	recursivoB(V, max, dimL);
	WriteLn('El máximo valor del vector es: ', max);
end;

procedure puntoC(V: vector);

	function recursivoC(V: vector; var dimL: integer): integer;
	begin
		if (dimL <= 20) then
		begin
			recursivoC := V[dimL] + recursivoC(V, dimL + 1);
		end
		else
		begin
			recursivoC := 0;
		end;
	end;

var
	dimL, total: integer;
begin
	dimL:= 1;
	total:= recursivoC(V, dimL);
	WriteLn('La suma de los valores del vector es: ', total);
end;

{-------------------PROGRAMA PRINCIPAL-------------------}

var
	V: vector;
begin
	puntoA(V);
	puntoB(V);
	puntoC(V);
end.

{Escribir un programa con:
a. Un módulo recursivo que retorne un vector de 20 números enteros “random” mayores a 0 y menores a 100.
b. Un módulo recursivo que devuelva el máximo valor del vector.
c. Un módulo recursivo que devuelva la suma de los valores contenidos en el vector.}
