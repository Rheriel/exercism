const std = @import("std");

pub fn truncate(phrase: []const u8) []const u8 {
    if (phrase.len < 5) {
        return phrase[0..];
    }

    if (!std.unicode.utf8ValidateSlice(phrase)) {
        return phrase[0..5];
    }

    var utf8View = std.unicode.Utf8View.init(phrase) catch return phrase[0..5];
    var iterator = utf8View.iterator();

    var charCount: usize = 0;
    while (iterator.nextCodepoint()) |_| {
        charCount += 1;

        if (charCount == 5) {
            return phrase[0..iterator.i];
        }
    }

    return phrase[0..];
}
