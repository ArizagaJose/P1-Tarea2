# P1-Tarea2
## Introducción

En un popular truco un mago le pide a un espectador que elija una carta de un mazo y, luego de unas pasadas en las que exhibe las cartas en un tablero, 'adivina' la carta elegida por el espectador.

El procedimiento consiste en: 

El mago le pide al espectador que elija una carta de un mazo,
mientras no haya adivinado cuál es la carta elegida, el mago repite el siguiente procedimiento: pone las cartas en el tablero, le pregunta al espectador en qué columna está la carta elegida y levanta las cartas del tablero.
Veamos un ejemplo para las cartas siguientes, en donde J representa el comodín y las letras B, C, E  y O representan los palos bastos, copas, espadas y oros, respectivamente:
1E J 2O  3C 2C 2E  1C 1O 12C  9O 5C 3B  8B 4E 7E  8O 3E 11O  10B 6C
El mago le pide al espectador que elija una carta, que suponemos que es el 2 de copas, [ 2 C].

Dispone las cartas, en este ejemplo, en tres columnas. Pone las cartas fila por fila, de arriba hacia abajo y de izquierda a derecha (se debe notar que la última fila puede no quedar completa):

[ 1 E ][  J  ][ 2 O ]
[ 3 C ][ 2 C ][ 2 E ]
[ 1 C ][ 1 O ][12 C ]
[ 9 O ][ 5 C ][ 3 B ]
[ 8 B ][ 4 E ][ 7 E ]
[ 8 O ][ 3 E ][11 O ]
[10 B ][ 6 C ][     ]



El mago le pide al espectador que le diga en qué columna está la carta elegida. La respuesta es que está en la columna 2.

Ahora levanta las cartas columna por columna, de izquierda a derecha y cada columna desde arriba hacia abajo. El resultado es:  

1E 3C 1C 9O 8B 8O 10B J 2C 1O 5C 4E 3E 6C 2O 2E 12C 3B 7E 11O

Luego vuelve a poner las cartas en el tablero fila por fila:

[ 1 E ][ 3 C ][ 1 C ]
[ 9 O ][ 8 B ][ 8 O ]
[10 B ][  J  ][ 2 C ]
[ 1 O ][ 5 C ][ 4 E ]
[ 3 E ][ 6 C ][ 2 O ]
[ 2 E ][12 C ][ 3 B ]
[ 7 E ][11 O ][     ]

Ahora el espectador informa que la carta está en la columna 3.

Tras la siguiente iteración el tablero queda:

[ 1 E ][ 9 O ][10 B ]
[ 1 O ][ 3 E ][ 2 E ]
[ 7 E ][ 3 C ][ 8 B ]
[  J  ][ 5 C ][ 6 C ]
[12 C ][11 O ][ 1 C ]
[ 8 O ][ 2 C ][ 4 E ]
[ 2 O ][ 3 B ][     ]

Luego de que el espectador dice que la carta está en la columna 2 el mago adivina que la carta es el 2 de copas.

Una manera de ver este proceso es mediante intersección de conjuntos. Inicialmente el conjunto de cartas candidatas a ser la elegida consiste en todas las cartas. En cada pasada ese conjunto pasa a ser el resultado de su intersección con las cartas de la columna elegida. El proceso continúa hasta que el conjunto tenga solo un elemento. En el ejemplo inicialmente el conjunto de cartas en el que puede estar la elegida es todo el mazo. Tras la primera pasada ese conjunto pasa a ser  {J, 2C, 1O, 5C, 4E, 3E, 6C}. La intersección de este conjunto con la tercera columna de la segunda pasada es {2C, 4E}. Y finalmente la intersección de este último con la segunda columna de la tercera pasada es {2C}. 
Este último será el enfoque con que se realiza la tarea. Esta consiste en la implementación de una serie de subprogramas necesarios para el funcionamiento del programa principal.

## Constantes y Tipos de datos

Se definen las siguientes constantes para representar el tablero:

  COLS = ; {algún entero mayor que 1}
  FILAS = ; {algún entero mayor que 0}

  N =  COLS * FILAS;

Se definen a continuación los tipos de datos que se utilizan en la tarea.

### Carta
Una carta es un comodín o tiene dos campos, número y palo.

  TNumero = 1 .. N div 4;
  TPalo = (bastos, copas, espadas, oros);
  TCarta = record 
    case comodin: boolean of
      false : (numero: TNumero; palo: TPalo);
      true : ()
  end;

### Columna, Tablero y Mazo
El tablero es un arreglo con tope de columnas. A su vez, la columna es un arreglo con tope de cartas.

El mazo también es un arreglo con tope de cartas pero de una dimensión mayor.



  TColumna = record
    tope: 0 .. FILAS;
    cartas: array [1 .. FILAS] of TCarta
  end;  
  TTablero = record
    tope : 0 .. COLS;
    columnas : array [1 .. COLS] of TColumna  
  end;

  TMazo = record
    tope: 0 .. N;
    cartas: array [1..N] of TCarta
  end;

  TRangoCols = 1 .. COLS;

### Columna y Tablero en la versión listas
En una versión alternativa la columna se representa con una lista de nodos enlazados. Los nodos tienen un campo para una carta y otro campo para un puntero al siguiente nodo.

La representación del tablero se adapta. Sigue siendo un arreglo con tope pero de estas columnas implementadas con listas.

  TColumnaL = ^ncartas;
  ncartas = record
    carta : TCarta;
    sig : TColumnaL
  end;
  TTableroL = record
    tope : 0 .. COLS;
    columnas : array [1 .. COLS] of TColumnaL  
  end;

## Subprogramas
En esta sección se describen los subprogramas que el estudiante deberá implementar para dar solución a la tarea.




### SonCartasIguales

function sonCartasIguales (a, b : TCarta) : boolean;
El resultado es true si y solo si a y b son la misma carta.



### ArmarTablero

procedure armarTablero (mazo: TMazo; cantCols: TRangoCols; var t : TTablero);
Copia en las primeras cantCols columnas del tablero t las cartas de mazo.

Las cartas en t deben quedar de tal manera que, si se recorre t en orden creciente de filas y cada fila en orden creciente de columnas, se encuentran las mismas cartas y en el mismo orden que en una recorrida de mazo en orden creciente de sus posiciones.

Se puede asumir que la cantidad de cartas de mazo caben en esas columnas de t.


Por ejemplo, si las cartas de mazo son (4O, 1B, 5B, 3E, 9C) y cantCols es 3 entonces el tope de t va a ser 3 y sus columnas van a ser


[ 4 O ][ 1 B ][ 5 B ]
[ 3 E ][ 9 C ][     ]


### LevantarTablero

procedure levantarTablero (t : TTablero; var mazo : TMazo);
Copia las cartas del tablero t en mazo.

Las cartas en mazo deben quedar de tal manera que si se recorre t en orden creciente de columnas y cada columna en orden creciente de sus posiciones se encuentran las mismas cartas y en el mismo orden que en una recorrida de mazo en orden creciente de sus posiciones.

La copia se hace en orden creciente de columnas y cada columna en orden creciente de filas.
Por ejemplo, si el tope de t es 3 y sus columnas son

[ 4 O ][ 1 B ][ 5 B ]
[ 3 E ][ 9 C ][     ]
entonces las cartas de mazo van a ser (4O, 3E, 1B, 9C, 5B).




### EnQueColumna

function enQueColumna (carta : TCarta; t: Ttablero): TRangoCols;
Determina en qué columna del tablero t está carta.

Se puede asumir que carta está en el tablero t.

Se puede asumir que en t no hay cartas repetidas.

Por ejemplo, si el tope de t es 3 y sus columnas son

[ 4 O ][ 1 B ][ 5 B ]
[ 3 E ][ 9 C ][     ]
entonces
si carta es 3E el resultado debe ser 1.
si carta es 5B el resultado debe ser 3.

### EstanEnAmbos
procedure estanEnAmbos (columna : TColumna; var mazo : TMazo);
Deja en mazo solo las cartas que también están en columna.

Las cartas quedan en el mismo orden relativo en que estaban en mazo.

Por ejemplo:

Si las cartas de columna son (1B, 2C, 3E) y las de mazo son (4O, 1B, 5B, 3E, 9C) entonces en mazo quedan (1B, 3E).
Si las cartas de columna son (1B, 2C, 3E) y las de mazo son (4O, 3E, 1B, 9C, 5B) entonces en mazo quedan (3E, 1B).
Si las cartas de columna son (1B, 2C, 3E) y las de mazo son (4O, 3C, 5B, 1O, 9C) entonces mazo queda vacío.

### ConvertirTablero
procedure convertirTablero (t : TTablero; var tl : TTableroL);
Convierte el tablero t, implementado con arreglos con tope, en el tablero tl, que está implementado con listas.

A la columna i-ésima de t le corresponde la columna i-ésima de tl.

En la recorrida de una columna del tablero tl desde el inicio hasta el final se deben encontrar las mismas cartas en el mismo orden que en la recorrida de la columna correspondiente del tablero t desde la primera fila hasta la última.

Por ejemplo, si el tope de t es 3 y sus columnas son

[ 4 O ][ 1 B ][ 5 B ]
[ 3 E ][ 9 C ][     ]
entonces tl.tope es 3 y sus columnas son, desde la primera hasta la tercera y representando cada una de izquierda a derecha:
 [ 4 O ] → [ 3 E ]

 [ 1 B ] → [ 9 C ]

 [ 5 B ] 