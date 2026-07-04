const std = @import("std");

pub fn recite(buffer: []u8, start_bottles: u32, take_down: u32) ![]const u8 {
    std.debug.assert(start_bottles >= 1 and take_down >= 1 and start_bottles >= take_down);

    var pos: usize = 0;

    const initialBottles = try getNumberAsString(start_bottles);

    if (start_bottles == 1) {
        var written = try std.fmt.bufPrint(buffer[pos..], "{s} green bottle hanging on the wall,\n", .{initialBottles});
        pos += written.len;
        written = try std.fmt.bufPrint(buffer[pos..], "{s} green bottle hanging on the wall,\n", .{initialBottles});
        pos += written.len;
    } else {
        var written = try std.fmt.bufPrint(buffer[pos..], "{s} green bottles hanging on the wall,\n", .{initialBottles});
        pos += written.len;
        written = try std.fmt.bufPrint(buffer[pos..], "{s} green bottles hanging on the wall,\n", .{initialBottles});
        pos += written.len;
    }
    var written = try std.fmt.bufPrint(buffer[pos..], "And if one green bottle should accidentally fall,\n", .{});
    pos += written.len;
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
        written = try std.fmt.bufPrint(buffer[pos..], "There'll be {s} green bottle hanging on the wall.", .{lowerRemainingBottles[0..remainingBottles.len]});
        pos += written.len;
    } else {
        written = try std.fmt.bufPrint(buffer[pos..], "There'll be {s} green bottles hanging on the wall.", .{lowerRemainingBottles[0..remainingBottles.len]});
        pos += written.len;
    }

    if (take_down > 1) {
        written = try std.fmt.bufPrint(buffer[pos..], "\n\n", .{});
        pos += written.len;
        const restOfTheSong = try recite(buffer[pos..], start_bottles - 1, take_down - 1);

        return buffer[0 .. pos + restOfTheSong.len];
    }

    return buffer[0..pos];
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
