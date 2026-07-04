const std = @import("std");
const mem = std.mem;

pub fn abbreviate(allocator: mem.Allocator, words: []const u8) mem.Allocator.Error![]u8 {
    if (words.len == 0) {
        return allocator.alloc(u8, 0);
    }

    var wordsLength: usize = 0;

    for (0..words.len) |idx| {
        if (isWordStart(words, idx)) {
            wordsLength += 1;
        }
    }

    var acronym: []u8 = try allocator.alloc(u8, wordsLength);
    var acronymLength: usize = 0;

    for (0..words.len) |idx| {
        if (isWordStart(words, idx)) {
            acronym[acronymLength] = std.ascii.toUpper(words[idx]);
            acronymLength += 1;
        }
    }

    std.debug.print("Acronym: {s}\n", .{acronym[0..acronymLength]});

    return acronym;
}

pub fn isSeparator(ch: u8) bool {
    return ch == ' ' or ch == '-' or ch == '_';
}

pub fn isWordStart(words: []const u8, idx: usize) bool {
    if (isSeparator(words[idx])) {
        return false;
    }
    return idx == 0 or isSeparator(words[idx - 1]);
}
