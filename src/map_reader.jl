function read_map(nom_fichier::String)

    lignes = readlines(nom_fichier)

    index_deb = findfirst(ligne -> strip(ligne) == "map", lignes)
    if index_deb === nothing
        error("Mot 'map' introuvable dans le fichier.")
    end
    l_grille = lignes[index_deb+1:end]
    
    println("Carte étudiée : ", nom_fichier)
    
    hauteur = length(l_grille)
    largeur = length(l_grille[1])

    grille = Matrix{Char}(undef, hauteur, largeur)

    for i in 1:hauteur
        for j in 1:largeur
            grille[i,j] = l_grille[i][j]
        end
    end

    return grille
end


function cout_deplacement(cellule::Char)

    if cellule== 'S'
        return 5
    elseif cellule== 'W'
        return 8
    else
        return 1
    end
end


function voisins_accessibles(grille, pos)

    ligne, colonne = pos

    hauteur, largeur = size(grille)

    l_voisins = Tuple{Int,Int}[]

    for (decalage_ligne, decalage_colonne) in [(1,0), (-1,0), (0,1), (0,-1)]

        nvl_ligne  = ligne + decalage_ligne
        nvl_colonne = colonne + decalage_colonne

        if 1 ≤ nvl_ligne ≤ hauteur && 1 ≤ nvl_colonne ≤ largeur

          cellule = grille[nvl_ligne, nvl_colonne]

          if cellule != '@' && cellule != 'T'
                 push!(l_voisins, (nvl_ligne, nvl_colonne))
          end
        end
    end
    
    return l_voisins
end