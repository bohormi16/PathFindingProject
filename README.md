# PROJET PATHFINDING ET AMR – CROSSDOCK

### DESCRIPTION

Ce projet implémente et compare plusieurs algorithmes de recherche de chemin sur des cartes au format .map.

Objectifs :
- Implémenter des algorithmes de plus court chemin
- Simuler des robots AMR dans un environnement de type crossdock
- Gérer les collisions et le temps


## PARTIE 1 – PATHFINDING

### Les algorithmes implémentés sont :
- BFS (Breadth First Search)
- Dijkstra
- A*
- Algorithme glouton

Le programme calcule un chemin entre un point de départ D et un point d’arrivée A.


### FONCTIONNALITÉS

- Lecture de carte .map
- Calcul du plus court chemin
- Reconstruction du chemin
- Affichage :
  - Distance
  - Nombre d’états explorés
  - Chemin


### STRUCTURE DU PROJET

src/   code source des algorithmes  
dat/   cartes utilisées pour les tests  
doc/   rapport du projet  
README.md  

### Principaux fichiers :
- src/main.jl
- src/bfs.jl
- src/dijkstra.jl
- src/gluton.jl
- src/astar.jl
- src/map_reader.jl
- src/amr.jl


## PARTIE 2 – SIMULATION AMR

Objectif :

Simuler plusieurs robots (AMR) dans un entrepôt de type crossdock.

Chaque robot possède :
- un point de départ
- un point d’arrivée
- un temps de départ


### PRINCIPE

- Les robots sont traités un par un
- Chaque robot utilise A* pour calculer son chemin
- Le temps est simulé avec :
  1 déplacement = 1 unité de temps


### GESTION DES COLLISIONS

Deux types de collisions sont pris en compte :

Collision simple :
Deux robots ne peuvent pas être sur la même case au même instant

Collision croisée :
Deux robots ne peuvent pas échanger leur position entre t et t+1


REPLANIFICATION

En cas de collision :
- Le chemin est rejeté
- Le robot est retardé
- A* est relancé


## INSTALLATION

Le projet nécessite Julia 1.11 ou supérieur.

Vérifier la version :
julia --version


## EXÉCUTION

Depuis le dossier du projet :
julia src/main.jl

Le programme exécute les algorithmes et affiche les résultats dans le terminal.


## CARTES UTILISÉES

Les tests ont été réalisés sur :
- theglaive.map
- crossdock.map


## RÉSULTATS

- BFS et Dijkstra trouvent le chemin optimal mais explorent beaucoup d’états
- L’algorithme glouton est rapide mais non optimal
- A* offre un bon compromis entre performance et optimalité


## AUTEUR

Abakar Adoum  

## Encadrant : X. Gandibleux

## L3 Mathématiques – Informatique  
## Nantes Université
