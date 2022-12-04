local points = { 
    AX = 4, -- R R = 1+3
    AY = 8, -- R P = 2+6
    AZ = 3, -- R S = 3+0
    BX = 1, -- P R = 1+0
    BY = 5, -- P P = 2+3
    BZ = 9, -- P S = 3+6
    CX = 7, -- S R = 1+6
    CY = 2, -- S P = 2+0
    CZ = 6  -- S S = 3+3
}

local score = 0

for line in io.lines("input.txt") do
    line = line:gsub(" ", "")
    score = score + points[line]
end

print(score)
