struct Row
	sx::Int
	sy::Int
	bx::Int
	by::Int
end

function solve(rows)
	for y in 0:4000000
		minmax = Vector{Tuple{Int, Int}}()
		for i in 1:length(rows)
			row = rows[i]
			l = abs(row.bx - row.sx) + abs(row.by - row.sy)
			l -= abs(y - row.sy)
			if l > 0
				push!(minmax, (max(row.sx - l, 0), min(row.sx + l, 4000000)))
			end
		end
		sort!(minmax, by = x -> x[1])
		mx = minmax[1][2]
		for i in 2:length(minmax)
			if minmax[i][1] > mx
				println(y + 4000000 * (minmax[i][1] - 1))
			end
			mx = max(mx, minmax[i][2])
		end
	end
end

rows = Vector{Row}()

for line in eachline("input.txt")
	data = match(r"Sensor at x=(?<sx>-?\d+), y=(?<sy>-?\d+): closest beacon is at x=(?<bx>-?\d+), y=(?<by>-?\d+)", line)
	push!(rows, Row(
		parse(Int, data[:sx]),
		parse(Int, data[:sy]),
		parse(Int, data[:bx]),
		parse(Int, data[:by])))
end

solve(rows)
