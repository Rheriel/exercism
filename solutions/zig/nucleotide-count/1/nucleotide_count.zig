pub const NucleotideError = error{Invalid};

pub const Counts = struct {
    a: u32,
    c: u32,
    g: u32,
    t: u32,
};

pub fn countNucleotides(s: []const u8) NucleotideError!Counts {
    var counts = Counts { .a = 0, .c = 0, .g = 0, .t = 0 };
    for (s) |ch| {
       if (ch == 'A') {
         counts.a = counts.a + 1;  
       } else if (ch == 'C') {
           counts.c = counts.c + 1; 
       } else if (ch == 'G') {
           counts.g = counts.g + 1; 
       } else if (ch == 'T') {
           counts.t = counts.t + 1; 
       } else {
           return NucleotideError.Invalid; 
       }
    }
    return counts;       
}
