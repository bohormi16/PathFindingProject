function algoAstar(fname::String, D::Tuple{Int,Int}, A::Tuple{Int,Int})
    grille = read_map(fname)

    if grille[D...] == '@'
      error("Le point de départ est un obstacle.")
    end

    if grille[A...] == '@'
      error("Le point d'arrivée est un obstacle.")
    end

    ouvert = [D]
    ferme = Set{Tuple{Int,Int}}()

    g = Dict{Tuple{Int,Int}, Float64}()
    f = Dict{Tuple{Int,Int}, Float64}()
    parent = Dict{Tuple{Int,Int}, Tuple{Int,Int}}()

    g[D] = 0
    f[D] = heuristique(D, A)

    nb_etats = 0
    trouve = false

    while !isempty(ouvert)

        # choisir sommet avec f minimal
        courant = ouvert[argmin([f[n] for n in ouvert])]
        deleteat!(ouvert, findfirst(==(courant), ouvert))

        push!(ferme, courant)
        nb_etats += 1

        if courant == A
            trouve = true
            break
        end

        for voisin in voisins_accessibles(grille, courant)

            if voisin in ferme
                continue
            end

            cout = cout_deplacement(grille[voisin...])
            tentative_g = g[courant] + cout

            if !(voisin in ouvert) || tentative_g < g[voisin]

                parent[voisin] = courant
                g[voisin] = tentative_g
                f[voisin] = tentative_g + heuristique(voisin, A)

                if !(voisin in ouvert)
                    push!(ouvert, voisin)
                end
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
    #println("astra ALGO")
    #println("Distance D → A : ", g[A])
    #println("Number of states evaluated : ", nb_etats)
    #println("Path D → A : ", chemin)
    return g[A], nb_etats, chemin
end