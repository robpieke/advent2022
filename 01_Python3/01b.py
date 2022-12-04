with open('01.txt', 'r') as f:
    data = [line.strip() for line in f.readlines()]

def updateMax(mx, val):
    mx.append(val)
    mx = sorted(mx, reverse=True)[:-1]
    return mx

mx = [0,0,0]

cur = 0
for line in data:
    if not line:
        mx = updateMax(mx, cur)
        cur = 0
    else:
        cur += int(line)
mx = updateMax(mx, cur)

print(sum(mx))
