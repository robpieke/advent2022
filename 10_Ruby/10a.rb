x = 1
n = 0
total = 0

def step(n, x, total)
    n += 1
    if n % 40 == 20 then
        total += x * n
    end
    return n, total
end

File.foreach("input.txt") do |line|
    if line[0] == "n" then
        n, total = step(n, x, total)
    else
        dx = line[5..-1].to_i
        n, total = step(n, x, total)
        n, total = step(n, x, total)
        x += dx
    end
end

puts "#{total}"