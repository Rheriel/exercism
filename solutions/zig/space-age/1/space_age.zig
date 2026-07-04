const std = @import("std");

// | Planet  | Orbital period in Earth Years |
// | ------- | ----------------------------- |
// | Mercury | 0.2408467                     |
// | Venus   | 0.61519726                    |
// | Earth   | 1.0                           |
// | Mars    | 1.8808158                     |
// | Jupiter | 11.862615                     |
// | Saturn  | 29.447498                     |
// | Uranus  | 84.016846                     |
// | Neptune | 164.79132                     |

pub const Planet = enum {
    mercury,
    venus,
    earth,
    mars,
    jupiter,
    saturn,
    uranus,
    neptune,

    pub fn age(self: Planet, seconds: usize) f64 {
        const earth_seconds: f64 = 31557600.0;
        const float_seconds: f64 = @floatFromInt(seconds);

        const age_in_planet: f64 = switch (self) {
            .mercury => (float_seconds / earth_seconds) / 0.2408467,
            .venus => (float_seconds / earth_seconds) / 0.61519726,
            .earth => (float_seconds / earth_seconds) / 1.0,
            .mars => (float_seconds / earth_seconds) / 1.8808158,
            .jupiter => (float_seconds / earth_seconds) / 11.862615,
            .saturn => (float_seconds / earth_seconds) / 29.47498,
            .uranus => (float_seconds / earth_seconds) / 84.16846,
            .neptune => (float_seconds / earth_seconds) / 164.9132,
        };

        std.debug.print("Seconds: {} equals Age on {s}: {}\n", .{ seconds, @tagName(self), age_in_planet });

        return age_in_planet;
    }
};
