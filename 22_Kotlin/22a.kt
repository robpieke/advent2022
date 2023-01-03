import java.io.File

fun main() {
    val data = File("input.txt").readLines()

    val rowRanges = ArrayList<Pair<Int, Int>>()
    var w = 0
    for (row in data.dropLast(2)) {
        for (i in row.indices) {
            if (!row[i].isWhitespace()) {
                rowRanges.add(Pair(i, row.length - 1))
                break
            }
            w = Math.max(w, row.length)
        }
    }

    val colRanges = ArrayList<Pair<Int, Int>>()
    for (x in 0 until w) {
        var min = 0
        for (y in 0 until rowRanges.size) {
            if (x >= rowRanges[y].first && x <= rowRanges[y].second) {
                min = y
                break
            }
        }
        var max = 0
        for (y in rowRanges.size - 1 downTo 0) {
            if (x >= rowRanges[y].first && x <= rowRanges[y].second) {
                max = y
                break
            }
        }
        colRanges.add(Pair(min, max))
    }

    val dx = listOf(1, 0, -1, 0)
    val dy = listOf(0, 1, 0, -1)

    var x = rowRanges[0].first
    var y = 0
    var dir = 0

    val steps = data.last()
    var len = 0
    for (i in steps.indices) {
        val c = steps[i]
        if (c.isDigit()) {
            len = len * 10 + c.digitToInt()
        }
        if (!c.isDigit() || i == steps.length-1)
        {
            for (j in 1..len) {
                if (dx[dir] != 0) {
                    var nx = x + dx[dir]
                    if (nx < rowRanges[y].first) {
                        nx = rowRanges[y].second
                    }
                    else if (nx > rowRanges[y].second) {
                        nx = rowRanges[y].first
                    }
                    if (data[y][nx] == '#') {
                        break
                    }
                    x = nx
                }
                else {
                    var ny = y + dy[dir]
                    if (ny < colRanges[x].first) {
                        ny = colRanges[x].second
                    }
                    else if (ny > colRanges[x].second) {
                        ny = colRanges[x].first
                    }
                    if (data[ny][x] == '#') {
                        break
                    }
                    y = ny
                }
            }
            len = 0
        }
        if (c == 'R') {
            dir = (dir + 1) % 4
        }
        if (c == 'L') {
            dir = (dir + 3) % 4
        }
    }
    println(((y + 1) * 1000) + ((x + 1) * 4) + dir)
}
