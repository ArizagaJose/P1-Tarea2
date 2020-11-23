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

Var j,cantFilas, nCartas: Integer;
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
Begin

End;

Function enQueColumna (carta : TCarta; t: Ttablero): TRangoCols;
Begin

End;

Procedure estanEnAmbos (columna : TColumna; Var mazo : TMazo);
Begin


End;

Procedure convertirTablero (t : TTablero; Var tl : TTableroL);
Begin

End;
