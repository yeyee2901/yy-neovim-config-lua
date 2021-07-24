local M = {}

-- Tokyonight theme
M.set_tokyonight = function (variant)
  if variant == nil then
    variant = "night"
  end
  vim.g.tokyonight_style = variant
  vim.cmd('colorscheme tokyonight')
  vim.g.airline_theme = 'base16_dracula'
end

-- CodeDark theme (VSCode)
M.set_codedark = function ()
  vim.cmd('colorscheme codedark')
  vim.g.air_line_theme = 'codedark'
  vim.cmd('highlight Normal guibg=#1e1e1e')
end

-- Ayu Theme
M.set_ayu = function (variant)
  if variant == nil then
    variant = "mirage"
  end
  vim.cmd('let ayucolor = "'..variant..'"')
  vim.cmd('colorscheme ayu')
end

-- Monokai        (Sublime Text)
M.set_monokai = function ()
  require('monokai')
  vim.cmd('colorscheme monokai_pro')
  vim.opt.termguicolors = true
  vim.g.airline_theme = 'base16_monokai'
  vim.cmd('highlight Normal guibg=#2e2e2e')
end

-- Aurora theme
M.set_aurora = function()
  vim.cmd('colorscheme aurora')
  vim.g.airline_theme = 'base16_dracula'
end

-- Rainbow bracket colorizer
vim.g.rainbow_active = true

-- Vim colorizer
require('colorizer').setup()

-- Vim - Airline
vim.g['airline#extensions#tabline#enabled']       = true
vim.g['airline#extensions#tabline#formatter']     = 'unique_tail'
vim.g['airline#extensions#tabline#show_tabs']     = true
vim.g['airline#extensions#tabline#show_buffers']  = false
vim.g['airline#extensions#tabline#show_splits']   = false

-- Cursor Line coloring
vim.cmd('autocmd BufWinEnter,InsertLeave * highlight CursorLine guibg=#353b47')
vim.cmd('autocmd InsertEnter * highlight CursorLine guibg=#15181f')

return M
