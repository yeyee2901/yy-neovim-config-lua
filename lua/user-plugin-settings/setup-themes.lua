-- Tokyonight theme
--vim.g.tokyonight_style = 'night'
--vim.cmd('colorscheme tokyonight')
--vim.g.airline_theme = 'base16_dracula'

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
