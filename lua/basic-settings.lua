-- BASIC SETTINGS -----------------------------------------------
local my_options = {
  encoding        = 'utf8',
  relativenumber  = true,
  clipboard       = 'unnamedplus',    -- Requires xclip (apt)
  mouse           = 'a',
  swapfile        = false,
  tabstop         = 4,        -- Default
  softtabstop     = 4,        -- Default
  shiftwidth      = 4,        -- Default
  expandtab       = true,     -- Default
  smartindent     = true,
  smarttab        = true,
  wrap            = false,
  ignorecase      = true,     -- ignore case for search commands
  timeout         = true,     -- set keystroke timeout to be longer
  timeoutlen      = 2000,     -- in this case 2 seconds (pardon, I have slow hand sickness)
  hlsearch        = false,    -- Toggle with <S-h>
  hidden          = true,
  termguicolors   = true,
  cursorline      = true,
  inccommand      = 'split',
  signcolumn      = 'yes',
  colorcolumn     = '0',
  lazyredraw      = true,
}

-- Allow Lua syntax in vimscripts ('l' as in lua)
vim.g.vimsyn_embed = 'l'

vim.cmd('filetype indent plugin on')
vim.cmd('syntax on')


-- set all options
for option,value in pairs(my_options) do
  vim.o[option] = value
end
