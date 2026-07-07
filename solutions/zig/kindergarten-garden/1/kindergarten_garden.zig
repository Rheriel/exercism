const std = @import("std");

pub const Plant = enum {
    clover,
    grass,
    radishes,
    violets,
};

pub fn plants(diagram: []const u8, student: []const u8) [4]Plant {
    var rows = std.mem.splitScalar(u8, diagram, '\n');
    var plantArray: [4]Plant = [_]Plant{ .clover, .clover, .clover, .clover };

    if (std.ascii.eqlIgnoreCase("Alice", student)) {
        populatePlants(&plantArray, &rows, 0);
    } else if (std.ascii.eqlIgnoreCase("Bob", student)) {
        populatePlants(&plantArray, &rows, 2);
    } else if (std.ascii.eqlIgnoreCase("Charlie", student)) {
        populatePlants(&plantArray, &rows, 4);
    } else if (std.ascii.eqlIgnoreCase("David", student)) {
        populatePlants(&plantArray, &rows, 6);
    } else if (std.ascii.eqlIgnoreCase("Eve", student)) {
        populatePlants(&plantArray, &rows, 8);
    } else if (std.ascii.eqlIgnoreCase("Fred", student)) {
        populatePlants(&plantArray, &rows, 10);
    } else if (std.ascii.eqlIgnoreCase("Ginny", student)) {
        populatePlants(&plantArray, &rows, 12);
    } else if (std.ascii.eqlIgnoreCase("Harriet", student)) {
        populatePlants(&plantArray, &rows, 14);
    } else if (std.ascii.eqlIgnoreCase("Ileana", student)) {
        populatePlants(&plantArray, &rows, 16);
    } else if (std.ascii.eqlIgnoreCase("Joseph", student)) {
        populatePlants(&plantArray, &rows, 18);
    } else if (std.ascii.eqlIgnoreCase("Kincaid", student)) {
        populatePlants(&plantArray, &rows, 20);
    } else if (std.ascii.eqlIgnoreCase("Larry", student)) {
        populatePlants(&plantArray, &rows, 22);
    }
    return plantArray;
}

pub fn populatePlants(plantArray: *[4]Plant, rows: *std.mem.SplitIterator(u8, .scalar), fromIndex: usize) void {
    var index: usize = 0;
    while (rows.next()) |row| {
        plantArray[index] = toPlant(row[fromIndex]);
        index += 1;
        plantArray[index] = toPlant(row[fromIndex + 1]);
        index += 1;
    }
}

pub fn toPlant(plant: u8) Plant {
    return switch (plant) {
        'G' => .grass,
        'C' => .clover,
        'R' => .radishes,
        'V' => .violets,
        else => unreachable,
    };
}
