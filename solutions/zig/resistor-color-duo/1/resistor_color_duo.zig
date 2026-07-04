const std = @import("std");

pub const ColorBand = enum { black, brown, red, orange, yellow, green, blue, violet, grey, white };

pub fn colorCode(colors: [2]ColorBand) usize {
    if (colors.len == 0) {
        return 0;
    } else if (colors.len == 1) {
        return @intFromEnum(colors[0]);
    }

    const colorValue1 = @intFromEnum(colors[0]);
    const colorValue2 = @intFromEnum(colors[1]);

    var buffer: [2]u8 = undefined;
    const str = std.fmt.bufPrint(&buffer, "{d}{d}", .{ colorValue1, colorValue2 }) catch "00";

    return std.fmt.parseInt(usize, str, 10) catch return 0;
}
