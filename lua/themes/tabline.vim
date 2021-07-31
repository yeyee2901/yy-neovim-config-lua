" Choose separator of your choice. And make sure your
" terminal emulator can render it.
let s:separator = '  '

" To get buffer name and attach it to the tab
function SimpleTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let name = bufname(buflist[winnr-1])
  let label = fnamemodify(name, ':t')

  return len(label) == 0 ? 'No-Name' : label
endfunction


" Iterate through all tabpage and give name
" according to SimpleTabLabel ret val
function SimpleTabline()
  let tabline = ''

  " Determine which tab is active.
  " If yes change the scheme to `Sel` (highlighted)
  for i in range(tabpagenr('$'))
    if i + 1 == tabpagenr()
      let tabline .= '%#TabLineSel#'
    else
      let tabline .= '%#TabLine#'
    endif

    " Set tab page number
    let tabline .= '%' . (i + 1) . 'T'

    " get label
    let tabline .= ' %{SimpleTabLabel(' . (i + 1) . ')} '

    " Display how many windows are open in that tab
    if i+1 == tabpagenr()
        let tabline .= '%#TabLineSel#'
    endif
    let tabline .= s:separator
    let tabline .= '%#TabLineFill#'
  endfor

  " Right alignment
  if tabpagenr('$') > 1
    let tabline .= '%=%#TabLine#%999X'
  endif

  return tabline
endfunction

set tabline=%!SimpleTabline()
highlight TabLineSel guibg=#87AFAF guifg=#000000
highlight TabLineFill guibg=#282c34
