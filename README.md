# Advent of Code 2022

Here's my go at solving the puzzles from https://adventofcode.com/2022 - with the extra challenge of using a different programming language for each day.

All the icons below are clickable links to my solutions and some notes/thoughts on the language used that day. Most of the notes were written well after-the-fact so, for better or worse, probably aren't as brilliant as they could be at capturing my emotional "at the moment" opinions.

| Day                                        | Language | Part 1                                     | Part 2                                     | Notes                                 |
| -----------------------------------------: | :------: | :----------------------------------------: | :----------------------------------------: | :-----------------------------------: |
| [1](https://adventofcode.com/2022/day/1)   | Python   | [:white_check_mark:](01_Python/01a.py)     | [:white_check_mark:](01_Python/01b.py)     | [:spiral_notepad:](#day-1---python)   |
| [2](https://adventofcode.com/2022/day/2)   | Lua      | [:white_check_mark:](02_Lua/02a.lua)       | [:white_check_mark:](02_Lua/02b.lua)       |                                       |
| [3](https://adventofcode.com/2022/day/3)   | Odin     | [:white_check_mark:](03_Odin/03a.odin)     | [:white_check_mark:](03_Odin/03b.odin)     |                                       |
| [4](https://adventofcode.com/2022/day/4)   | D        | [:white_check_mark:](04_D/04a.d)           | [:white_check_mark:](04_D/04b.d)           |                                       |
| [5](https://adventofcode.com/2022/day/5)   | Perl     | [:white_check_mark:](05_Perl/05a.pl)       | [:white_check_mark:](05_Perl/05b.pl)       |                                       |
| [6](https://adventofcode.com/2022/day/6)   | Nim      | [:white_check_mark:](06_Nim/day06a.nim)    | [:white_check_mark:](06_Nim/day06b.nim)    |                                       |
| [7](https://adventofcode.com/2022/day/7)   | Awk      | [:white_check_mark:](07_Awk/07a.awk)       | [:white_check_mark:](07_Awk/07b.awk)       |                                       |
| [8](https://adventofcode.com/2022/day/8)   | NodeJS   | [:white_check_mark:](08_NodeJS/08a.js)     | [:white_check_mark:](08_NodeJS/08b.js)     |                                       |
| [9](https://adventofcode.com/2022/day/9)   | Bash     | [:white_check_mark:](09_Bash/09a.sh)       | [:white_check_mark:](09_Bash/09b.sh)       |                                       |
| [10](https://adventofcode.com/2022/day/10) | Ruby     | [:white_check_mark:](10_Ruby/10a.rb)       | [:white_check_mark:](10_Ruby/10b.rb)       |                                       |
| [11](https://adventofcode.com/2022/day/11) | Dart     | [:white_check_mark:](11_Dart/11a.dart)     | [:white_check_mark:](11_Dart/11b.dart)     |                                       |
| [12](https://adventofcode.com/2022/day/12) | Zig      | [:white_check_mark:](12_Zig/12a.zig)       | [:white_check_mark:](12_Zig/12b.zig)       |                                       |
| [13](https://adventofcode.com/2022/day/13) | Go       | [:white_check_mark:](13_Go/13a.go)         | [:white_check_mark:](13_Go/13b.go)         |                                       |
| [14](https://adventofcode.com/2022/day/14) | PHP      | [:white_check_mark:](14_PHP/14a.php)       | [:white_check_mark:](14_PHP/14b.php)       |                                       |
| [15](https://adventofcode.com/2022/day/15) | Julia    | [:white_check_mark:](15_Julia/15a.jl)      | [:white_check_mark:](15_Julia/15b.jl)      |                                       |
| [16](https://adventofcode.com/2022/day/16) | Groovy   | [:white_check_mark:](16_Groovy/16a.groovy) | [:white_check_mark:](16_Groovy/16b.groovy) |                                       |
| [17](https://adventofcode.com/2022/day/17) | C#       | [:white_check_mark:](17_C%23/17a.cs)       |                                            |                                       |
| [18](https://adventofcode.com/2022/day/18) | R        | [:white_check_mark:](18_R/18a.R)           |                                            |                                       |
| [19](https://adventofcode.com/2022/day/19) |          |                                            |                                            |                                       |
| [20](https://adventofcode.com/2022/day/20) |          |                                            |                                            |                                       |
| [21](https://adventofcode.com/2022/day/21) | Scala    | [:white_check_mark:](21_Scala/21a.scala)   | [:white_check_mark:](21_Scala/21b.scala)   |                                       |
| [22](https://adventofcode.com/2022/day/22) |          |                                            |                                            |                                       |
| [23](https://adventofcode.com/2022/day/23) |          |                                            |                                            |                                       |
| [24](https://adventofcode.com/2022/day/24) |          |                                            |                                            |                                       |
| [25](https://adventofcode.com/2022/day/25) | Haskell  | [:white_check_mark:](25_Haskell/25a.hs)    |                                            | [:spiral_notepad:](#day-25---haskell) |

## Thoughts/notes

As a general comment, it is *incredible* how much "how-to" programming information is available online. I only had professional experience using a handful of these languages, and *zero* experience with well over half of them. I'm pretty sure my browsing history is now full of "how do I read a file line-by-line in ________" tutorials for all these languages.

### Day 1 - Python

Python is such an incredible all-purpose language for programming. It provides so much functionality out of the box and makes it so easy to whip something together. This is the programming language I used for all my solutions in previous years.

### Day 25 - Haskell

I knew I wanted to use Haskell *somewhere* in this set of puzzles. This puzzle seemed a good fit as the input data was simple (i.e., no complicated parsing), and the solution I imagined was easily expressed as a combination of mappings and reductions (or "foldings" in Haskell-speak?) ... and because I had pretty much no experience with purely-functional programming languages. Despite the simplicity of the solution, I still spent *ages* on Google trying to figure out Haskell's specific keywords/methods, and in particular trying to figure out how on earth to actually work with file data in `main`. Reading a file via `readFile` and splitting the data into lines via `lines` was found easily-enough, but I just could not for the life of me figure out how to actually worth with the data. While I wanted to operate on `[Strings]`, invariably `IO` kept showing up in my error messages. By moving all the logic out of `main` and into functions, somehow it just magically worked. I still don't really know how/why - I'm not sure if I want to know how/why - but I'm still frustrated by the hours lost to searching Google in vain.
