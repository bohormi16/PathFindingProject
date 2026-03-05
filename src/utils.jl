function heuristique(n::Tuple{Int,Int}, A::Tuple{Int,Int})
    return abs(n[1] - A[1]) + abs(n[2] - A[2])
end