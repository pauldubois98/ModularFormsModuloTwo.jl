module ModularFormsModuloTwo
    """
    A standard module for computations on modular forms modulo two.
    """

    using SparseArrays: SparseVector, spzeros, dropzeros!, sparse
    import Base: +, *, ^

    """
    disp(f[, maxi])

    Display details of f, a modular forms mod 2.

    Displays what type of data the object id,  up to which coefficient is the form known.
    Then displays the first few coefficients. Coefficients are displayed until maxi (50 by default).

    # Example
    ```julia-repl
    [f is a modular form mod 2]
    julia> disp(f)
    MF mod 2 (coef to 100) - 01000000010000000000000001000000000000000000000001...
    ```
    """
    function disp(f::SparseVector{Int8,Int}, maxi::Int = 50)
        print("MF mod 2 (coef to " * string(f.n) * ") - ")
        for i = 1:min(maxi, f.n)
            print(f[i])
        end
        if maxi<f.n
            println("...")
        else
            println()
        end
    end

    ModularForm = SparseVector{Int8,Int}
    ModularFormOrNothing = Union{SparseVector{Int8,Int}
    ModularFormList = Array{SparseVector{Int8,Int},1}
    ModularFormOrNothingList = Array{Union{SparseVector{Int8,Int}, Nothing},1}

    include("arithmetic.jl")
    include("generators.jl")
    include("HeckeOperator.jl")





end