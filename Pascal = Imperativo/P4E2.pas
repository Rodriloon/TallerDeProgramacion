Program P4E2;

type
    rango1 = 2010..2018;

    auto = record
        patente: char;
        anio: rango1;
        marca: string;
        modelo: string;
    end;
    
    arbol1 = ^nodo1;
    nodo1 = record
        dato: auto;
        HI: arbol1;
        HD: arbol1;
    end;
    
    autoMarca = record
        patente: char;
        anio: rango1;
        modelo: string;
    end;
    
    listaMarcas = ^nodoMarca;
    nodoMarca = record
        dato: autoMarca;
        sig: listaMarcas;
    end;
    
    moduloMarca = record
        marca: string;
        lista: listaMarcas;
    end;
    
    arbolMarca = ^nodoModulo;
    nodoModulo = record
        dato: moduloMarca;
        HI: arbolMarca;
        HD: arbolMarca;
    end;
    
    autoAnio = record
        patente: char;
        marca: string;
        modelo: string;
    end;
    
    LAutos = ^nodoAutos;
    nodoAutos = record
        dato: autoAnio;
        sig: LAutos;
    end;
    
    vector = array [rango1] of LAutos;

{-------------------PROCESOS-------------------}

procedure puntoA (var A1: arbol1; var AM: arbolMarca);

    procedure agregarAtras (var L: listaMarcas; a: autoMarca);
    var
        nue, act: listaMarcas;
    begin
        new(nue);
        nue^.dato:= a;
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
    
    procedure leerDatos (var a: auto; var mm: moduloMarca);
    var
        act: autoMarca;
    begin
        readln(a.patente);
        if (a.patente <> '-1') then
        begin
            readln(a.anio);
            readln(a.marca);
            readln(a.modelo);
            mm.lista:= nil;
            mm.marca:= a.marca;
            act.patente:= a.patente;
            act.anio:= a.anio;
            act.modelo:= a.modelo;
            agregarAtras(mm.lista, act); 
        end;
    end;
    
    procedure agregarArbol1 (var A1: arbol1; a: auto);
    begin
        if (A1 = nil) then
        begin
            new(A1);
            A1^.dato:= a;
            A1^.HI:= nil;
            A1^.HD:= nil;
        end
        else begin
            if (A1^.dato.patente >= a.patente) then
                agregarArbol1(A1^.HI, a)
            else
                agregarArbol1(A1^.HD, a);
        end;
    end;
    
    procedure agregarArbolM (var AM: arbolMarca; mm: moduloMarca);
    begin
        if (AM = nil) then
        begin
            new(AM);
            AM^.dato:= mm;
            AM^.HI:= nil;
            AM^.HD:= nil;
        end
        else begin
            if (AM^.dato.marca > mm.marca) then
                agregarArbolM(AM^.HI, mm)
            else
                if (AM^.dato.marca < mm.marca) then
                    agregarArbolM(AM^.HD, mm)
                else
                begin
                    agregarAtras(AM^.dato.lista, mm.lista^.dato);
                    mm.lista := mm.lista^.sig;
                end;
        end;
    end;
    
var
    a: auto;
    mm: moduloMarca;
begin
    A1:= nil;
    AM:= nil;
    leerDatos(a, mm);
    while (a.patente <> '-1') do
    begin
        agregarArbol1(A1, a);
        agregarArbolM(AM, mm);
        leerDatos(a, mm);
    end;
end;

procedure puntoB (A1: arbol1);

    function contarAutosPorMarca(A1: arbol1; mar: string): integer;
    begin
        if (A1 = nil) then
            contarAutosPorMarca := 0
        else begin
            contarAutosPorMarca := contarAutosPorMarca(A1^.HI, mar) + contarAutosPorMarca(A1^.HD, mar);
            if (A1^.dato.marca = mar) then
                contarAutosPorMarca := contarAutosPorMarca + 1;
        end;
    end;

var
    mar: string;
begin
    readln(mar);
    writeln(contarAutosPorMarca(A1, mar)); // Mostrar el resultado
end;

procedure puntoC (AM: arbolMarca);

    function contarAutosPorMarcaEnArbol(AM: arbolMarca; mar: string): integer;
    begin
        if (AM = nil) then
            contarAutosPorMarcaEnArbol := 0
        else begin
            if (AM^.dato.marca <> mar) then
                contarAutosPorMarcaEnArbol := contarAutosPorMarcaEnArbol(AM^.HI, mar) + contarAutosPorMarcaEnArbol(AM^.HD, mar)
            else
                begin
                    contarAutosPorMarcaEnArbol := 0;
                    // Recorrer la lista para contar autos
                    while (AM^.dato.lista <> nil) do
                    begin
                        contarAutosPorMarcaEnArbol := contarAutosPorMarcaEnArbol + 1;
                        AM^.dato.lista := AM^.dato.lista^.sig;
                    end;
                end;
        end;
    end;

var
    mar: string;
    total: integer;
begin
    total:= 0;
    readln(mar);
    total := contarAutosPorMarcaEnArbol(AM, mar);
    writeln(total); // Mostrar el resultado
end;

procedure puntoD (A1: arbol1; var V: vector);

    procedure inicializarVector(var V: vector);
    var
        i: rango1;
    begin
        for i:= 2010 to 2018 do
            V[i]:= nil;
    end;
    
    procedure agregarAtrasListaAutos(var L: LAutos; a: autoAnio);
    var
        nue, act: LAutos;
    begin
        new(nue);
        nue^.dato:= a;
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
    
    procedure ingresarAutosPorAnio(A1: arbol1; var V: vector);
    var
        act: autoAnio;
    begin
        if (A1 <> nil) then
        begin
            ingresarAutosPorAnio(A1^.HI, V);
            act.patente:= A1^.dato.patente;
            act.marca:= A1^.dato.marca;
            act.modelo:= A1^.dato.modelo;
            agregarAtrasListaAutos(V[A1^.dato.anio], act);
            ingresarAutosPorAnio(A1^.HD, V);
        end;
    end;

begin
    inicializarVector(V);
    ingresarAutosPorAnio(A1, V);
end;

procedure puntoE (A1: arbol1);

    function buscarModeloPorPatente(A1: arbol1; pato: char): string;
    begin
        if (A1 = nil) then
            buscarModeloPorPatente := 'No se encontro'
        else begin
            if (A1^.dato.patente = pato) then
                buscarModeloPorPatente := A1^.dato.modelo
            else
                if (A1^.dato.patente > pato) then
                    buscarModeloPorPatente := buscarModeloPorPatente(A1^.HI, pato)
                else
                    buscarModeloPorPatente := buscarModeloPorPatente(A1^.HD, pato);
        end;
    end;

var
    pato: char;
begin
    readln(pato);
    writeln(buscarModeloPorPatente(A1, pato)); // Mostrar el resultado
end;

procedure puntoF (AM: arbolMarca);

    function buscarModeloPorPatenteEnArbol(AM: arbolMarca; pato: char): string;
    begin
        if (AM = nil) then
            buscarModeloPorPatenteEnArbol := 'No se encontro'
        else begin
            if (AM^.dato.lista^.dato.patente = pato) then
                buscarModeloPorPatenteEnArbol := AM^.dato.lista^.dato.modelo
            else
                begin
                    buscarModeloPorPatenteEnArbol := buscarModeloPorPatenteEnArbol(AM^.HI, pato);
                    if (buscarModeloPorPatenteEnArbol = 'No se encontro') then
                        buscarModeloPorPatenteEnArbol := buscarModeloPorPatenteEnArbol(AM^.HD, pato);
                end;
        end;
    end;

var
    pato: char;
begin
    readln(pato);
    writeln(buscarModeloPorPatenteEnArbol(AM, pato)); // Mostrar el resultado
end;

{-------------------PROGRAMA PRINCIPAL-------------------}

var
    A1: arbol1;
    AM: arbolMarca;
    V: vector;
BEGIN
    puntoA(A1, AM);
    puntoB(A1);
    puntoC(AM);
    puntoD(A1, V);
    puntoE(A1);
    puntoF(AM);
END.


{Una agencia dedicada a la venta de autos ha organizado su stock y, dispone en papel de la información de los autos en venta. Implementar un programa que:
a) Lea la información de los autos (patente, año de fabricación (2010..2018), marca y modelo) y los almacene en dos estructuras de datos:
i. Una estructura eficiente para la búsqueda por patente.
ii. Una estructura eficiente para la búsqueda por marca. Para cada marca se deben almacenar todos juntos los autos pertenecientes a ella.
b) Invoque a un módulo que reciba la estructura generado en a) i y una marca y retorne la cantidad de autos de dicha marca que posee la agencia.
c) Invoque a un módulo que reciba la estructura generado en a) ii y una marca y retorne la cantidad de autos de dicha marca que posee la agencia.
d) Invoque a un módulo que reciba el árbol generado en a) i y retorne una estructura con la información de los autos agrupados por año de fabricación.
e) Invoque a un módulo que reciba el árbol generado en a) i y una patente y devuelva el modelo del auto con dicha patente.
f) Invoque a un módulo que reciba el árbol generado en a) ii y una patente y devuelva el modelo del auto con dicha patente.}
