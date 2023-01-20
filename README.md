# Advent of Code 2022

Here's my go at solving the puzzles from https://adventofcode.com/2022 - with the extra challenge of using a different programming language for each day.

All the icons below are clickable links to my solutions and some notes/thoughts on the language used that day. Most of the notes were written well after-the-fact so, for better or worse, probably aren't as brilliant as they could be at capturing my emotional "at the moment" opinions.

| Day                                        | Language | Part 1                                     | Part 2                                     | Notes                                 |
| -----------------------------------------: | :------: | :----------------------------------------: | :----------------------------------------: | :-----------------------------------: |
| [1](https://adventofcode.com/2022/day/1)   | Python   | [:white_check_mark:](01_Python/01a.py)     | [:white_check_mark:](01_Python/01b.py)     | [:spiral_notepad:](#day-1---python)   |
| [2](https://adventofcode.com/2022/day/2)   | Lua      | [:white_check_mark:](02_Lua/02a.lua)       | [:white_check_mark:](02_Lua/02b.lua)       | [:spiral_notepad:](#day-2---lua)      |
| [3](https://adventofcode.com/2022/day/3)   | Odin     | [:white_check_mark:](03_Odin/03a.odin)     | [:white_check_mark:](03_Odin/03b.odin)     | [:spiral_notepad:](#day-3---odin)     |
| [4](https://adventofcode.com/2022/day/4)   | D        | [:white_check_mark:](04_D/04a.d)           | [:white_check_mark:](04_D/04b.d)           | [:spiral_notepad:](#day-4---d)        |
| [5](https://adventofcode.com/2022/day/5)   | Perl     | [:white_check_mark:](05_Perl/05a.pl)       | [:white_check_mark:](05_Perl/05b.pl)       | [:spiral_notepad:](#day-5---perl)     |
| [6](https://adventofcode.com/2022/day/6)   | Nim      | [:white_check_mark:](06_Nim/day06a.nim)    | [:white_check_mark:](06_Nim/day06b.nim)    | [:spiral_notepad:](#day-6---nim)      |
| [7](https://adventofcode.com/2022/day/7)   | Awk      | [:white_check_mark:](07_Awk/07a.awk)       | [:white_check_mark:](07_Awk/07b.awk)       | [:spiral_notepad:](#day-7---awk)      |
| [8](https://adventofcode.com/2022/day/8)   | NodeJS   | [:white_check_mark:](08_NodeJS/08a.js)     | [:white_check_mark:](08_NodeJS/08b.js)     |                                       |
| [9](https://adventofcode.com/2022/day/9)   | Bash     | [:white_check_mark:](09_Bash/09a.sh)       | [:white_check_mark:](09_Bash/09b.sh)       |                                       |
| [10](https://adventofcode.com/2022/day/10) | Ruby     | [:white_check_mark:](10_Ruby/10a.rb)       | [:white_check_mark:](10_Ruby/10b.rb)       |                                       |
| [11](https://adventofcode.com/2022/day/11) | Dart     | [:white_check_mark:](11_Dart/11a.dart)     | [:white_check_mark:](11_Dart/11b.dart)     |                                       |
| [12](https://adventofcode.com/2022/day/12) | Zig      | [:white_check_mark:](12_Zig/12a.zig)       | [:white_check_mark:](12_Zig/12b.zig)       |                                       |
| [13](https://adventofcode.com/2022/day/13) | Go       | [:white_check_mark:](13_Go/13a.go)         | [:white_check_mark:](13_Go/13b.go)         |                                       |
| [14](https://adventofcode.com/2022/day/14) | PHP      | [:white_check_mark:](14_PHP/14a.php)       | [:white_check_mark:](14_PHP/14b.php)       |                                       |
| [15](https://adventofcode.com/2022/day/15) | Julia    | [:white_check_mark:](15_Julia/15a.jl)      | [:white_check_mark:](15_Julia/15b.jl)      |                                       |
| [16](https://adventofcode.com/2022/day/16) | Groovy   | [:white_check_mark:](16_Groovy/16a.groovy) | [:white_check_mark:](16_Groovy/16b.groovy) |                                       |
| [17](https://adventofcode.com/2022/day/17) | C#       | [:white_check_mark:](17_C%23/17a.cs)       | [:white_check_mark:](17_C%23/17b.cs)       | [:spiral_notepad:](#day-17---c)       |
| [18](https://adventofcode.com/2022/day/18) | R        | [:white_check_mark:](18_R/18a.R)           | [:white_check_mark:](18_R/18b.R)           | [:spiral_notepad:](#day-18---r)       |
| [19](https://adventofcode.com/2022/day/19) | V        | [:white_check_mark:](19_V/19a.v)           | [:white_check_mark:](19_V/19b.v)           | [:spiral_notepad:](#day-19---v)       |
| [20](https://adventofcode.com/2022/day/20) | Tcl      | [:white_check_mark:](20_Tcl/20a.tcl)       | [:white_check_mark:](20_Tcl/20a.tcl)       | [:spiral_notepad:](#day-20---tcl)     |
| [21](https://adventofcode.com/2022/day/21) | Scala    | [:white_check_mark:](21_Scala/21a.scala)   | [:white_check_mark:](21_Scala/21b.scala)   |                                       |
| [22](https://adventofcode.com/2022/day/22) | Kotlin   | [:white_check_mark:](22_Kotlin/22a.kt)     |                                            |                                       |
| [23](https://adventofcode.com/2022/day/23) | C++      | [:white_check_mark:](23_C%2B%2B/23a.cpp)   | [:white_check_mark:](23_C%2B%2B/23b.cpp)   | [:spiral_notepad:](#day-23---c)       |
| [24](https://adventofcode.com/2022/day/24) | Rust     | [:white_check_mark:](24_Rust/24a.rs)       | [:white_check_mark:](24_Rust/24b.rs)       | [:spiral_notepad:](#day-24---rust)    |
| [25](https://adventofcode.com/2022/day/25) | Haskell  | [:white_check_mark:](25_Haskell/25a.hs)    |                                            | [:spiral_notepad:](#day-25---haskell) |

## Thoughts/notes

As a general comment, it is *incredible* how much "how-to" programming information is available online. I only had professional experience using a handful of these languages, and *zero* experience with well over half of them. I'm pretty sure my browsing history is now full of "how do I read a file line-by-line in ________" tutorials for all these languages.

### Day 1 - Python

Python is such an incredible all-purpose language for programming. It provides so much functionality out of the box and makes it so easy to whip something together. This is the programming language I used for all my solutions in previous years.

### Day 2 - Lua

This was an easy choice. The problem was trivially solved using look-up tables and, to quote their own docs, "Tables are the main (in fact, the only) data structuring mechanism in Lua".

### Day 3 - Odin

I'd been curious about Odin ever since I heard [EmberGen](https://odin-lang.org/showcase/embergen/) was written in it. Being very C++-like, it was easy to pick up and work with, and I was pleasantly surprised how much useful documentation I could find. Relevant for this day's puzzle, I particularly liked how `switch` statements could accept ranges for a `case` (see [my solution for the first part](03_Odin/03a.odin#L19-L24) as an example). I also felt the brevity in code required for casting between types is a good design decision.

### Day 4 - D

Not much to say. Another C++-like language, easy to work with and solve the day's puzzle. I don't think I took particular advantage of much from the language, other than easily reading a file line-by-line in a `for` loop, and splitting strings into arrays.

### Day 5 - Perl

This brought back memories of trying to dissect/understand and extend Perl scripts at a previous company. The language was a good fit for the day's puzzle, with the built-in support for regex and text manipulation/wrangling.

### Day 6 - Nim

It's arguably not a big thing, but it annoyed me that I couldn't name my source files `06a.nim` because the filename is used to drive the module name and `06a` isn't a valid identifier. *None* of the other languages I used had this restriction (at most I'd need to specify a module name inside the source file - [D for example](04_D/04a.d#L1)). Ignoring that, the language was easy to work with. I like the numeric ranges for `for` loops, and the multi-line blocks for `let` and `var`. The solutions were too short to get a real sense of the language, but I felt more like I was programming in Python than in C++ here - and, especially in this context, I mean that in a very positive way.

### Day 7 - Awk

I'd never used Awk beyond some simple one-liners to extract a bit of data from some text. I'm really glad I chose to use this language for a puzzle, and this day's puzzle was a good fit with its requirement for text processing (specifically processing a file line-by-line, then ending by aggregating the processed data). I didn't know if Awk would have the support I'd need (associative arrays, for example), and it's been a great discovery to understand just how powerful this language is. I expect I'll be reaching for it in a professional capacity in future.

### Day 17 - C#

Working with C# came quite naturally given my familiarity with C++. I liked the support for [multidimensional arrays](17_C%23/17a.cs#L12) as first-class primitives, and there's some handy stuff in the .NET framework (such as [`File.ReadAllText()`](17_C%23/17a.cs#L45) and [`Dictionary<K,V>.TryGetValue()`](17_C%23/17b.cs#L65)).

### Day 18 - R

This was a tough one for me, with zero experience using R. I really struggled with my ignorance of R vectors vs lists vs matrices vs data frames, but was pretty satisfied with my approach for the first half of the day's puzzle. It felt like R was a great fit for this challenge, allowing a really concise solution leveraging R's data processing capabilities. The second half proved a further struggle, however. I knew the approach I wanted to take, but the implementation left me feeling like I was no longer taking advantage of R and was doing a fairly literal translation of the solution as I'd implement it in Python (or similar).

### Day 19 - V

This was the day's puzzles that I started last (though I still finished these before 22b), so I was running low on languages to choose from. I don't remember how I found V, but it made some bold performance promises, and the syntax looked close enough to C/C++ to be easily approachable. On the whole I actually found it pretty good, with some interesting language design and excellent docs (https://github.com/vlang/v/blob/master/doc/docs.md). One life-saver for this day's puzzles was the built-in profiler, which revealed that my never-finishing code was spending pretty much all its time appending to a `datatypes.Queue` that only tracked a `head` pointer and thus had `O(n)` cost for `push`. After making a local modified copy of the underlying `LinkedList` struct to also track `tail` and give `O(1)` for `push`, the hotspot in the profile vanished and my code ran in a few seconds.

### Day 20 - Tcl

I chose this language more because I was running out of languages than because I thought it'd be a good fit. To be fair, it was pretty easy to express my solution using Tcl, though it did mean living the programming-interview joke(?) about implementing linked-list functionality.

### Day 23 - C++

This has been my main professional day-to-day programming language for the last decade or two, so I was pretty confident that whichever puzzle I ended up using it for would be solved without too much fighting-against-the-language pain. The `std` containers were very helpful (I didn't expect to use all of `set`, `map` and `array`, but they each served a useful purpose), and I was able to proceed confidently.

### Day 24 - Rust

I keep wanting to learn Rust properly, but it never fully clicks with me. Perhaps I'm just too set in my C++ ways, but I keep finding Rust just a bit awkward to work with. Luckily this puzzle didn't require any of the borrow-checking "fun" Rust has to offer, but I still found myself stumbling against the compiler more often than I'd like. The strictness over types (`i32` vs `usize` for example), regardless how well motivated for safety, was annoying - and I prefer the C-style casting syntax of other languages (`i32(x + y)` vs `(x + y) as i32`). Maybe I'll still love Rust in the future one day, but not today.

### Day 25 - Haskell

I knew I wanted to use Haskell *somewhere* in this set of puzzles. This puzzle seemed a good fit as the input data was simple (i.e., no complicated parsing), and the solution I imagined was easily expressed as a combination of mappings and reductions (or "foldings" in Haskell-speak?) ... and because I had pretty much no experience with purely-functional programming languages. Despite the simplicity of the solution, I still spent *ages* on Google trying to figure out Haskell's specific keywords/methods, and in particular trying to figure out how on earth to actually work with file data in `main`. Reading a file via `readFile` and splitting the data into lines via `lines` was found easily-enough, but I just could not for the life of me figure out how to actually worth with the data. While I wanted to operate on `[Strings]`, invariably `IO` kept showing up in my error messages. By moving all the logic out of `main` and into functions, somehow it just magically worked. I still don't really know how/why - I'm not sure if I want to know how/why - but I'm still frustrated by the hours lost to searching Google in vain.
