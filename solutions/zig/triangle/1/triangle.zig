const std = @import("std");

pub const TriangleError = error{
    Invalid,
};

pub const Triangle = struct {
    aSide: f64,
    bSide: f64,
    cSide: f64,

    pub fn init(a: f64, b: f64, c: f64) TriangleError!Triangle {
        if (a <= 0.0 or b <= 0.0 or c <= 0.0) {
            return TriangleError.Invalid;
        }

        if (a + b <= c or a + c <= b or b + c <= a) {
            return TriangleError.Invalid;
        }

        return Triangle{
            .aSide = a,
            .bSide = b,
            .cSide = c,
        };
    }

    pub fn isEquilateral(self: Triangle) bool {
        return self.aSide == self.bSide and self.bSide == self.cSide;
    }

    pub fn isIsosceles(self: Triangle) bool {
        return (self.aSide == self.bSide and self.bSide != self.cSide) or
            (self.aSide == self.cSide and self.cSide != self.bSide) or
            (self.bSide == self.cSide and self.cSide != self.aSide);
    }

    pub fn isScalene(self: Triangle) bool {
        return self.aSide != self.bSide and self.bSide != self.cSide and self.aSide != self.cSide;
    }
};
