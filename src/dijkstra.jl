function algoDijkstra(fname::String, D::Tuple{Int,Int}, A::Tuple{Int,Int})
    grille = read_map(fname)

    if grille[D...] == '@' || grille[D...] == 'T'
        error("Le point de départ est un obstacle.")
    end

    if grille[A...] == '@' || grille[A...] == 'T'
        error("Le point d'arrivée est un obstacle.")
    end

    # Initialisation
    distance = Dict{Tuple{Int,Int}, Float64}()
    precedent = Dict{Tuple{Int,Int}, Tuple{Int,Int}}()
    permanent = Set{Tuple{Int,Int}}()

    # Initialiser toutes les distances à +∞
    for i in 1:size(grille,1)
        for j in 1:size(grille,2)
            if grille[i,j] != '@' && grille[i,j] != 'T'
                distance[(i,j)] = Inf
            end
        end
    end

    distance[D] = 0

    nb_etats = 0

    while true

        # Trouver sommet non permanent de distance minimale
        u = nothing
        min_dist = Inf

        for (sommet, dist) in distance
            if !(sommet in permanent) && dist < min_dist
                min_dist = dist
                u = sommet
            end
        end

        if u === nothing
            break
        end

        if u == A
            break
        end

        push!(permanent, u)
        nb_etats += 1

        # Relaxation des voisins
        for voisin in voisins_accessibles(grille, u)

            if !(voisin in permanent)

                cout = cout_deplacement(grille[voisin...])
                nvl_distance = distance[u] + cout

                if nvl_distance < distance[voisin]
                    distance[voisin] = nvl_distance
                    precedent[voisin] = u
                end
            end
        end
    end

    if !(A in keys(precedent)) && A != D
        println("Aucun chemin trouvé.")
        return nothing
    end

    # Reconstruction du chemin
    chemin = Tuple{Int,Int}[]
    courant = A

    while courant != D
        push!(chemin, courant)
        courant = precedent[courant]
    end

    push!(chemin, D)
    reverse!(chemin)
    println("Dijkstra algo ")
    println("Distance D → A : ", distance[A])
    println("Number of states evaluated : ", nb_etats)
    println("Path D → A : ", chemin)
    return distance[A], nb_etats, chemin
end