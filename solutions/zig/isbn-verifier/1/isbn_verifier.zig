const std = @import("std");

pub fn isValidIsbn10(s: []const u8) bool {
    if (s.len == 0) {
        return false;
    }

    var runningSum: usize = 0;
    var charCount: usize = 10;

    for (s) |ch| {
        var num: usize = 0;
        const isCheck: bool = charCount == 1;

        if (ch == '-') {
            continue;
        } else if ((ch == 'X' or ch == 'x') and !isCheck) {
            return false;
        } else if ((ch == 'X' or ch == 'x') and isCheck) {
            num = 10;
        } else if (std.ascii.isAlphabetic(ch) or std.ascii.isWhitespace(ch)) {
            return false;
        } else {
            num = ch - '0';
        }

        runningSum += (charCount * num);

        if (charCount > 0) {
            charCount -= 1;
        } else {
            return false;
        }
    }

    return charCount == 0 and runningSum % 11 == 0;
}
