const std = @import("std");
const mem = std.mem;

pub const ColorBand = enum { black, brown, red, orange, yellow, green, blue, violet, grey, white };

pub fn label(allocator: mem.Allocator, colors: []const ColorBand) mem.Allocator.Error![]u8 {
    if (colors.len == 0) {
        return try std.fmt.allocPrint(allocator, "0 ohms", .{});
    }
    if (colors.len == 1) {
        return try std.fmt.allocPrint(allocator, "{d} ohms", .{@intFromEnum(colors[0])});
    }

    const color1: usize = @intFromEnum(colors[0]);
    const color2: usize = @intFromEnum(colors[1]);
    const color3: usize = @intFromEnum(colors[2]);

    const totalNumber: usize = (color1 * 10 + color2) * std.math.pow(usize, 10, color3);

    if (totalNumber == 0) {
        return try std.fmt.allocPrint(allocator, "0 ohms", .{});
    }

    const GIGA: usize = 1000000000;
    const MEGA: usize = 1000000;
    const KILO: usize = 1000;

    if (totalNumber >= GIGA) {
        const totalGigaNumber = totalNumber / GIGA;
        if (totalNumber % GIGA == 0) {
            return try std.fmt.allocPrint(allocator, "{d} gigaohms", .{totalGigaNumber});
        } else {
            return try std.fmt.allocPrint(allocator, "{d} gigaohms", .{@as(f64, @floatFromInt(totalNumber)) / @as(f64, @floatFromInt(GIGA))});
        }
    } else if (totalNumber >= MEGA) {
        const totalMegaNumber = totalNumber / MEGA;
        if (totalNumber % MEGA == 0) {
            return try std.fmt.allocPrint(allocator, "{d} megaohms", .{totalMegaNumber});
        } else {
            return try std.fmt.allocPrint(allocator, "{d} megaohms", .{@as(f64, @floatFromInt(totalNumber)) / @as(f64, @floatFromInt(MEGA))});
        }
    } else if (totalNumber >= KILO) {
        const totalKiloNumber = totalNumber / KILO;
        if (totalKiloNumber % KILO == 0) {
            return try std.fmt.allocPrint(allocator, "{d} kiloohms", .{totalKiloNumber});
        } else {
            return try std.fmt.allocPrint(allocator, "{d} kiloohms", .{@as(f64, @floatFromInt(totalNumber)) / @as(f64, @floatFromInt(KILO))});
        }
    }

    return try std.fmt.allocPrint(allocator, "{d} ohms", .{totalNumber});
}
