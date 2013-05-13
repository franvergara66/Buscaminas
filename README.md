Buscaminas
==========

Juego de Buscaminas en Haskell

El juego buscaminas consiste en despejar un campo de minas sin detonar ninguna mina. Esto se
logra en base a la información que se encuentra dentro del propio campo.
Existen 3 tipos de casillas en el buscaminas:
· Casillas Mina.
· Casillas Adyacentes: casillas adyacentes a una mina
· Casillas Vacías: casillas no adyacentes a una mina.
La adyacencia en este juego viene dado por las casillas que se encuentran a los lados, arriba,
abajo y diagonal a la casilla (8 vecinos).

El campo tiene un tamaño F*C, donde F es el alto (filas) y C el ancho (columnas).
A una casilla se accede mediante sus coordenadas (i,j) ϵ (Int,Int) tal que (1,1) es la casilla
superior izquierda y (F,C) la casilla inferior derecha.
Se desea que usted; dado F, C y una Lista de Coordenadas de las casillas donde se encuentran
las minas, programe una función buscaminas en Haskell que calcule una matriz con la
información pertinente a cada tipo de casillas.
Entrada:
Condiciones que se deben cumplir para los parámetros:
 F*C >= tamaño de la Lista de Coordenadas > 0.
 Las coordenadas (i,j) deben estar entre (1,1) y (F,C).
 En la Lista de Coordenadas no habrán coordenadas repetidas.
Salida:
 La salida será una lista de listas, donde cada sublista es una fila.
 Las Casillas Adyacentes serán números enteros que indicarán la cantidad de minas que
tienen adyacentes.
 Las Casillas Mina tendrán el valor -1.
 Las Casillas Vacías tendrán el valor 0.

***************************************************************************************************
Ejemplos:
Entrada: buscaminas 4 4 [(2,3),(3,1),(2,4)]
Salida: [[0,1,-1,1],[1,2,2,1],[2,-1,2,0],[2,-1,2,0]]
Entrada: buscaminas 2 3 [(1,2),(1,1)]
Salida: [[-1,2,0],[-1,2,0]]
Entrada: buscaminas 10 10 [(2,5),(5,5),(1,2),(5,6),(8,7),(2,2),(10,3),
(3,4),(1,1),(9,1)]
Salida: [[-1,3,1,0,0,0,0,1,-1,1],[-1,-1,1,0,0,0,0,1,2,2],
[2,3,2,1,0,0,0,0,1,-1],[1,2,-1,2,1,1,0,0,1,1],[1,-1,2,3,-1,2,0,0,0,0],
[1,1,1,2,-1,2,1,1,1,0],[0,0,0,1,1,1,1,-1,1,0],[0,0,0,0,0,0,1,1,1,0],
[0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0]]
