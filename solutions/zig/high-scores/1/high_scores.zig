pub const HighScores = struct {
    _scores: []const i32,
    size: usize,
    _highest: i32,
    topThree: [3]i32,
    topThreeLength: usize,

    pub fn init(scores: []const i32) HighScores {
        var highest: i32 = 0;
        var secondHighest: i32 = highest;
        var thirdHighest: i32 = secondHighest;

        for (scores) |score| {
            if (highest <= score) {
                thirdHighest = secondHighest;
                secondHighest = highest;
                highest = score;
            } else if (secondHighest <= score) {
                secondHighest = score;
            } else if (thirdHighest <= score) {
                thirdHighest = score;
            }
        }

        return HighScores{ ._scores = scores, .size = scores.len, ._highest = highest, .topThree = [_]i32{ highest, secondHighest, thirdHighest }, .topThreeLength = @min(scores.len, 3) };
    }

    pub fn latest(self: *const HighScores) ?i32 {
        if (self.size == 0) {
            return null;
        }

        return self._scores[self.size - 1];
    }

    pub fn personalBest(self: *const HighScores) ?i32 {
        if (self.size == 0) {
            return null;
        }

        return self._highest;
    }

    pub fn personalTopThree(self: *const HighScores) []const i32 {
        return self.topThree[0..self.topThreeLength];
    }
};
