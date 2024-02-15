Program P2E2;

	{-------------------PROCESOS-------------------}

procedure puntoA();

	procedure recursivo(aux: integer);
	var
		resto: integer;
	begin
		if (aux <> 0) then
		begin
			resto:= aux mod 10;
			recursivo(aux div 10);
			writeln(resto);
		end;
	end;

var
	aux: integer;
begin
	readln(aux);
	while (aux <> 0) do
	begin
		recursivo(aux);
		readln(aux);
	end;
end;

	{-------------------PROGRAMA PRINCIPAL-------------------}

BEGIN
	puntoA();
END.

{ Realizar un programa que lea números hasta leer el valor 0 e imprima, para cada número 
 leído, sus dígitos en el orden en que aparecen en el número. Debe implementarse un módulo
 recursivo que reciba el número e imprima lo pedido. Ejemplo si se lee el valor 256, se debe imprimir 2 5 6.}


resto:= num mod 10			//OBTENGO ULTIMO DIGITO
num:= num div 10			//ACHICO NUMERO
