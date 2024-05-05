using DelimitedFiles
using REPL

writedlm(
    "latex_symbols.txt",
    Dict(REPL.REPLCompletions.latex_symbols..., REPL.REPLCompletions.emoji_symbols...)
)
