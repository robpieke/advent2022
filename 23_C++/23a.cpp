#include <array>
#include <fstream>
#include <iostream>
#include <map>
#include <set>

int main()
{
    std::ifstream f("input.txt");
    std::string line;
    int y = 0;
    using Coord = std::pair<int, int>;
    std::set<Coord> elves;
    while (std::getline(f, line))
    {
        for (int x = 0; x < line.length(); ++x)
            if (line[x] == '#')
                elves.insert({x, y});
        ++y;
    }

    for (int step = 0; step < 10; ++step)
    {
        std::map<Coord, Coord> proposed;
        std::array<int, 4> masks = { 0b00000111, 0b11100000, 0b00101001, 0b10010100 };
        std::array<int, 4> dx = { 0, 0, -1, 1}; 
        std::array<int, 4> dy = { -1, 1, 0, 0};

        for (const auto &elf : elves)
        {
            Coord next = elf;
            int neighbours = 
                (elves.count({elf.first - 1, elf.second - 1}) << 0) +
                (elves.count({elf.first    , elf.second - 1}) << 1) +
                (elves.count({elf.first + 1, elf.second - 1}) << 2) +
                (elves.count({elf.first - 1, elf.second    }) << 3) +
                (elves.count({elf.first + 1, elf.second    }) << 4) +
                (elves.count({elf.first - 1, elf.second + 1}) << 5) +
                (elves.count({elf.first    , elf.second + 1}) << 6) +
                (elves.count({elf.first + 1, elf.second + 1}) << 7);
            if (neighbours)
            {
                for (int mask = 0; mask < masks.size(); ++mask)
                {
                    int idx = (mask + step) % masks.size();
                    if ((neighbours & masks[idx]) == 0)
                    {
                        next = {elf.first + dx[idx], elf.second + dy[idx]};
                        break;
                    }
                }
                if (proposed.count(next))
                {
                    proposed[proposed[next]] = proposed[next];
                    proposed[next] = {INT_MAX, INT_MAX};
                    next = elf;
                }
            }
            proposed[next] = elf;
        }
        elves.clear();
        for (const auto &elf : proposed)
            if (elf.second != std::make_pair(INT_MAX, INT_MAX))
                elves.insert(elf.first);
    }

    int x_min = INT_MAX;
    int x_max = INT_MIN;
    int y_min = INT_MAX;
    int y_max = INT_MIN;
    for (const auto &elf : elves)
    {
        x_min = std::min(x_min, elf.first);
        x_max = std::max(x_max, elf.first);
        y_min = std::min(y_min, elf.second);
        y_max = std::max(y_max, elf.second);
    }

    std::cout << (x_max - x_min + 1) * (y_max - y_min + 1) - elves.size() << std::endl;

    return 0;
}
