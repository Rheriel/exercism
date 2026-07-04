const std = @import("std");
const EnumSet = std.EnumSet;

pub const Allergen = enum {
    eggs,
    peanuts,
    shellfish,
    strawberries,
    tomatoes,
    chocolate,
    pollen,
    cats,
};

pub fn isAllergicTo(score: u8, allergen: Allergen) bool {
    const bitIndex: u3 = @intCast(@intFromEnum(allergen));
    const allergenScore: u8 = @as(u8, 1) << bitIndex;

    return score & allergenScore != 0;
}

pub fn initAllergenSet(score: usize) EnumSet(Allergen) {
    var allergenEnumSet = EnumSet(Allergen).initEmpty();

    for (0..8) |idx| {
        const bitIndex: u3 = @intCast(idx);
        const allergenScore: u8 = @as(u8, 1) << bitIndex;
        if (score & allergenScore != 0) {
            allergenEnumSet.insert(@enumFromInt(idx));
        }
    }

    return allergenEnumSet;
}
