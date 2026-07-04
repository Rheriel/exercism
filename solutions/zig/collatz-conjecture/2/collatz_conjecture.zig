// Please implement the `ComputationError.IllegalArgument` error.
// - If it's even, divide it by 2.
// - If it's odd, multiply it by 3 and add 1.

pub const ComputationError = error{IllegalArgument};

pub fn steps(number: usize) anyerror!usize {
    return switch (number) {
        0 => return ComputationError.IllegalArgument,
        1 => 0,
        else => 1 + try steps(if (number % 2 == 0) number / 2 else number * 3 + 1),
    };
}
