# STRUCTURE AMR
struct AMR
    id::Int
    depart::Tuple{Int,Int}
    arrivee::Tuple{Int,Int}
    t_start::Int
end

# SIMULATION AVEC REPLANIFICATION
function simulation(amrs, fname)

    println("\nSIMULATION AMR")

    occupation = Dict{Tuple{Tuple{Int,Int},Int}, Int}()

    temps_global = 0

    for robot in amrs

        println("\nAMR ", robot.id)

        t = max(temps_global, robot.t_start)
        chemin_valide = Tuple{Int,Int}[]
        nb_etats=0
        distance=0
        while true

            distance, nb_etats, chemin = algoAstar(fname, robot.depart, robot.arrivee)

            conflit = false
            chemin_valide = Tuple{Int,Int}[]

            for (i, pos) in enumerate(chemin)

                temps = t + i - 1

                # collision simple
                if haskey(occupation, (pos, temps))
                    conflit = true
                    println("Collision simple AMR ", robot.id, " au temps ", temps)
                    break
                end

                # collision croisee
                if i > 1
                    prev = chemin[i-1]

                    if haskey(occupation, (prev, temps)) &&
                       haskey(occupation, (pos, temps-1))

                        conflit = true
                        println("Collision croisee AMR ", robot.id, " au temps ", temps)
                        break
                    end
                end

                push!(chemin_valide, pos)
            end

            if !conflit
                break
            end

            println("Replanification AMR ", robot.id, " nouveau temps ", t+1)
            t += 1
        end

        for (i, pos) in enumerate(chemin_valide)
            temps = t + i - 1
            occupation[(pos, temps)] = robot.id
        end

        t_fin = t + length(chemin_valide) - 1

        println("Distance ", length(chemin_valide)-1)
        println("Etats explores ", nb_etats)
        println("Temps ", t, " vers ", t_fin)

        temps_global = t_fin
    end

    println("\nFin simulation temps ", temps_global)
end