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

Var i,j,k, nCartas: Integer;
Begin
{
m:=1;
t.tope:=cantCols;
mazo.tope:=N;
for p:=1 to cantCols do
	t.columnas[p].tope:=0;
	while (m<=N) do
		begin
			if (i<= cantCols) then 
			begin
				t.columnas[i].tope := t.columnas[i].tope +1;
				t.columnas[i].cartas[j]:=mazo.cartas[m];
				i:=i+1;
				m:=m+1;
			end
			else
				begin
					t.columnas[i].tope:=t.columnas[i].tope +1;
					i:=1;
					j:=j+1;
				end;
			end;
		end;
	

*}
  j := 1;
  i := 1;

  nCartas:=1;
  t.tope := cantCols;
	
  For k:=1 to N Do
  Begin
      For j:=1 To cantCols Do
        Begin

	if nCartas<= mazo.tope then
	begin
          t.columnas[j].cartas[i] := mazo.cartas[nCartas];
	  t.columnas[j].tope := t.columnas[j].tope+1;
	  nCartas := nCartas+1;
	  //aca van las cartas
  end;
        End;
        i := i+1;
    End;

end;
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
