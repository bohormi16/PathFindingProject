PROJET PATHFINDING ET AMR – CROSSDOCK

Nom : Abakar Adoum  
Formation : L3 Mathématiques – Informatique  
Université : Nantes Université  
Année : 2025–2026  

Encadrant : X. Gandibleux


INTRODUCTION

Ce projet a pour objectif d’étudier et d’implémenter des algorithmes de recherche de chemin dans un environnement  représenté sous forme de grille.

Dans une première partie, plusieurs algorithmes classiques de plus court chemin ont été implémentés, notamment BFS, Dijkstra, A* et un algorithme glouton, afin de comparer leurs performances.

Dans une seconde partie, ces méthodes ont été appliquées à un problème plus concret de planification de robots autonomes (AMR) dans un environnement de type crossdock. L’objectif est de déterminer un chemin pour chaque robot tout en évitant les collisions et en prenant en compte le temps.


PARTIE 1 – ALGORITHMES DE RECHERCHE DE CHEMIN

Plusieurs algorithmes de recherche de chemin ont été implémentés.

L’algorithme BFS explore la grille et garantit de trouver le chemin le plus court en nombre de déplacements lorsque les coûts sont uniformes.

L’algorithme de Dijkstra permet de trouver le plus court chemin en prenant en compte des coûts différents selon les cases.

L’algorithme A* améliore Dijkstra en introduisant une heuristique qui guide la recherche vers la destination.

Enfin, l’algorithme glouton sélectionne à chaque étape le voisin le plus proche de la cible, mais ne garantit pas toujours un chemin optimal.

Les cartes sont lues à partir de fichiers au format .map. Chaque case représente un type de terrain associé à un coût de déplacement.

Un chemin est calculé entre un point de départ D et un point d’arrivée A, puis reconstruit à l’aide d’une structure de parents.


RESULTATS EXPERIMENTAUX

Les algorithmes ont été testés sur la carte theglaive.map.


Résultats obtenus :

BFS
Distance : 281
Nombre d’états explorés : 127203

Dijkstra
Distance : 335
Nombre d’états explorés : 105448

Algorithme glouton
Distance : 709
Nombre d’états explorés : 282

A*
Distance : 335
Nombre d’états explorés : 12096


ANALYSE DES RESULTATS

L’algorithme BFS trouve le chemin le plus court en nombre de déplacements mais explore un très grand nombre d’états.

L’algorithme de Dijkstra trouve un chemin optimal en tenant compte des coûts, mais reste coûteux en exploration.

L’algorithme glouton est très rapide mais produit un chemin de mauvaise qualité.

L’algorithme A* offre le meilleur compromis en trouvant un chemin optimal tout en réduisant fortement le nombre d’états explorés.

Les différences de distance entre BFS et Dijkstra/A* s’expliquent par la prise en compte des coûts de déplacement.


PARTIE 2 – PLANIFICATION DE ROBOTS AMR

Dans cette partie, le problème consiste à planifier les déplacements de plusieurs robots autonomes dans un entrepôt de type crossdock.

Chaque robot est défini par :
- un point de départ
- un point d’arrivée
- un temps de départ

Les robots sont traités un par un.

Pour chaque robot, un chemin est calculé à l’aide de l’algorithme A*.

Le temps est simulé de sorte qu’un déplacement correspond à une unité de temps.

Une structure de données permet d’enregistrer les positions occupées en fonction du temps.


GESTION DES COLLISIONS

Deux types de collisions sont pris en compte.

La collision simple correspond au cas où deux robots occupent la même position au même instant.

La collision croisée correspond au cas où deux robots échangent leur position entre deux instants consécutifs.

Lorsqu’une collision est détectée, le chemin est rejeté et une replanification est effectuée en retardant le robot.


RESULTATS SIMULATION AMR

Une simulation avec deux robots a été réalisée sur une carte crossdock.

Résultats obtenus :

AMR 1
Distance : 8
États explorés : 9
Temps : 1 à 9

AMR 2
Collision détectée au temps 9
Replanification avec un nouveau temps de départ à 10
Distance : 8
États explorés : 9
Temps : 10 à 18

Temps total de simulation : 18


ANALYSE SIMULATION

La simulation montre que le système est capable de détecter et de gérer les collisions.

Lorsqu’un conflit est détecté, le robot est retardé et un nouveau chemin est calculé.

Cette approche permet d’éviter les conflits tout en garantissant que chaque robot atteint sa destination.


CONCLUSION

Ce projet a permis de mettre en œuvre plusieurs algorithmes de recherche de chemin et d’analyser leurs performances.

La seconde partie a permis d’appliquer ces concepts à un problème concret de planification multi-robots, en intégrant la gestion du temps et des collisions.

Une amélioration possible serait l’intégration d’algorithmes plus avancés comme le Safe Interval Path Planning (SIPP), permettant une meilleure gestion des conflits.