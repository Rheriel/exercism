pub const DnaError = error{ EmptyDnaStrands, UnequalDnaStrands };

pub fn compute(first: []const u8, second: []const u8) DnaError!usize {
    if (first.len == 0 or second.len == 0) {
        return DnaError.EmptyDnaStrands;
    }
    if (first.len != second.len) {
        return DnaError.UnequalDnaStrands;
    }

    var i: usize = 0;
    var hammingDistance: usize = 0;

    while (i < first.len) {
        if (first[i] != second[i]) {
            hammingDistance += 1;
        }

        i += 1;
    }

    return hammingDistance;
}
