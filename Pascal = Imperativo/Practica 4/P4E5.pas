program P4E5;
type
    reclamo = record
        codigo: integer;
        anio: integer;
        tipo: string;
    end;
    
    lista = ^nodoL;
    nodoL = record
        dato: reclamo;
        sig: lista;
    end;
    
    persona = record
        dni: integer;
        cant: integer;
        lista: lista;
    end;
    
    arbol = ^nodoA;
    nodoA = record
        dato: persona;
        HI: arbol;
        HD: arbol;
    end;

	{-------------------PROCESOS-------------------}

procedure AgregarAdelante(var L: lista; r: reclamo);
var
    nue: lista;
begin
    new(nue);
    nue^.dato := r;
    nue^.sig := L;
    L := nue;
end;

procedure LeerDatos(var p: persona);
var
    act: reclamo;
begin
    readln(act.codigo);
    if (act.codigo <> -1) then
    begin
        readln(act.anio);
        readln(act.tipo);
        readln(p.dni);
        p.cant := p.cant + 1; 
        AgregarAdelante(p.lista, act); 
    end;
end;

procedure AgregarArbol(var A: arbol; p: persona);
begin
    if (A = nil) then
    begin
        new(A);
        A^.dato := p;
        A^.HI := nil;
        A^.HD := nil;
    end
    else
    begin
        if (A^.dato.dni > p.dni) then
            AgregarArbol(A^.HI, p)
        else if (A^.dato.dni < p.dni) then
            AgregarArbol(A^.HD, p)
        else
        begin
            while (p.lista <> nil) do
            begin
                AgregarAdelante(A^.dato.lista, p.lista^.dato);
                p.lista := p.lista^.sig;
            end;
            A^.dato.cant := A^.dato.cant + p.cant; 
        end;
    end;
end;

procedure CargarReclamos(var A: arbol);
var
    p: persona;
    reclamoValido: Boolean;
begin
    A := nil;
    reclamoValido := true;
    while reclamoValido do
    begin
        LeerDatos(p);
        if (p.lista <> nil) then
            AgregarArbol(A, p)
        else
            reclamoValido := false;
    end;
end;

	{-------------------PROGRAMA PRINCIPAL-------------------}
var
    A: arbol;
begin
    CargarReclamos(A); 
end.

{Realizar el punto a) del ejercicio anterior, pero sabiendo que todos los reclamos de un mismo DNI se leen de forma consecutiva (no significa que vengan ordenados los DNI).}
