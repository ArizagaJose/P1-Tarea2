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
  If a.comodin = b.comodin Then
    sonCartasIguales := true
  Else
    Begin
      If a.numero = b.numero And a.palo = b.palo Then
        sonCartasIguales := false
      Else
        sonCartasIguales := false;
    End;
End;


Procedure armarTablero (mazo: TMazo; cantCols: TRangoCols; Var t : TTablero);
Begin




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
