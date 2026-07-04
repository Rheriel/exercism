const std = @import("std");

pub fn eggCount(number: usize) usize {
    std.debug.print("\nCalculate eggs in: {d}", .{number});
    if (number == 0) {
        return 0;
    } else if (number == 1) {
        return 1;
    }

    const maxEggs: usize = calculateMaxEggs(number);

    std.debug.print("\nMax eggs: {d}", .{maxEggs});

    var i: usize = maxEggs;
    var currentSum: usize = number;
    var actualEggs: usize = 0;

    while (i >= 0 and currentSum > 0) {
        const toBinary: usize = std.math.pow(usize, 2, i);

        std.debug.print("\n2^{d}={d}", .{ i, toBinary });

        std.debug.print("\n Binary: {d} Current Sum: {d}", .{ toBinary, currentSum });

        if (toBinary > currentSum) {
            i -= 1;
            continue;
        }

        currentSum -= toBinary;
        actualEggs += 1;

        if (currentSum == 0) {
            return actualEggs;
        }

        if (i == 0) {
            break;
        }

        i -= 1;
    }

    return actualEggs;
}

pub fn calculateMaxEggs(number: usize) usize {
    var maxEggs: usize = 0;

    for (0..30) |idx| {
        if (std.math.pow(usize, 2, idx) < number) {
            maxEggs += 1;
        } else {
            break;
        }
    }

    return maxEggs;
}
