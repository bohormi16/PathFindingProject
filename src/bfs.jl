function algoBFS(fname::String, D::Tuple{Int,Int}, A::Tuple{Int,Int})

    grille = read_map(fname)

    if grille[D...] == '@'
        error("Le point de départ est un obstacle.")
    end

    if grille[A...] == '@'
        error("Le point d'arrivée est un obstacle.")
    end

    file = [D]
    visites = Set{Tuple{Int,Int}}([D])
    parent = Dict{Tuple{Int,Int}, Tuple{Int,Int}}()

    nb_etats = 0

    while !isempty(file)

        courant = popfirst!(file)
        nb_etats += 1

        if courant == A
            break
        end

        for voisin in voisins_accessibles(grille, courant)

            if !(voisin in visites)
                push!(file, voisin)
                push!(visites, voisin)
                parent[voisin] = courant
            end
        end
    end

    if !(A in visites)
        println("Aucun chemin trouvé.")
        return nothing
    end

    chemin = Tuple{Int,Int}[]
    courant = A

    while courant != D
        push!(chemin, courant)
        courant = parent[courant]
    end

    push!(chemin, D)
    reverse!(chemin)

    distance = length(chemin) - 1

    println("BFS ALGO")
    println("Distance D → A : ", distance)
    println("Number of states evaluated : ", nb_etats)
    #println("Path D → A : ", chemin)

    return distance, nb_etats, chemin
end