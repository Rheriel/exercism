const std = @import("std");
const mem = std.mem;

pub fn format(allocator: mem.Allocator, name: []const u8, number: u10) ![]u8 {
    var _number = number;
    if (number > 100) {
        _number = number % 100;
    }
    const suffix = if (_number == 11 or _number == 12 or _number == 13) "th" else if ((_number > 10 and _number % 10 == 1) or _number == 1) "st" else if ((_number > 10 and _number % 10 == 2) or _number == 2)
        "nd"
    else if ((_number > 10 and _number % 10 == 3) or _number == 3) "rd" else "th";

    return std.fmt.allocPrint(allocator, "{s}, you are the {d}{s} customer we serve today. Thank you!", .{ name, number, suffix });
}
