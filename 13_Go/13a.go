package main

import (
	"bufio"
	"os"
	"strconv"
)

func tokenize(txt string) []string {
	var tokens []string
	d := 1
	last_i := 1
	i := 1
	for i < len(txt) {
		if txt[i] == '[' {
			d++
		} else if txt[i] == ']' {
			d--
			if d == 0 {
				break
			}
		} else if txt[i] == ',' && d == 1 {
			tokens = append(tokens, txt[last_i:i])
			last_i = i + 1
		}
		i++
	}
	if i-last_i > 0 {
		tokens = append(tokens, txt[last_i:i])
	}
	return tokens
}

func order(tokens1 []string, tokens2 []string) int {
	iters := len(tokens1)
	if len(tokens2) < len(tokens1) {
		iters = len(tokens2)
	}
	for iter := 0; iter < iters; iter++ {
		token1 := tokens1[iter]
		token2 := tokens2[iter]
		if token1[0] == '[' || token2[0] == '[' {
			if token1[0] != '[' {
				token1 = "[" + token1 + "]"
			} else if token2[0] != '[' {
				token2 = "[" + token2 + "]"
			}
			cmp := order(tokenize(token1), tokenize(token2))
			if cmp != 0 {
				return cmp
			}
		} else {
			v1, _ := strconv.Atoi(token1)
			v2, _ := strconv.Atoi(token2)
			if v1 < v2 {
				return -1
			} else if v2 < v1 {
				return 1
			}
		}
	}
	if len(tokens1) < len(tokens2) {
		return -1
	} else if len(tokens2) < len(tokens1) {
		return 1
	}
	return 0
}

func main() {
	file, _ := os.Open("input.txt")
	defer file.Close()
	scanner := bufio.NewScanner(file)

	sum := 0
	pair_idx := 1

	for true {
		scanner.Scan()
		line1 := scanner.Text()
		scanner.Scan()
		line2 := scanner.Text()

		if order(tokenize(line1), tokenize(line2)) <= 0 {
			sum += pair_idx
		}

		if !scanner.Scan() {
			break
		}
		pair_idx += 1
	}

	println(sum)
}
