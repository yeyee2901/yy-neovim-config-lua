local M = {}

-- Default
M.lualine_set_themes = "nightfly"

-- Tokyonight theme
M.set_tokyonight = function (variant)
  if variant == nil then
    variant = "night"
  end
  vim.g.tokyonight_style = variant
  vim.cmd('colorscheme tokyonight')
end

-- CodeDark theme (VSCode)
M.set_codedark = function ()
  vim.cmd('colorscheme codedark')
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
  vim.cmd('highlight Normal guibg=#2e2e2e')
end

-- Aurora theme by ray X, strong but can hurt
M.set_aurora = function()
  vim.cmd('colorscheme aurora')
end

-- Gruvbuddy by TJDevries, calming for some reason
M.set_custom = function ()
  require('colorbuddy').setup()
  require('colorbuddy').colorscheme('gruvbuddy')
end

-- Vim colorizer
require('colorizer').setup()

-- Lualine
require('themes.lualine')

-- Cursor Line coloring
vim.cmd('autocmd BufWinEnter,InsertLeave * highlight CursorLine guibg=#353b47')
vim.cmd('autocmd InsertEnter * highlight CursorLine guibg=#15181f')

return M
