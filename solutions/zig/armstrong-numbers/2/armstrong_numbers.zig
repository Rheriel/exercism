const std = @import("std");

pub fn isArmstrongNumber(num: u128) bool {
    // An [Armstrong number][armstrong-number] is a number that is the sum of its own digits each raised to the power of the number of digits.
    if (num == 0) {
        return true;
    }

    var n: u128 = num;
    var numDigits: usize = 0;

    while (n > 0) {
        n /= 10;
        numDigits += 1;
    }

    n = num;
    var sum: u128 = 0;
    while (n > 0) {
        const digit: u128 = n % 10;
        n /= 10;
        sum += std.math.pow(u128, digit, numDigits);
    }

    return sum == num;
}
