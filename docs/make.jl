include("../src/ModularFormsModuloTwo.jl")
using Documenter
using DocumenterLaTeX
using .ModularFormsModuloTwo

makedocs(
    sitename="ModularFormsModuloTwo.jl",
    authors = "Paul Dubois",
    build = "",
    )

# makedocs(
#     sitename="ModularFormsModuloTwo.jl",
#     authors = "Paul Dubois",
#     build = "pdf",
#     format = DocumenterLaTeX.LaTeX(),
#     )

# deploydocs(
#    root = "",
#    repo = "github.com/pauldubois98/ModularFormsModuloTwo.jl.git",
#    )


