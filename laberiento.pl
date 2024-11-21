% conexiones válidas en el laberinto
conexion(1, 7).
conexion(7, 13).
conexion(13, 14).
conexion(14, 20).
conexion(20, 26).
conexion(26, 27).
conexion(27,28).
conexion(28,34).
conexion(34,33).
conexion(33,32).
conexion(2,8).
conexion(2,3).
conexion(8, 9).
conexion (9,3).
conexion(3, 4).
conexion(4, 10).
conexion(16, 10).
conexion(16, 22).
conexion(22, 21).
conexion(21, 15).
conexion(15, 14).
conexion(28, 29).
conexion(29, 23).
conexion(23, 17).
conexion(17, 11).
conexion(11, 5).
conexion(5, 6).
conexion(32,31).
conexion(31,25).
conexion(34, 35).
conexion(35, 36).
conexion(36, 30).
conexion(30, 24).
conexion(24, 18).
conexion(18, 12).

% Aseguramos que las conexiones son bidireccionales
camino(X, Y) :- conexion(X, Y).
camino(X, Y) :- conexion(Y, X).

% Verificar si existe un camino y mostrarlo
solucion(Inicio, Fin, Camino) :- 
    busqueda_camino(Inicio, Fin, [Inicio], Camino). % El tercer elemento es una lista de nodos visitados 

% Busqueda y construccion del camino 
busqueda_camino(Fin, Fin, Camino, Camino). 
busqueda_camino(Actual, Fin, Visitados, Camino) :-
    camino(Actual, Siguiente),
    \+ member(Siguiente, Visitados), % si el nodo siguiente hace parte de la lista de nodos visitados 
    busqueda_camino(Siguiente, Fin, [Siguiente|Visitados], Camino). % recursividad con el nodo siguiente agregado en la lista de nodos visitados 
