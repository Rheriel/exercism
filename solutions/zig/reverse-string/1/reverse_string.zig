/// Writes a reversed copy of `s` to `buffer`.
pub fn reverse(buffer: []u8, s: []const u8) []u8 {
  
for (0..s.len) |idx| {
    buffer[idx] = s[s.len - 1 - idx];
} 
    return buffer[0..s.len];
}
