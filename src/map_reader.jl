function read_map(fname::String)
    lines = readlines(fname)

    # Trouver la ligne "map"
    idx = findfirst(x -> occursin("map", x), lines)
    grid_lines = lines[idx+1:end]

    height = length(grid_lines)
    width = length(grid_lines[1])

    grid = Matrix{Char}(undef, height, width)

    for i in 1:height
        for j in 1:width
            grid[i,j] = grid_lines[i][j]
        end
    end

    return grid
end


function move_cost(cell::Char)
    if cell == 'S'
        return 5
    elseif cell == 'W'
        return 8
    else
        return 1
    end
end


function neighbors(grid, pos)
    i, j = pos
    h, w = size(grid)

    neigh = Tuple{Int,Int}[]

    for (di,dj) in [(1,0),(-1,0),(0,1),(0,-1)]
        ni, nj = i+di, j+dj
        if 1 ≤ ni ≤ h && 1 ≤ nj ≤ w
            if grid[ni,nj] != '@'
                push!(neigh, (ni,nj))
            end
        end
    end

    return neigh
end