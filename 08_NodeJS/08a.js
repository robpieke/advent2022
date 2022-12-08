var fs = require('fs');

const data = fs.readFileSync('input.txt', 'utf8').split('\n');
const rows = data.length;
const cols = data[0].length;

var grid = Array(rows * cols);

// L->R
for (r = 0; r < rows; ++r) {
    var mx = -1;
    for (c = 0; c < cols; ++c) {
        const v = parseInt(data[r][c]);
        if (v > mx) {
            mx = v;
            grid[r * cols + c] = 1;
        }
    }
}

// R->L
for (r = 0; r < rows; ++r) {
    var mx = -1;
    for (c = cols-1; c >= 0; --c) {
        const v = parseInt(data[r][c]);
        if (v > mx) {
            mx = v;
            grid[r * cols + c] = 1;
        }
    }
}

// T->B
for (c = 0; c < cols; ++c) {
    var mx = -1;
    for (r = 0; r < rows; ++r) {
        const v = parseInt(data[r][c]);
        if (v > mx) {
            mx = v;
            grid[r * cols + c] = 1;
        }
    }
}

// B->T
for (c = 0; c < cols; ++c) {
    var mx = -1;
    for (r = rows-1; r >= 0; --r) {
        const v = parseInt(data[r][c]);
        if (v > mx) {
            mx = v;
            grid[r * cols + c] = 1;
        }
    }
}

const sum = grid.reduce((partialSum, a) => partialSum + a, 0);

console.log(sum);
