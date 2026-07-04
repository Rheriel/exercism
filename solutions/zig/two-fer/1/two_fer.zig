const std = @import("std");

pub fn twoFer(buffer: []u8, name: ?[]const u8) ![]u8 {
    const prefix = "One for ";
    const suffix = ", one for me.";
    const actualName = if (name) |n| n else "you";
    const actualBufferLength = prefix.len + actualName.len + suffix.len;

    for (prefix, 0..prefix.len) |ch, i| {
        buffer[i] = ch;
    }

    for (actualName, 0..actualName.len) |ch, i| {
        buffer[prefix.len + i] = ch;
    }

    for (suffix, 0..suffix.len) |ch, i| {
        buffer[prefix.len + actualName.len + i] = ch;
    }

    return buffer[0..actualBufferLength];
}
