const std = @import("std");

pub fn main() !void {
    const file = try std.fs.cwd().openFile("input.txt", .{ .read = true });
    defer file.close();

    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    defer _ = gpa.deinit();

    const stat = try file.stat();
    const map = try allocator.alloc(u8, stat.size);
    defer allocator.free(map);

    _ = try file.read(map);

    const S = @truncate(u16, std.mem.indexOf(u8, map, "S").?);
    const E = @truncate(u16, std.mem.indexOf(u8, map, "E").?);
    map[S] = 'a';
    map[E] = 'z';

    // We'll assume from here on that each row of data,
    // except the last row, is terminated with '\n'.
    // This will give an extra phantom column.

    const rows = @truncate(u16, std.mem.count(u8, map, "\n") + 1);
    const cols = @truncate(u16, (stat.size + 1) / rows);

    var min_final: u16 = std.math.maxInt(u16);

    const min_path = try allocator.alloc(u16, rows * cols);
    defer allocator.free(min_path);
    var i: u32 = 0;
    while (i < min_path.len) : (i += 1) {
        min_path[i] = std.math.maxInt(u16);
    }
    min_path[E] = 0;

    var active = std.AutoHashMap(u16, void).init(allocator);
    defer active.deinit();
    try active.put(E, {});

    while (active.count() > 0) {
        var min: u16 = std.math.maxInt(u16);
        var cur: u16 = 0;
        var iter = active.keyIterator();
        while (iter.next()) |key| {
            if (min_path[key.*] < min) {
                min = min_path[key.*];
                cur = key.*;
            }
        }
        if (map[cur] == 'a' and min_path[cur] < min_final) {
            min_final = min_path[cur];
        }
        _ = active.remove(cur);

        // L
        if ((cur % cols > 0) and
            (min_path[cur - 1] > min + 1) and
            (@bitCast(i8, map[cur - 1]) - @bitCast(i8, map[cur]) >= -1))
        {
            min_path[cur - 1] = min + 1;
            try active.put(cur - 1, {});
        }
        // R
        if ((cur % cols < cols - 2) and
            (min_path[cur + 1] > min + 1) and
            (@bitCast(i8, map[cur + 1]) - @bitCast(i8, map[cur]) >= -1))
        {
            min_path[cur + 1] = min + 1;
            try active.put(cur + 1, {});
        }
        // U
        if ((cur >= cols) and
            (min_path[cur - cols] > min + 1) and
            (@bitCast(i8, map[cur - cols]) - @bitCast(i8, map[cur]) >= -1))
        {
            min_path[cur - cols] = min + 1;
            try active.put(cur - cols, {});
        }
        // D
        if ((cur < cols * (rows - 1)) and
            (min_path[cur + cols] > min + 1) and
            (@bitCast(i8, map[cur + cols]) - @bitCast(i8, map[cur]) >= -1))
        {
            min_path[cur + cols] = min + 1;
            try active.put(cur + cols, {});
        }
    }
    std.debug.print("{}\n", .{min_final});
}
