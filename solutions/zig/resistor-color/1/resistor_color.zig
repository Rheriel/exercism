const std = @import("std");

pub const ColorBand = enum { black, brown, red, orange, yellow, green, blue, violet, grey, white };

pub fn colorCode(color: ColorBand) usize {
    return @intFromEnum(color);
}

var enumValues: [10]ColorBand = undefined;

pub fn colors() []const ColorBand {
    for (0..10) |idx| {
        enumValues[idx] = @enumFromInt(idx);
    }

    return enumValues[0..];
}
