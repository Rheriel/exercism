const std = @import("std");
const mem = std.mem;

pub fn toRna(allocator: mem.Allocator, dna: []const u8) mem.Allocator.Error![]const u8 {
    var rnaList: std.ArrayList(u8) = .empty; 
 defer rnaList.deinit(allocator);
for (dna) |nucleotide| {
       const rnaNucleotide: u8 = switch (nucleotide) {
           'G' => 'C',
            'C' => 'G',
            'T' => 'A',
            'A' => 'U',
            else => undefined,
       };

        try rnaList.append(allocator, rnaNucleotide);
    }

    const rna = try rnaList.toOwnedSlice(allocator);

return rna;
}
