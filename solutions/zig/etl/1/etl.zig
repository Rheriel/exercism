const std = @import("std");
const mem = std.mem;

pub fn transform(allocator: mem.Allocator, legacy: std.AutoHashMap(i5, []const u8)) mem.Allocator.Error!std.AutoHashMap(u8, i5) {
    var newFormatMap: std.AutoHashMap(u8, i5) = .init(allocator);

    var iterator = legacy.iterator();

    while (iterator.next()) |entry| {
        const points = entry.key_ptr.*;
        const letters: []const u8 = entry.value_ptr.*;
        for (letters) |ch| {
            try newFormatMap.put(std.ascii.toLower(ch), points);
        }
    }

    return newFormatMap;
}
