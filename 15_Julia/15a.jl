target = 2000000
impossible = Set()
for line in eachline("input.txt")
    data = match(r"Sensor at x=(?<sx>-?\d+), y=(?<sy>-?\d+): closest beacon is at x=(?<bx>-?\d+), y=(?<by>-?\d+)", line)
    sx = parse(Int, data[:sx])
    sy = parse(Int, data[:sy])
    bx = parse(Int, data[:bx])
    by = parse(Int, data[:by])
    l = abs(bx - sx) + abs(by - sy)
    l -= abs(target - sy)
    if l >= 0
        union!(impossible, sx-l:sx+l)
        if by == target
            setdiff!(impossible, bx)
        end
    end
end
println(length(impossible))
