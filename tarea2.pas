// Tarea 2
// Hecho por José Arizaga
// Programacion 1 - INCO - FING - 2020

Function sonCartasIguales (a, b : TCarta) : boolean;
Begin
  sonCartasIguales := false;
  If (a.comodin = true) And (b.comodin = true) Then
    sonCartasIguales := true
  Else If (a.comodin = false) And (b.comodin = false) And (a.palo = b.palo) And
          (a.numero = b.numero) Then
         sonCartasIguales := true;
End;

Procedure armarTablero (mazo: TMazo; cantCols: TRangoCols; Var t : TTablero);

Var j, nCartas: Integer;
Begin
  // inicializacion de variables
  j := 1;
  nCartas := 1;
  t.tope := cantCols;

  // se inicializan los topes de todas las columnas
  For j:=1 To cantcols Do
    t.columnas[j].tope := 0;

  While nCartas <= mazo.tope Do
    Begin
      //se itera sobre las columnas
      For j:=1 To cantcols Do
        Begin
          If nCartas <= mazo.tope Then
            Begin
              t.columnas[j].tope := t.columnas[j].tope +1;
              //se inserta carta
              t.columnas[j].cartas[t.columnas[j].tope] := mazo.cartas[nCartas];
              //se cambia la carta
              nCartas := nCartas+1;
            End;
        End;
    End;
End;

Procedure levantarTablero (t : TTablero; Var mazo : TMazo);

Var j, i, nCartas: Integer;
Begin
  mazo.tope := 0;
  j := 1;
  i := 1;
  nCartas := 1;
  For j := 1 To t.tope Do
    Begin
      For i := 1 To t.columnas[j].tope Do
        Begin
          mazo.cartas[nCartas] := t.columnas[j].cartas[i];
          nCartas := nCartas+1;
          mazo.tope := mazo.tope+1;
        End;
    End;
End;

Function enQueColumna (carta : TCarta; t: Ttablero): TRangoCols;

Var j,i: Integer;
Begin
  For j := 1 To t.tope Do
    Begin
      For i := 1 To t.columnas[j].tope Do
        Begin
          If sonCartasIguales(t.columnas[j].cartas[i],carta) Then
            enQueColumna := j;
        End;
    End;
End;

Procedure estanEnAmbos (columna : TColumna; Var mazo : TMazo);

Type 
  aux = Record
    tope: 0..N;
    elems: array[1..N] Of TCarta;
  End;

Var 
  j,i: Integer;
  cartasNuevas: aux;
Begin
  cartasNuevas.tope := 0;
  j := 1;
  For j:=1 To mazo.tope Do
    Begin
      For i:=1 To columna.tope Do
        Begin
          If sonCartasIguales(columna.cartas[i],mazo.cartas[j]) Then
            Begin
              cartasNuevas.tope := cartasNuevas.tope+1;
              cartasNuevas.elems[cartasNuevas.tope] := mazo.cartas[j];
            End;
        End;
    End;
  mazo.tope := 0;
  For j:=1 To cartasNuevas.tope Do
    Begin
      mazo.tope := mazo.tope+1;
      mazo.cartas[j] := cartasNuevas.elems[j];
    End;
End;

Procedure convertirTablero (t : TTablero; Var tl : TTableroL);

Var j, i : Integer;
  p, aux : TColumnaL;
Begin

  tl.tope := t.tope;

  For j := 1 To t.tope Do
    Begin
      If t.columnas[j].tope>=1 Then
        Begin
          new(p);
          p^.carta := t.columnas[j].cartas[1];
          P^.sig := Nil;
          aux := p;
          i := 2;

          While i <= t.columnas[j].tope Do
            Begin

              If i <= t.columnas[j].tope Then
                Begin
                  new(aux^.sig);
                  aux := aux^.sig;
                  aux^.carta := t.columnas[j].cartas[i];
                End;
              i := i+1;
            End;
          aux^.sig := Nil;
          tl.columnas[j] := p;
        End;
    End;
End;
