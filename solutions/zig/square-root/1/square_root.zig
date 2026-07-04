const std = @import("std");

pub fn squareRoot(radicand: usize) usize {
    if (radicand <= 0) {
        return 0;
    }

    var max: usize = 5;
    var min: usize = 1;
    var mid: usize = 1;

    while (min < max) {
        mid = min + (max - min) / 2;

        const midSquared: usize = mid * mid;

        if (midSquared < (max * max)) {
            max *= 2;
        }

        if (midSquared == radicand) {
            return mid;
        } else if (midSquared < radicand) {
            min = mid;
        } else {
            max = mid - 1;
        }
    }

    return 0;
}
