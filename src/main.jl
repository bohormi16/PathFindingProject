cd(@__DIR__)

include("map_reader.jl")

grid = read_map("../dat/didactic.map")

println("Taille de la grille : ", size(grid))
println("Case (1,1) : ", grid[1,1])
println("Voisins de (5,5) : ", neighbors(grid, (5,5)))