UnionFind.jl
============

`UnionFind.jl` is a light-weight library for identifying groups of nodes in
undirected graphs. It is written in [Julia 0.2](http://julialang.org/). It is
currently in version 0.0.1.

# Installation

`UnionFind.jl` is not a member of Julia's registered package list. An
alternative implementation of the chief underlying data structure,
the disjoint set, can be found in
[DataStructures.jl](https://github.com/JuliaLang/DataStructures.jl).

# API

This library exports two types, `UnionFinder`, and `CompressedFinder`.

## UnionFinder

`UnionFinder{T <: Integer}` is a graph representation which allows for the 
dynamic addition of edges as well as the identification of groups.

### Constructors

*  `UnionFinder{T <: Integer}(nodes :: T) :: UnionFinder{T}` returns a
   `UnionFinder` instance representing a graph of `nodes` unconnected nodes.
   Each node will be indexed by a unique integer of type `T` in the inclusive
   range [`1`, `nodes`]. If `nodes` is non-positive, an `ArgumentError` will
   be thrown.

### Methods

The identification of groups is handled lazily, meaning that all non-trivial
methods will modify the contents of the target `UnionFinder` instance.

*  `union!{T <: Integer}(uf :: UnionFinder{T}, u :: T, v :: T)` adds an edge
   to `uf` connecting node `u` to node `v`. If either `u` or `v` is
   non-positive or greater than `nodes`, a `BoundsError` will be thrown.
*  `union!{T <: Integer}(uf :: UnionFinder{T}, edges :: Array{(T, T)})` adds
   each edges within `edges` to `uf`. This method obeys the same bounds
   restrictions as the single edge `union!` method.
*  `union!{T <: Integer}(uf :: UnionFinder{T}, us :: Array{T}, vs :: Array{T})`
   adds edges of the form (`us[i]`, `vs[i]`) to `uf`. This method obeys the
   same bounds restrictions as the single edge `union!` method.
*  `find!{T <: Integer}(uf :: UnionFinder{T}, node :: T) :: T` returns the
   unique id of the node group containing `node`.
*  `size!{T <: Integer}(uf :: UnionFinder{T}, node :: T) :: T` returns the
   number of nodes in the group containing `node`.
*  `reset!(uf :: UnionFinder)` disconnects all nodes within `uf`, allowing for
   a new set of edges to be analyzed without making further allocations.
*  `length(uf :: UnionFinder) :: Int` returns the number of nodes within `uf`.

### Fields

The fields of `UnionFinder` instances should not be accesed by user-level code.

## CompressedFinder

`CompressedFinder{T <: Integer}`

### Constructors

*  `CompressedFinder{T <: Integer}(uf :: UnionFinder) :: CompressedFinder{T}`
   returns a `CompressedFinder` instance corresponding to the same groups
   represented by 

### Methods

*  `find{T <: Integer}(cf :: CompressedFinder{T}, node :: T) :: T` returns the
   unique id of the group containing `node`. If `node` is non-positive or
   is larger than the number of nodes in `cf`, a `BoundsError` is thrown.
*  `groups{T <: Integer}(cf :: CompressedFinder{T}) :: T` returns the number
   of groups within `cf`.

### Fields

*  `ids :: Array{T}` is an array mapping node indices to the group which
   contains them.
*  `groups :: T` is the number of groups in the `CompressedFinder` instance.

# Examples

## Floodfill

Under construction.

## Swendsen-Wang

Under construction.

## Kruskal

Under construction.

# Performance

The time required for 

# Project Status

The current API of `UnionFind.jl` should not be considered stable. Current work
will be focused on 

This library will not reach version 1.0.0 until version 1 of Julia is released.