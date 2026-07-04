pub const HighScores = struct {
    _scores: []const i32,
    topThree: [3]i32,

    pub fn init(scores: []const i32) HighScores {
        if (scores.len == 0) {
            return HighScores{ ._scores = scores, .topThree = [_]i32{ 0, 0, 0 } };
        }

        var topThree: [3]i32 = undefined;

        if (scores.len == 1) {
            topThree = [_]i32{ scores[0], 0, 0 };
        } else if (scores.len == 2) {
            const first = @max(scores[0], scores[1]);
            const second = @min(scores[0], scores[1]);
            topThree = [_]i32{ first, second, 0 };
        } else {
            var highest: i32 = 0;
            var secondHighest: i32 = 0;
            var thirdHighest: i32 = 0;

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

            topThree = [_]i32{ highest, secondHighest, thirdHighest };
        }

        return HighScores{ ._scores = scores, .topThree = topThree };
    }

    pub fn latest(self: *const HighScores) ?i32 {
        if (self._scores.len == 0) {
            return null;
        }

        return self._scores[self._scores.len - 1];
    }

    pub fn personalBest(self: *const HighScores) ?i32 {
        if (self._scores.len == 0) {
            return null;
        }

        var highest = self._scores[0];

        for (self._scores) |score| {
            if (highest < score) {
                highest = score;
            }
        }

        return highest;
    }

    pub fn personalTopThree(self: *const HighScores) []const i32 {
        const topLength = @min(self._scores.len, 3);

        return self.topThree[0..topLength];
    }
};
