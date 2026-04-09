function algoGlouton(fname::String, D::Tuple{Int,Int}, A::Tuple{Int,Int})

    grille = read_map(fname)

    if grille[D...] == '@'
        error("Départ obstacle")
    end

    if grille[A...] == '@' 
        error("Arrivée obstacle")
    end

    ouvert = [D]
    ferme = Set{Tuple{Int,Int}}()
    parent = Dict{Tuple{Int,Int}, Tuple{Int,Int}}()

    nb_etats = 0

    while !isempty(ouvert)

        h_values = [heuristique(n, A) for n in ouvert]
        idx = argmin(h_values)
        courant = ouvert[idx]
        deleteat!(ouvert, idx)

        push!(ferme, courant)
        nb_etats += 1

        if courant == A
            break
        end

        for voisin in voisins_accessibles(grille, courant)

            if !(voisin in ferme) && !(voisin in ouvert)
                push!(ouvert, voisin)
                parent[voisin] = courant
            end
        end
    end

    if !(A in keys(parent)) && A != D
        println("Aucun chemin trouvé")
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

    # correction distance
    distance = 0
    for i in 2:length(chemin)
        distance += cout_deplacement(grille[chemin[i]...])
    end

    println("Glouton algo")
    println("Distance D → A : ", distance)
    println("Number of states evaluated : ", nb_etats)
    #println("Path D → A : ", chemin)
    return distance, nb_etats, chemin
end