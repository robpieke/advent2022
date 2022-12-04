module _04b;

import std.array;
import std.conv;
import std.stdio;

void main(string[] args)
{
    int total = 0;
    auto file = File("input.txt");
    foreach(line; file.byLine())
    {
        auto ranges = line.split(",");
        auto minmax1 = ranges[0].split("-");
        auto minmax2 = ranges[1].split("-");
        if (to!int(minmax1[1]) >= to!int(minmax2[0]) && to!int(minmax1[0]) <= to!int(minmax2[1]))
        {
            ++total;
        }
    }
    writeln(total);
}
