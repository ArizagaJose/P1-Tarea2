// Tarea 2
// Hecho por José Arizaga
// Programacion 1 - INCO - FING - 2020

























{const
  COLS = 2;
  FILAS = 1; 

  N =  COLS * FILAS;
type 
  TNumero = 1 .. N div 4;

  TPalo = (bastos, copas, espadas, oros);

  TCarta = Record
    Case comodin: boolean Of 
      false : (numero: TNumero; palo: TPalo);
      true : ()
  End;

  TColumna = Record
    tope: 0 .. FILAS;
    cartas: array [1 .. FILAS] Of TCarta
  End;

  TTablero = Record
    tope : 0 .. COLS;
    columnas : array [1 .. COLS] Of TColumna
  End;

  TMazo = Record
    tope: 0 .. N;
    cartas: array [1..N] Of TCarta
  End;

  TRangoCols = 1 .. COLS;

  TColumnaL = ^ncartas;

  ncartas = Record
    carta : TCarta;
    sig : TColumnaL
  End;

  TTableroL = Record
    tope : 0 .. COLS;
    columnas : array [1 .. COLS] Of TColumnaL
  End;
}

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

Var i,j,k,cantFilas, nCartas: Integer;
Begin
  j := 1;
  i := 1;
  nCartas := 1;
  t.tope := cantCols;
  cantFilas := mazo.tope Div cantCols;

  For j:=1 To cantcols Do
    t.columnas[j].tope := 0;

  While nCartas <= mazo.tope Do
    Begin
      For j:=1 To cantcols Do
        Begin
          If nCartas <= mazo.tope Then
            Begin
              t.columnas[j].tope := t.columnas[j].tope +1;
              t.columnas[j].cartas[t.columnas[j].tope] := mazo.cartas[nCartas];
              nCartas := nCartas+1;
            End;
        End;
      i := i+1;
    End;
End;
Procedure levantarTablero (t : TTablero; Var mazo : TMazo);

Var i,j,cantFilas, nCartas: Integer;
Begin



{*j := 1;
  i := 1;
  nCartas := 1;
  t.tope := cantCols;
  cantFilas := round(mazo.tope / cantCols);
  

  For j:=1 To cantcols Do
    t.columnas[j].tope := 0;

  While nCartas <= FILAS Do
    Begin
      For j:=1 To cantCols Do
        Begin
          t.columnas[j].tope := t.columnas[j].tope +1;
          t.columnas[j].cartas[t.columnas[j].tope] := mazo.cartas[nCartas];
          nCartas := nCartas+1;

        End;
      i := i+1;
    End;
*}


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
