local M = {}

-- Dashboard
require('themes.startify')

-- Lualine
local lualine = require('themes.lualine')

-- Default
M.lualine_set_themes = "nightfly"

-- Tokyonight theme
M.set_tokyonight = function (variant)
  vim.g.tokyonight_style = variant
  vim.cmd('colorscheme tokyonight')
  lualine.setup_lualine('tokyonight')
end

-- CodeDark theme (VSCode)
M.set_codedark = function ()
  vim.cmd('colorscheme codedark')
  lualine.setup_lualine('onedark')
end

-- Ayu Theme
M.set_ayu = function (variant)
  vim.cmd('let ayucolor = "'..variant..'"')
  vim.cmd('colorscheme ayu')
  lualine.setup_lualine('ayu_'..variant)
end

-- Monokai (Sublime Text)
M.set_monokai = function ()
  require('monokai')
  vim.cmd('colorscheme monokai_pro')
  vim.opt.termguicolors = true
  lualine.setup_lualine('molokai')
end

-- Aurora theme by ray X, strong but can hurt eyes
M.set_aurora = function()
  vim.cmd('colorscheme aurora')
  lualine.setup_lualine('palenight')
end

-- Gruvbuddy by TJDevries, calming for some reason
M.set_custom = function ()
  require('colorbuddy').setup()
  require('colorbuddy').colorscheme('gruvbuddy')
  lualine.setup_lualine('seoul256')
end

-- The almighty gruvbox
M.set_gruvbox = function ()
  -- Options has to set before setting colorscheme
  local gruv_opts = {
    gruvbox_italicize_comments = true,
    gruvbox_italicize_strings = true,   -- apparently, func == string, so as to avoid confusion, string will be italic
    gruvbox_contrast_dark = 'medium',
  }

  for option,value in pairs(gruv_opts) do
    vim.g[option] = value
  end

  vim.o.background = 'dark'
  vim.cmd('colorscheme gruvbox')
  lualine.setup_lualine('gruvbox')
  vim.cmd('autocmd VimEnter * highlight SignColumn guibg=#2929229')
end

-- Vim colorizer
require('colorizer').setup()

return M
