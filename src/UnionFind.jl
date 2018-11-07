module UnionFind
import Base: union!

export UnionFinder, CompressedFinder
export reset!, union!, find!, size!, find, groups

include("UnionFinder.jl")
include("CompressedFinder.jl")

end
