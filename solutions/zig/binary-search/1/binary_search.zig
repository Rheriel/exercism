const std = @import("std");

pub fn binarySearch(comptime T: type, target: T, items: []const T) ?usize {
    var left: usize = 0;
    var right: usize = items.len;

    var mid: usize = left + (right - left) / 2;

    while (left < right) {
        mid = left + (right - left) / 2;

        if (items[mid] == target) {
            return mid;
        } else if (items[mid] < target) {
            left = mid + 1;
        } else {
            right = mid;
        }
    }

    return null;
}
