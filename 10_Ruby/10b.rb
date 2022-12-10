x = 1
n = 0

def step(n, x)
    if ((n % 40)-x).abs <= 1 then
        print "88"
    else
        print "  "
    end
    n += 1
    if n % 40 == 0 then
        print "\n"
    end
    return n
end

File.foreach("input.txt") do |line|
    if line[0] == "n" then
        n = step(n, x)
    else
        dx = line[5..-1].to_i
        n = step(n, x)
        n = step(n, x)
        x += dx
    end
end
