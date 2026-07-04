const std = @import("std");

pub fn isPangram(str: []const u8) bool {
    
    var allLetters: [26]bool = @splat(false); 
    for (str) |ch| {
        if (!std.ascii.isAlphabetic(ch)) {
            continue;
        }
        const lowerCh: u8 = std.ascii.toLower(ch);
        
        allLetters[lowerCh - 'a'] = true;
    }

    for (allLetters) |letter| {
        if (!letter) {
            return false;
        }
    }

return true;
}
