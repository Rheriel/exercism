const std = @import("std");

pub fn isIsogram(str: []const u8) bool {
    var chars: [255]bool = @splat(false);
    var isIsogramFlag = true;
    for (str) |ch| {
        if (ch != '-' and
            ch != '_' and 
            ch != ' ' and 
            chars[std.ascii.toLower(ch)]) {
            isIsogramFlag = false;
        }

        chars[std.ascii.toLower(ch)] = true;
    }

return isIsogramFlag;
}
