-- Tokyonight theme
--vim.g.tokyonight_style = 'night'
--vim.cmd('colorscheme tokyonight')
--vim.g.airline_theme = 'base16_dracula'

-- CodeDark theme (VSCode)
--vim.cmd('colorscheme codedark')
--vim.g.air_line_theme = 'codedark'

-- Monokai        (Sublime Text)
--require('monokai')
--vim.cmd('colorscheme monokai')
--vim.opt.background = 'dark'


-- Aurora theme
vim.cmd('colorscheme aurora')
vim.g.airline_theme = 'base16_dracula'



-- Rainbow bracket colorizer
vim.g.rainbow_active = true

-- Vim - Airline
vim.cmd('let g:airline#extensions#tabline#enabled = 1')
vim.cmd('let g:airline#extensions#tabline#formatter = "unique_tail"')
vim.cmd('let g:airline#extensions#tabline#show_tabs = 1')
vim.cmd('let g:airline#extensions#tabline#show_buffers = 0')
vim.cmd('let g:airline#extensions#tabline#show_splits = 0')
