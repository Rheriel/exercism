const std = @import("std");

pub fn convert(buffer: []u8, n: u32) []const u8 {
    var used: usize = 0;
    var str: []const u8 = undefined;

    if (n % 3 == 0) {
        str = "Pling";
        pushToBuff(buffer, str, used);
        used = used + str.len;
    }
     
    if (n % 5 == 0) {
        str = "Plang";
        pushToBuff(buffer, str, used);
        used = used + str.len;
    }
    if (n % 7 == 0) {
        str = "Plong";
        pushToBuff(buffer, str, used);
        used = used + str.len;
    }

    if (n % 3 > 0 and
        n % 5 > 0 and
        n % 7 > 0) {
        const newNum = std.fmt.bufPrint(buffer[used..], "{d}", .{n}) catch unreachable;
        used = used + newNum.len;
    }

    return buffer[0..used];
}

fn pushToBuff(buff: []u8, str: []const u8, used: usize) void {   
    for (str, 0..) |ch, buffIdx| {
        buff[used + buffIdx] = ch;
    }
} 
