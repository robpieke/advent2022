with open('input.txt', 'r') as f:
    data = [line.strip() for line in f.readlines()]

mx = 0
cur = 0
for line in data:
    if not line:
        cur = 0
    else:
        cur += int(line)
        if cur > mx:
            mx = cur

print(mx)
