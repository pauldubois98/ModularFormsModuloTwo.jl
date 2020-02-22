include("../src/ModularFormsModuloTwo.jl")
using Documenter
using DocumenterLaTeX
using .ModularFormsModuloTwo

makedocs(
    sitename="ModularFormsModuloTwo.jl",
    authors = "Paul Dubois",
    build = "",
    pages = [
        "Home" => "index.md",
        "Operations" => [
            "standard.md", 
            "advanced.md",
            ],
        "Coputation Storage" => "data.md",
    ]
    )


## PDF doc (not working)
makedocs(
    sitename="ModularFormsModuloTwo.jl",
    authors = "Paul Dubois",
    build = "pdf",
    format = DocumenterLaTeX.LaTeX(),
    pages = [
        "standard.md", 
        "advanced.md",
        "data.md",
    ]
    )
