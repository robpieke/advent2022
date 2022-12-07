let
    file = open("input.txt", fmRead)
    data = file.readLine()

for idx in 3..<len(data):
    var pair = false
    for i in idx-3..idx:
        for j in idx-3..<i:
            if data[i] == data[j]:
                pair = true
    if not pair:
        echo idx+1
        break

file.close()
