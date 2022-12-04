package main

import "core:fmt"
import "core:os"
import "core:strings"

main :: proc() {
	data, _ := os.read_entire_file("03.txt", context.allocator)
	defer delete(data, context.allocator)

    total := 0;

	it := string(data)
	for line in strings.split_lines_iterator(&it) {
		items : [52]bool;
        i := 0;
        for char in line {
            val : i8;
            switch char {
                case 'A'..='Z':
                    val = i8(char - 'A') + 26;
                case 'a'..='z':
                    val = i8(char - 'a');
            }
            if i >= len(line) / 2 {
                if items[val] {
                    total += int(val) + 1;
                    break;
                }
            }
            else {
                items[val] = true;
            }
            i += 1;
        }
	}

    fmt.println(total);
}