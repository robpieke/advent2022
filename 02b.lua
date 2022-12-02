local points = { 
    AX = 3, -- R S = 3+0
    AY = 4, -- R R = 1+3
    AZ = 8, -- R P = 2+6
    BX = 1, -- P R = 1+0
    BY = 5, -- P P = 2+3
    BZ = 9, -- P S = 3+6
    CX = 2, -- S P = 2+0
    CY = 6, -- S S = 3+3
    CZ = 7  -- S R = 1+6
}

local score = 0

for line in io.lines("02.txt") do
    line = line:gsub(" ", "")
    score = score + points[line]
end

print(score)
