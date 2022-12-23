using System;
using System.Collections.Generic;
using System.IO;

namespace AoC
{
    class Day17a
    {
        static void Main()
        {
            int[] heights = { 1, 3, 3, 4, 2 };
            int[,] pieces = {
                {
                    0xF,   // XXXX
                    0x0,   // ....
                    0x0,   // ....
                    0x0,   // ....
                }, {
                    0x2,   // .X..
                    0x7,   // XXX.
                    0x2,   // .X..
                    0x0,   // ....
                }, {
                    0x7,   // XXX.
                    0x4,   // ..X.
                    0x4,   // ..X.
                    0x0,   // ....
                }, {
                    0x1,   // X...
                    0x1,   // X...
                    0x1,   // X...
                    0x1,   // X...
                }, {
                    0x3,   // XX..
                    0x3,   // XX..
                    0x0,   // ....
                    0x0,   // ....
                }
            };

            List<int> board = new List<int>();
            board.Add((1 << 9) - 1);
            int top = 0;

            string jets = File.ReadAllText("input.txt");

            int step = 0;
            for (int block = 0; block < 2022; block++)
            {
                while (board.Count <= top + 7)
                {
                    board.Add((1 << 0) + (1 << 8));
                }
                int piece = block % 5;
                int y = top + 4;
                int x = 3;
                while (true)
                {
                    char jet = jets[step++ % jets.Length];
                    int newX = jet == '<' ? x - 1 : x + 1;
                    for (int row = 0; row < heights[piece]; row++)
                    {
                        if (((pieces[piece, row] << newX) & board[row + y]) != 0)
                        {
                            newX = x;
                            break;
                        }
                    }
                    x = newX;
                    y -= 1;
                    bool hit = false;
                    for (int row = 0; row < heights[piece]; row++)
                    {
                        if (((pieces[piece, row] << newX) & board[row + y]) != 0)
                        {
                            hit = true;
                            break;
                        }
                    }
                    if (hit)
                    {
                        top = Math.Max(top, y + heights[piece]);
                        for (int row = 0; row < heights[piece]; row++)
                        {
                            board[row + y + 1] |= (pieces[piece, row] << newX);
                        }
                        break;
                    }
                }
            }
            Console.WriteLine("{0}", top);
        }
    }
}