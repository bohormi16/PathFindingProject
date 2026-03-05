Pathfinding Project – BFS, Dijkstra, Greedy, A*

Description

Ce projet implémente et compare quatre algorithmes de recherche de chemin sur des cartes au format .map :
•    BFS (Breadth First Search)
•    Dijkstra
•    Greedy Best-First Search (Glouton)
•    A*

Le programme calcule le chemin entre un point de départ D et un point d’arrivée A et affiche :
Structure du projet
•    la distance
•    le nombre d’états explorés
•    le chemin trouvé
•    le temps d’exécution
•    src/   # code source des algorithmes
•    dat/   # cartes utilisées pour les tests
•    doc/   # rapport du projet
•    README.md # instructions du projet

Principaux fichiers :
 src/main.jl
 src/bfs.jl
 src/dijkstra.jl
 src/gluton.jl
 src/astar.jl
 src/map_reader.jl

Installation

 Le projet nécessite Julia 1.11 ou supérieur.
 Vérifier la version :
 julia –version

Exécution
 Depuis le dossier du projet :
 julia src/main.jl
 Le programme exécute les différents algorithmes et affiche les résultats dans le terminal.

Cartes utilisées

 Les expérimentations ont été réalisées sur trois cartes :
  •    8room_000.map
  •    Paris_2_256.map
  •    32room_000.map

Ces cartes permettent de tester les algorithmes sur différents niveaux de complexité.

Résultats

Les résultats montrent que :
•    BFS et Dijkstra trouvent toujours le chemin optimal mais explorent beaucoup d’états.
•    Greedy est très rapide mais ne garantit pas toujours un chemin optimal.
•    A* est le meilleur compromis : il trouve le chemin optimal tout en explorant moins d’états.


Auteur
Abakar Adoum

L3-licence math -informatique / Nantes université