
command! TeXmake
            \ !tectonic --synctex --keep-logs --keep-intermediates %
command! TeXbib !bibtex *.aux 

fun! Make_tex()
    TeXmake
    TeXbib
    TeXmake
endf

command! TeXall call Make_tex()
