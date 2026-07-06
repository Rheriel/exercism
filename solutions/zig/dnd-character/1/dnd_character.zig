const std = @import("std");

pub fn modifier(score: i8) i8 {
    return @divFloor((score - 10), 2);
}

pub fn ability() i8 {
    return rollDie();
}

pub const Character = struct {
    strength: i8,
    dexterity: i8,
    constitution: i8,
    intelligence: i8,
    wisdom: i8,
    charisma: i8,
    hitpoints: i8,

    pub fn init() Character {
        const constitution: i8 = ability();
        return Character{
            .strength = ability(),
            .dexterity = ability(),
            .constitution = constitution,
            .intelligence = ability(),
            .wisdom = ability(),
            .charisma = ability(),
            .hitpoints = 10 + modifier(constitution),
        };
    }
};

pub fn rollDie() i8 {
    var prng: std.Random.DefaultPrng = .init(blk: {
        var seed: u64 = undefined;
        std.posix.getrandom(std.mem.asBytes(&seed)) catch unreachable;
        break :blk seed;
    });

    const rand = prng.random();

    const dice1 = rand.intRangeAtMost(i8, 1, 6);
    const dice2 = rand.intRangeAtMost(i8, 1, 6);
    const dice3 = rand.intRangeAtMost(i8, 1, 6);
    const dice4 = rand.intRangeAtMost(i8, 1, 6);

    var die: [4]i8 = .{ dice1, dice2, dice3, dice4 };

    std.mem.sort(i8, &die, {}, comptime std.sort.desc(i8));

    return die[0] + die[1] + die[2];
}
