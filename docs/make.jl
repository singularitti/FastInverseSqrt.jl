using FastInverseSqrt
using Documenter

DocMeta.setdocmeta!(FastInverseSqrt, :DocTestSetup, :(using FastInverseSqrt); recursive=true)

makedocs(;
    modules=[FastInverseSqrt],
    authors="Reno <singularitti@outlook.com>",
    repo="https://github.com/singularitti/FastInverseSqrt.jl/blob/{commit}{path}#{line}",
    sitename="FastInverseSqrt.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://singularitti.github.io/FastInverseSqrt.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/singularitti/FastInverseSqrt.jl",
    devbranch="main",
)
