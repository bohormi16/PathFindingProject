include("map_reader.jl")
include("utils.jl")      #contient heuristique
include("bfs.jl")
include("dijkstra.jl")
include("gluton.jl")
include("astar.jl")
include("amr.jl")
# Départ et arrivée
D = (189, 193)
A = (226, 437)
amrs = [
    AMR(1, (2,2), (2,10), 1),
    AMR(2, (2,10), (2,2), 1)
]
algoBFS("dat/theglaive.map", D, A)
algoDijkstra("dat/theglaive.map", D, A)
algoGlouton("dat/theglaive.map", D, A)
algoAstar("dat/theglaive.map", D, A)
simulation(amrs, "dat/crossdock.map")