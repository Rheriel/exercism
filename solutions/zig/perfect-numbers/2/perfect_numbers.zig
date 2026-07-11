pub const Classification = enum {
    deficient,
    perfect,
    abundant,
};

/// Asserts that `n` is nonzero.
pub fn classify(n: u64) Classification {
    var sum: u64 = 0;

    for (1..n) |factor| {
        if (n % factor == 0) {
            sum += factor;
        }
    }

    if (sum == n) {
        return .perfect;
    } else if (sum > n) {
        return .abundant;
    }

    return .deficient;
}
