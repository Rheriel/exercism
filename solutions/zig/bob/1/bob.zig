const std = @import("std");

pub fn response(s: []const u8) []const u8 {
    const trimmedS: []const u8 = std.mem.trim(u8, s, " \t\n\r");

    if (isSilence(trimmedS)) {
        return "Fine. Be that way!";
    } else if (isShouting(trimmedS) and !isQuestion(trimmedS)) {
        return "Whoa, chill out!";
    } else if (isShouting(trimmedS) and isQuestion(trimmedS)) {
        return "Calm down, I know what I'm doing!";
    } else if (isQuestion(trimmedS)) {
        return "Sure.";
    }

    return "Whatever.";
}

pub fn isSilence(s: []const u8) bool {
    return s.len == 0;
}

pub fn isShouting(s: []const u8) bool {
    var atLeastOneLetter: bool = false;
    for (s) |ch| {
        if (!std.ascii.isAlphabetic(ch)) {
            continue;
        }
        if (ch < 'A' or ch > 'Z') {
            return false;
        } else {
            atLeastOneLetter = true;
        }
    }

    return atLeastOneLetter;
}

pub fn isQuestion(s: []const u8) bool {
    return s[s.len - 1] == '?';
}
