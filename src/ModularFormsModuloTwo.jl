module ModularFormsModuloTwo
    """
    A standard module for computations on modular forms modulo two.
    """

    using SparseArrays: SparseVector, spzeros, dropzeros!, sparse
    import Base: +, *, ^

    include("arithmetic.jl")
    include("generators.jl")
    include("HeckeOperator.jl")





end