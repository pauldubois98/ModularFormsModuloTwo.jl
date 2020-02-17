"""
Routines to change between representation of modular forms modulo two.
Uses a list of pre-calculated powers of delta to speed up the calculations.

Note that for speed purposes, no checks of any kind are made.
The user should make sure that the form may be written in terms for form from the precalculated variable.
"""





"""
    to_q(df, precalculated)

Compute the q-series represenstaion of f (using precalculated).

# Example
```julia-repl
julia> precalculated = loadFormListBinary(10^2, 10^6)
julia> df = Delta_k(5)
julia> disp(df)
MF mod 2 (coef to 100) - 00000100000000000000000000000000000000000000000000...

julia> f = to_q(df, precalculated)
julia> disp(f)
MF mod 2 (coef to 1000000) - 00000100000001000000000000000100000001000000010000...

```
"""
function to_q(df::ModularForm, precalculated::ModularFormOrNothingList, LENGTH::Int=length(precalculated[2]))::ModularForm
    f = zero(LENGTH)
    for k in df.nzind
        f += precalculated[k]
    end
    return f
end

"""
    to_Δ(f, precalculated)
    -- or --
    to_delta(f, precalculated)

Compute the Δ-series represenstaion of f (using precalculated).

# Example
```julia-repl
julia> precalculated = loadFormListBinary(10^2, 10^6)
julia> f = delta(10^6) + delta_k(3, 10^6)
julia> disp(f)
MF mod 2 (coef to 1000000) - 01010000010100000001000001000000000000000001000001...

julia> df = MFmod2.to_delta(f, precalculated)
100-element SparseArrays.SparseVector{Int8,Int64} with 2 stored entries:
  [2  ]  =  1
  [4  ]  =  1

julia> disp(df)
MF mod 2 (coef to 100) - 01010000000000000000000000000000000000000000000000...
```
"""
function to_Δ(mf::ModularForm, precalculated::ModularFormOrNothingList, LENGTH::Int=length(precalculated))::ModularForm
    f = deepcopy(mf)
    k = 1
    df = zero(LENGTH)
    for k in 1:2:LENGTH
        if f[k+1]==1
            #there is Δ^k if f
            df[k+1] = 1
            f += precalculated[k+1]
        else
            #there is no Δ^k if f
            #pass
        end
        k += 1
    end
    return df
end
to_delta = to_Δ

