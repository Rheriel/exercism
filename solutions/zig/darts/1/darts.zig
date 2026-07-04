const std = @import("std");

pub const Coordinate = struct {
    x: f32,
    y: f32,

    pub fn init(x_coord: f32, y_coord: f32) Coordinate {
        return Coordinate{
            .x = if (x_coord < 0.0) x_coord * -1.0 else x_coord,
            .y = if (y_coord < 0.0) y_coord * -1.0 else y_coord,
        };
    }
    pub fn score(self: Coordinate) usize {
        if (isOutsideTarget(self)) {
            return 0;
        } else if (isWithinInnerCircle(self)) {
            return 10;
        } else if (isWithinMiddleCircle(self)) {
            return 5;
        } else {
            return 1;
        }
    }

    pub fn isOutsideTarget(self: Coordinate) bool {
        return getDistanceFromCenter(self) > 10.0;
    }

    // To know if the dart is inside a circle, calculate the distance from the center
    // if the distance is less than or equal to the radius, then the dart is inside the circle
    pub fn isWithinInnerCircle(self: Coordinate) bool {
        return getDistanceFromCenter(self) <= 1.0;
    }

    pub fn isWithinMiddleCircle(self: Coordinate) bool {
        return getDistanceFromCenter(self) <= 5.0;
    }

    pub fn getDistanceFromCenter(self: Coordinate) f32 {
        return std.math.sqrt(std.math.pow(f32, self.x, 2) + std.math.pow(f32, self.y, 2));
    }
};
