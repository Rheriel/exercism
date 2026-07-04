const std = @import("std");
const mem = std.mem;

pub fn sum(allocator: mem.Allocator, factors: []const u32, limit: u32) !u64 {
    if (limit == 0) {
        return 0;
    }

    var set = std.AutoHashMap(u64, usize).init(allocator);
    defer set.deinit();

    for (factors) |factor| {
        if (factor == 0) {
            continue;
        }

        for (1..limit) |i| {
            if (i * factor >= limit) {
                break;
            }
            try set.put(i * factor, 0);
        }
    }

    var total: u64 = 0;
    var it = set.keyIterator();

    while (it.next()) |value| {
        total += value.*;
    }

    return total;
}
