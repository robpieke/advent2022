use std::collections::VecDeque;
use std::fs;

fn main() {
    let mut row_blizzards: Vec<Vec<(i32, i32)>> = Vec::new();
    let mut col_blizzards: Vec<Vec<(i32, i32)>> = Vec::new();
    let contents = fs::read_to_string("input.txt").expect("Couldn't read input.txt");
    for (r, row) in contents.split("\n").enumerate() {
        row_blizzards.push(Vec::new());
        for (c, symbol) in row.chars().enumerate() {
            if r == 0 {
                col_blizzards.push(Vec::new());
            }
            match symbol {
                '>' => row_blizzards[r].push((c as i32, 1)),
                '<' => row_blizzards[r].push((c as i32, -1)),
                '^' => col_blizzards[c].push((r as i32, -1)),
                'v' => col_blizzards[c].push((r as i32, 1)),
                _ => (),
            }
        }
    }

    let w = col_blizzards.len() as i32;
    let h = row_blizzards.len() as i32;

    let exs = vec![w - 2, 1, w - 2];
    let eys = vec![h - 1, 0, h - 1];

    let mut queue: VecDeque<(i32, i32, i32)> = VecDeque::new();
    queue.push_back((1, 0, 0));

    // left, right, up, down, stay
    let dx = [-1, 1, 0, 0, 0];
    let dy = [0, 0, -1, 1, 0];

    let mut seen = vec![false; (w * h) as usize];
    let mut max_t = 0;

    for goal in 0..3 {
        let ex = exs[goal];
        let ey = eys[goal];
        loop {
            let (x, y, t) = queue.pop_front().expect("Queue is empty");
            if t > max_t {
                max_t = t;
                for cell in &mut seen {
                    *cell = false;
                }
            }
            if x == ex && y == ey {
                queue.clear();
                queue.push_back((x, y, t));
                break;
            }
            for i in 0..5 {
                let nx = x + dx[i];
                let ny = y + dy[i];
                let nt = t + 1;
                if nx == 0
                    || nx == w - 1
                    || (ny == 0 && nx != 1)
                    || (ny == h - 1 && nx != w - 2)
                    || (ny == -1)
                    || (ny == h)
                {
                    continue;
                }
                if seen[(ny * w + nx) as usize] {
                    continue;
                }
                let mut ok = true;
                for (by, dy) in &col_blizzards[nx as usize] {
                    if ((by + dy * nt) - 1).rem_euclid(h - 2) + 1 == ny {
                        ok = false;
                        break;
                    }
                }
                if !ok {
                    continue;
                }
                for (bx, dx) in &row_blizzards[ny as usize] {
                    if ((bx + dx * nt) - 1).rem_euclid(w - 2) + 1 == nx {
                        ok = false;
                        break;
                    }
                }
                if !ok {
                    continue;
                }
                queue.push_back((nx, ny, nt));
                seen[(ny * w + nx) as usize] = true;
            }
        }
    }
    println!("{max_t}");
}
