const std = @import("std");

pub fn recite(buffer: []u8, start_bottles: u32, take_down: u32) ![]const u8 {
    std.debug.assert(start_bottles >= 1 and take_down >= 1 and start_bottles >= take_down);

    var fixedBufferStream = std.io.fixedBufferStream(buffer);
    const writer = fixedBufferStream.writer();

    const initialBottles = try getNumberAsString(start_bottles);

    if (start_bottles == 1) {
        try writer.print("{s} green bottle hanging on the wall,\n", .{initialBottles});
        try writer.print("{s} green bottle hanging on the wall,\n", .{initialBottles});
    } else {
        try writer.print("{s} green bottles hanging on the wall,\n", .{initialBottles});
        try writer.print("{s} green bottles hanging on the wall,\n", .{initialBottles});
    }
    try writer.print("And if one green bottle should accidentally fall,\n", .{});
    const remainingBottles = try getNumberAsString(start_bottles - 1);
    var lowerRemainingBottles: [10]u8 = undefined;
    for (remainingBottles, 0..) |ch, idx| {
        if (idx == 0) {
            lowerRemainingBottles[idx] = std.ascii.toLower(ch);
            continue;
        }
        lowerRemainingBottles[idx] = ch;
    }
    if (start_bottles - 1 == 1) {
        try writer.print("There'll be {s} green bottle hanging on the wall.", .{lowerRemainingBottles[0..remainingBottles.len]});
    } else {
        try writer.print("There'll be {s} green bottles hanging on the wall.", .{lowerRemainingBottles[0..remainingBottles.len]});
    }

    if (take_down > 1) {
        try writer.print("\n\n", .{});
        const restOfTheSong = try recite(buffer[fixedBufferStream.pos..], start_bottles - 1, take_down - 1);

        return buffer[0 .. fixedBufferStream.pos + restOfTheSong.len];
    }

    return fixedBufferStream.getWritten();
}

pub fn getNumberAsString(number: u32) ![]const u8 {
    return switch (number) {
        0 => "No",
        1 => "One",
        2 => "Two",
        3 => "Three",
        4 => "Four",
        5 => "Five",
        6 => "Six",
        7 => "Seven",
        8 => "Eight",
        9 => "Nine",
        10 => "Ten",
        else => error.InvalidNumber,
    };
}
