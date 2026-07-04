const std = @import("std");

pub fn isArmstrongNumber(num: u128) bool {
    // An [Armstrong number][armstrong-number] is a number that is the sum of its own digits each raised to the power of the number of digits.
    const allocator = std.heap.page_allocator;
    const numStr = std.fmt.allocPrint(allocator, "{d}", .{num}) catch return false;
    defer allocator.free(numStr);

    var numDigits: usize = 0;
    for (numStr) |_| {
        numDigits += 1;
    }

    var sum: u128 = 0;
    for (numStr) |c| {
        const digit = c - '0';
        const digitPower = std.math.pow(u128, digit, numDigits);
        sum += digitPower;
    }

    return sum == num;
}
