package main

import "core:fmt"
import "core:math"
import "core:os"
import "core:strings"

main :: proc() {
	data, _ := os.read_entire_file("03.txt", context.allocator)
	defer delete(data, context.allocator)

    total := 0;

	it := string(data)
    i : u8 = 0;
    items : [52]u8;
	for line in strings.split_lines_iterator(&it) {
        if i == 0 {
            for j in 0..<52 {
                items[j] = 0;
            }
        }
        for char in line {
            val : i8;
            switch char {
                case 'A'..='Z':
                    val = i8(char - 'A') + 26;
                case 'a'..='z':
                    val = i8(char - 'a');
            }
            if i == 2 {
                if items[val] == 3 {
                    total += int(val) + 1;
                    break;
                }
            }
            else {
                items[val] |= (1 << i);
            }
        }
        i = (i + 1) % 3;
	}

    fmt.println(total);
}