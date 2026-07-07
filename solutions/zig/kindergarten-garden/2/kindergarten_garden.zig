pub const Plant = enum {
    clover,
    grass,
    radishes,
    violets,
};

pub fn plants(diagram: []const u8, student: []const u8) [4]Plant {
    const first = 2 * (student[0] - 'A');
    const second = first + 1;
    const third = (diagram.len + 1) / 2 + first;
    const fourth = third + 1;

    return .{
        toPlant(diagram[first]),
        toPlant(diagram[second]),
        toPlant(diagram[third]),
        toPlant(diagram[fourth]),
    };
}

pub fn toPlant(plant: u8) Plant {
    return switch (plant) {
        'G' => .grass,
        'C' => .clover,
        'R' => .radishes,
        'V' => .violets,
        else => unreachable,
    };
}
