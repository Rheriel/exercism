const std = @import("std");
const mem = std.mem;

pub fn abbreviate(allocator: mem.Allocator, words: []const u8) mem.Allocator.Error![]u8 {
    if (words.len == 0) {
        return &[_]u8{};
    }

    var wordsLength: usize = 1;

    for (words, 0..words.len) |word, idx| {
        if ((idx + 1 < words.len) and (word == ' ' or word == '-' or word == '_') and (words[idx + 1] != ' ' and words[idx + 1] != '-' and words[idx + 1] != '_')) {
            wordsLength += 1;
        }
    }

    var acronym: []u8 = try allocator.alloc(u8, wordsLength);

    var acronymLength: usize = 1;
    acronym[0] = words[0];

    for (words, 0..words.len) |word, idx| {
        if ((idx + 1 < words.len) and (word == ' ' or word == '-' or word == '_') and (words[idx + 1] != ' ' and words[idx + 1] != '-' and words[idx + 1] != '_')) {
            acronym[acronymLength] = std.ascii.toUpper(words[idx + 1]);
            acronymLength += 1;
        }
    }

    std.debug.print("Acronym: {s}\n", .{acronym[0..acronymLength]});

    return acronym[0..acronymLength];
}
