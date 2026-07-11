const std = @import("std");

pub const Classification = enum {
    deficient,
    perfect,
    abundant,
};

/// Asserts that `n` is nonzero.
pub fn classify(n: u64) Classification {
    const allocator = std.testing.allocator;
    const factorsUpToN: []const u64 = getFactorsUpToN(allocator, n);
    defer allocator.free(factorsUpToN);

    var sum: u64 = 0;

    for (factorsUpToN) |factor| {
        sum += factor;
    }

    if (sum == n) {
        return .perfect;
    } else if (sum > n) {
        return .abundant;
    }

    return .deficient;
}

pub fn getFactorsUpToN(allocator: std.mem.Allocator, n: u64) []const u64 {
    var factorList: std.ArrayList(u64) = .empty;
    defer factorList.deinit(allocator);

    for (1..n) |candidate| {
        if (n % candidate == 0) {
            factorList.append(allocator, candidate) catch std.debug.print("Error appending candidate {d} to list!", .{candidate});
        }
    }

    return factorList.toOwnedSlice(allocator) catch undefined;
}
