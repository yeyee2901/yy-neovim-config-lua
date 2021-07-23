-- Tokyonight theme
--vim.g.tokyonight_style = 'night'
--vim.cmd('colorscheme tokyonight')
--vim.g.airline_theme = 'base16_dracula'

-- CodeDark theme (VSCode)
--vim.cmd('colorscheme codedark')
--vim.g.air_line_theme = 'codedark'

-- Ayu Theme
--vim.cmd('let ayucolor = "mirage"')
--vim.cmd('colorscheme ayu')

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
vim.g['airline#extensions#tabline#enabled']       = true
vim.g['airline#extensions#tabline#formatter']     = 'unique_tail'
vim.g['airline#extensions#tabline#show_tabs']     = true
vim.g['airline#extensions#tabline#show_buffers']  = false
vim.g['airline#extensions#tabline#show_splits']   = false
