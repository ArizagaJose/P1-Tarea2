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
//i columnas
//j filas

procedure insertarCarta(carta: TCarta, var lista: TColumna )

begin
  with lista Do
  begin
  tope := tope+1
  cartas[tope] := carta
  end;

end;


Var i, j, nCartas: Integer;
Begin
  nCartas := 1;
  j := 1;
  t.columnas[j].tope := 0;
  i := 1;

  While nCartas <= mazo.tope Do
  Begin

      For j:=1 To cantCols Do
        Begin
          t.columnas[j].tope := t.columnas[j].tope + 1;
          t.columnas[j].cartas[t.columnas[j].tope] := mazo.cartas[nCartas];
          //aca van las cartas
          nCartas := nCartas + 1;
        End;
        i := i+1;
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
