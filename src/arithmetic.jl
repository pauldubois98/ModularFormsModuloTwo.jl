using SparseArrays: SparseVector, spzeros, dropzeros!, sparse
import Base: +, *, ^

"""
We can represent a modular forms mod 2 by it's coefficients as a polynomial in q or Δ.
The routines in this file are made for q-series.
Modular forms modulo 2 have coefficients in q-series being 0 most of the times, and 1 otherwise.
Thus, we will represent them as sparse 1-dimensional arrays (sparse vectors) of type SparseVector{Int8,Int}
"""





### ARITHMETIC OPERATIONS of modular forms modulo 2
"""
    +(f1, f2)

Compute the addition of two modular forms (with mathematical accuracy).

# Example
```julia-repl
[f1 &f2 are modular forms mod 2]
julia> f1+f2
1000-element SparseVector{Int8,Int64} with 27 stored entries:
  [...]
```
"""
function +(f1::SparseVector{Int8,Int}, f2::SparseVector{Int8,Int})::SparseVector{Int8,Int}
    m = min(f1.n, f2.n)
    f = truncate(f1, m)
    for n in f2.nzind
        if n<=m
            f[n] = 1-f[n]
        end
    end
    # f = spzeros(Int8, n)
    # for i = 1:n
    #     f[i] = f1[i] ⊻ f2[i] # ⊻=xor
    # end
    return dropzeros!(f)
end

"""
    *(f1, f2)

Compute the multiplication of two modular forms (with mathematical accuracy).

# Example
```julia-repl
[f1 &f2 are modular forms mod 2]
julia> f1*f2
1000-element SparseVector{Int8,Int64} with 86 stored entries:
  [...]
```
"""
function *(f1::SparseVector{Int8,Int}, f2::SparseVector{Int8,Int})::SparseVector{Int8,Int}
    n::Int = min(f1.n, f2.n)
    f = spzeros(Int8, n)
    for n in f1.nzind
        for m in f2.nzind
            if n+m-1 <= f.n
                f[n+m-1]=1-f[n+m-1]
            else
                break
            end
        end
    end
    return dropzeros!(f)
end

"""
    sq(f)

Compute the square of a modular form (with mathematical accuracy).

This is a much more effcient method then computing the square with multiplication.
sq(f) is (much) more effcient then f*f, time wise and memory wise.

# Example
```julia-repl
[f is a modular form mod 2]
julia> @time f*f
  0.169466 seconds (37 allocations: 1.127 MiB)

julia> @time sq(f)
  0.000020 seconds (23 allocations: 9.875 KiB)
```
"""
function sq(f::SparseVector{Int8,Int})::SparseVector{Int8,Int}
    f_sq = spzeros(Int8, f.n)
    for n in f.nzind
        if 2n-1 <= f_sq.n
            f_sq[2n-1] = 1
        end
    end
    return f_sq
end

"""
    ^(f, k)

Compute f^k (with mathematical accuracy).

# Example
```julia-repl
[f is a modular form mod 2]
julia> f^5
1000-element SparseVector{Int8,Int64} with 75 stored entries:
  [...]
```
"""
function ^(f::SparseVector{Int8,Int}, k::Int)::SparseVector{Int8,Int}
    # we use binary decomposition of k for effciency
    f_pow=one(f.n)
    while k != 0
        if k&1 != 0
            f_pow *= f
        end
        f = sq(f)
        k >>= 1
    end
    return f_pow
end



### TRUNCATION of modular forms modulo 2
"""
    truncate(f, LENGTH)

Truncate f to the LENGTH first coefficients with no error.

# Example
```julia-repl
[f is a modular form mod 2]
julia> f
1000-element SparseVector{Int8,Int64} with 16 stored entries:
  [...]

julia> truncate(f, 100)
100-element SparseVector{Int8,Int64} with 5 stored entries:
  [...]
```
"""
function truncate(f::SparseVector{Int8,Int}, LENGTH::Int=10^3)::SparseVector{Int8,Int}
    if f.n>LENGTH
        return f[1:LENGTH]
    else
        return f
    end
end

"""
    truncate(f1, f2[, LENGTH])

Truncate f1 and f2 to LENGTH first coefficients with no error.
Truncate to min length of f1 & f2 if LENGTH = -1.

# Example
```julia-repl
[f1 &f2 are modular forms mod 2]
julia> disp(f1)
MF mod 2 (coef to 1000) - 01000000010000000000000001000000000000000000000001...
julia> disp(f2)
MF mod 2 (coef to 100) - 01000000010000000000000001000000000000000000000001...

julia> f1, f2 = truncate(f1,f2)

julia> disp(f1)
MF mod 2 (coef to 100) - 01000000010000000000000001000000000000000000000001...
julia> disp(f2)
MF mod 2 (coef to 100) - 01000000010000000000000001000000000000000000000001...
```
"""
function truncate(f1::SparseVector{Int8,Int}, f2::SparseVector{Int8,Int}, LENGTH::Int=-1)::Tuple{SparseVector{Int8,Int},SparseVector{Int8,Int}}
    if LENGTH == -1
        if f1.n>f2.n
            return (f1[1:f2.n], f2)
        elseif f1.n==f2.n
            return (f1, f2)
        else
            return (f1, f2[1:f1.n])
        end
    else
        n=min(LENGTH, f1.n, f2.n)
        return (f1[1:n], f2[1:n])
    end
end



### EQUALITY up to size
"""
    eq(f1, f2)

Up to maximum coefficient known for both f1 and f2, tell equality.
"""
function eq(f1::SparseVector{Int8,Int}, f2::SparseVector{Int8,Int})::Bool
    f1, f2 = truncate(f1, f2)
    return f1==f2
end
