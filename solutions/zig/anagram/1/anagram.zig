const std = @import("std");
const mem = std.mem;

/// Returns the set of strings in `candidates` that are anagrams of `word`.
/// Caller owns the returned memory.
pub fn detectAnagrams(
    allocator: mem.Allocator,
    word: []const u8,
    candidates: []const []const u8,
) !std.BufSet {
    var bufSet: std.BufSet = std.BufSet.init(allocator);
    errdefer bufSet.deinit();

    var wordChars: [256]usize = mem.zeroes([256]usize);

    for (word) |ch| {
        wordChars[std.ascii.toLower(ch)] += 1;
    }

    for (candidates) |candidate| {
        if (candidate.len != word.len or std.ascii.eqlIgnoreCase(candidate, word)) {
            continue;
        }

        var candidateChars: [256]usize = mem.zeroes([256]usize);

        for (candidate) |ch| {
            candidateChars[std.ascii.toLower(ch)] += 1;
        }

        var isAnagram: bool = true;

        for (0..wordChars.len) |idx| {
            if (wordChars[idx] != candidateChars[idx]) {
                isAnagram = false;
                break;
            }
        }

        if (!isAnagram) {
            continue;
        }

        try bufSet.insert(candidate);
    }

    return bufSet;
}
