# LECTURE DE LA CARTE

function read_map(nom_fichier::String)

    lignes = readlines(nom_fichier)

    # Trouver la ligne "map"
    index_deb = findfirst(ligne -> strip(ligne) == "map", lignes)
    if index_deb === nothing
        error("Mot 'map' introuvable dans le fichier.")
    end

    # Récupérer la grille
    l_grille = lignes[index_deb+1:end]
    hauteur = length(l_grille)
    largeur = length(strip(l_grille[1]))

    # Création matrice
    grille = Matrix{Char}(undef, hauteur, largeur)

    for i in 1:hauteur
        ligne = strip(l_grille[i])
        for j in 1:largeur
            grille[i, j] = ligne[j]
        end
    end

    return grille
end

# COÛT DE DÉPLACEMENT
function cout_deplacement(cellule::Char)

    if cellule == 'S'
        return 5
    elseif cellule == 'W'
        return 8
    else
        return 1
    end
end

# VOISINS ACCESSIBLES (4 directions possible)
function voisins_accessibles(grille, pos)

    ligne, colonne = pos
    hauteur, largeur = size(grille)

    l_voisins = Tuple{Int,Int}[]

    for (dl, dc) in [(1,0), (-1,0), (0,1), (0,-1)]

        nl = ligne + dl
        nc = colonne + dc

        if 1 ≤ nl ≤ hauteur && 1 ≤ nc ≤ largeur

            cellule = grille[nl, nc]

            # l'obstacle à devier
            if cellule != '@'
                push!(l_voisins, (nl, nc))
            end
        end
    end

    return l_voisins
end