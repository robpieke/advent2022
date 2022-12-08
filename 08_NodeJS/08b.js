var fs = require('fs');

const data = fs.readFileSync('input.txt', 'utf8').split('\n');
const rows = data.length;
const cols = data[0].length;

var grid = Array(rows * cols).fill(1);

// L->R
for (r = 0; r < rows; ++r) {
    var last = Array(10).fill(0);
    for (c = 0; c < cols; ++c) {
        const v = parseInt(data[r][c]);
        grid[r * cols + c] *= (c - last[v]);
        for (vv = 0; vv <= v; ++vv)
            last[vv] = c;
    }
}

// R->L
for (r = 0; r < rows; ++r) {
    var last = Array(10).fill(cols-1);
    for (c = cols-1; c >= 0; --c) {
        const v = parseInt(data[r][c]);
        grid[r * cols + c] *= -(c - last[v]);
        for (vv = 0; vv <= v; ++vv)
            last[vv] = c;
    }
}

// T->B
for (c = 0; c < cols; ++c) {
    var last = Array(10).fill(0);
    for (r = 0; r < rows; ++r) {
        const v = parseInt(data[r][c]);
        grid[r * cols + c] *= (r - last[v]);
        for (vv = 0; vv <= v; ++vv)
            last[vv] = r;
    }
}

// B->T
for (c = 0; c < cols; ++c) {
    var last = Array(10).fill(rows-1);
    for (r = rows-1; r >= 0; --r) {
        const v = parseInt(data[r][c]);
        grid[r * cols + c] *= -(r - last[v]);
        for (vv = 0; vv <= v; ++vv)
            last[vv] = r;
    }
}

const mx = grid.reduce(function(mx,c) { return Math.max(mx,c); } );
console.log(mx);
