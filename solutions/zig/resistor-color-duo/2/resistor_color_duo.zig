pub const ColorBand = enum { black, brown, red, orange, yellow, green, blue, violet, grey, white };

pub fn colorCode(colors: [2]ColorBand) usize {
    if (colors.len == 0) {
        return 0;
    } else if (colors.len == 1) {
        return @intFromEnum(colors[0]);
    }

    const colorValue1: usize = @intFromEnum(colors[0]);
    const colorValue2: usize = @intFromEnum(colors[1]);

    return colorValue1 * 10 + colorValue2;
}
