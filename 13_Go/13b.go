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

	var lines []string

	for true {
		scanner.Scan()
		lines = append(lines, scanner.Text())
		scanner.Scan()
		lines = append(lines, scanner.Text())
		if !scanner.Scan() {
			break
		}
	}

	idx1 := len(lines) + 1
	idx2 := len(lines) + 2

	for _, line := range lines {
		if order(tokenize("[[2]]"), tokenize(line)) == -1 {
			idx1--
		}
		if order(tokenize("[[6]]"), tokenize(line)) == -1 {
			idx2--
		}
	}

	println(idx1 * idx2)
}
