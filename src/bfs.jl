function algoBFS(fname::String, D::Tuple{Int,Int}, A::Tuple{Int,Int})
    grille = read_map(fname)
    
    if grille[D...] == '@' || grille[D...] == 'T'
        error("Le point de départ est un obstacle.")
    end

    if grille[A...] == '@' || grille[A...] == 'T'
      error("Le point d'arrivée est un obstacle.")
    end
    # File FIFO avec Vector
    file = [D]

    visites = Set{Tuple{Int,Int}}()
    push!(visites, D)

    parent = Dict{Tuple{Int,Int}, Tuple{Int,Int}}()

    nb_etats = 0
    trouve = false

    while !isempty(file)

        courant = popfirst!(file)
        nb_etats += 1

        if courant == A
            trouve = true
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

    if !trouve
        println("Aucun chemin trouvé.")
        return nothing
    end

    # Reconstruction du chemin
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
    println("Path D → A : ", chemin)
    return distance, nb_etats, chemin
end