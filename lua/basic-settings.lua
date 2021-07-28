-- BASIC SETTINGS -----------------------------------------------
local my_options = {
  encoding        = 'utf8',
  relativenumber  = true,
  clipboard       = 'unnamedplus',    -- Requires xclip (apt)
  mouse           = 'a',
  swapfile        = false,
  tabstop         = 4,        -- for PEP standards
  softtabstop     = 4,        -- for PEP standards
  shiftwidth      = 4,        -- for PEP standards
  expandtab       = true,
  smartindent     = true,
  smarttab        = true,
  wrap            = false,
  ignorecase      = true,     -- ignore case for search commands
  timeout         = true,
  timeoutlen      = 2000,
  hlsearch        = false,    -- Toggle with <S-h>
  hidden          = true,
  termguicolors   = true,
  cursorline      = true,
  inccommand      = 'split',
  signcolumn      = 'yes',
}

-- Allow Lua syntax in vimscripts ('l' as in lua)
vim.g.vimsyn_embed = 'l'

vim.cmd('filetype indent plugin on')
vim.cmd('syntax on')

-- I prefer C-like language to be 2 spaces wide
vim.cmd( 'autocmd FileType c,cpp,php,javascript,html,css,lua set tabstop=2' )
vim.cmd( 'autocmd FileType c,cpp,php,javascript,html,css,lua set softtabstop=2' )
vim.cmd( 'autocmd FileType c,cpp,php,javascript,html,css,lua set shiftwidth=2' )

-- Code folding,
-- using *.* to match file types, this is important
-- so it doesn't conflict with telescope dynamic buffers
vim.cmd ( 'autocmd BufWinLeave *.* mkview' )
vim.cmd ( 'autocmd BufWinEnter *.* silent! loadview' )

-- Highlight on yank
vim.cmd ( 'autocmd TextYankPost * lua require("vim.highlight").on_yank({timeout = 40, on_visual = false})' )

-- set all options
for option,value in pairs(my_options) do
  vim.o[option] = value
end
