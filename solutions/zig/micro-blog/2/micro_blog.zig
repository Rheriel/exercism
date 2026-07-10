const std = @import("std");

pub fn truncate(phrase: []const u8) []const u8 {
    var iterator = std.unicode.Utf8View.initUnchecked(phrase).iterator();

    return iterator.peek(5);
}
