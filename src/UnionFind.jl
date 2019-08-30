module UnionFind
export UnionFinder, CompressedFinder
export reset!, union!, find!, size!, find, groups

import Base: union!

include("UnionFinder.jl")
include("CompressedFinder.jl")

end
