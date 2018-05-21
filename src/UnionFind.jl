__precompile__()
module UnionFind
import Base: find, union!

export UnionFinder, CompressedFinder
export reset!, union!, find!, size!, find, groups

include("UnionFinder.jl")
include("CompressedFinder.jl")

end
