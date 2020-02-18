include("../src/ModularFormsModuloTwo.jl")
using Documenter
using DocumenterLaTeX
using .ModularFormsModuloTwo

makedocs(
    sitename="ModularFormsModuloTwo.jl",
    authors = "Paul Dubois",
    #format = DocumenterLaTeX.LaTeX(),
    )

deploydocs(
    root   = "<current-directory>",
    repo = "github.com/pauldubois98/ModularFormsModuloTwo.jl.git",
    )


