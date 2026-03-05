function algoGlouton(fname::String, D::Tuple{Int,Int}, A::Tuple{Int,Int})
    grille = read_map(fname)

    if grille[D...] == '@' || grille[D...] == 'T'
        error("Le point de départ est un obstacle.")
    end

    if grille[A...] == '@' || grille[A...] == 'T'
        error("Le point d'arrivée est un obstacle.")
    end

    ouvert = [D]                      # liste ouverte
    ferme = Set{Tuple{Int,Int}}()     # sommets visités
    parent = Dict{Tuple{Int,Int}, Tuple{Int,Int}}()

    nb_etats = 0
    trouve = false

    while !isempty(ouvert)

        # choisie le sommet avec heuristique minimale
        courant = ouvert[argmin([heuristique(n, A) for n in ouvert])]
        deleteat!(ouvert, findfirst(==(courant), ouvert))

        push!(ferme, courant)
        nb_etats += 1

        if courant == A
            trouve = true
            break
        end

        for voisin in voisins_accessibles(grille, courant)

            if !(voisin in ferme) && !(voisin in ouvert)
                push!(ouvert, voisin)
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
    println("Gluton algo ")
    println("Distance D → A : ", distance)
    println("Number of states evaluated : ", nb_etats)
    println("Path D → A : ", chemin) 
    return distance, nb_etats, chemin
end