// Please implement the `ComputationError.IllegalArgument` error.
// - If it's even, divide it by 2.
// - If it's odd, multiply it by 3 and add 1.

pub const ComputationError = error{IllegalArgument};

pub fn steps(number: usize) anyerror!usize {
    if (number == 0) {
        return ComputationError.IllegalArgument;
    }

    if (number == 1) {
        return 0;
    }

    if (isEven(number)) {
        return try steps(number / 2) + 1;
    } else {
        return try steps((number * 3) + 1) + 1;
    }
}

pub fn isEven(number: usize) bool {
    return number % 2 == 0;
}
