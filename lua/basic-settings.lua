-- BASIC SETTINGS -----------------------------------------------
local my_options = {
  encoding        = 'utf8',
  relativenumber  = true,
  clipboard       = 'unnamedplus',
  mouse           = 'a',
  swapfile        = false,
  tabstop         = 8,
  softtabstop     = 8,
  shiftwidth      = 8 ,
  expandtab       = true,
  smartindent     = true,
  smarttab        = true,
  wrap            = false,
  timeout         = true,
  timeoutlen      = 2000,
  hlsearch        = false,
  hidden          = true,
  termguicolors   = true,
  cursorline      = true,
}

-- Allow Lua syntax in vimscripts ('l' as in lua)
vim.g.vimsyn_embed = 'l'

vim.cmd('filetype indent plugin on')
vim.cmd('syntax on')

vim.cmd('autocmd BufWinEnter,InsertLeave * highlight CursorLine guibg=#353b47')
vim.cmd('autocmd InsertEnter * highlight CursorLine guibg=#15181f')

vim.cmd('autocmd FileType php,javascript,html,css,lua set tabstop=2')
vim.cmd('autocmd FileType php,javascript,html,css,lua set softtabstop=2')
vim.cmd('autocmd FileType php,javascript,html,css,lua set shiftwidth=2')

vim.cmd('autocmd FileType c,cpp,python set tabstop=4')
vim.cmd('autocmd FileType c,cpp,python set softtabstop=4')
vim.cmd('autocmd FileType c,cpp,python set shiftwidth=4')

-- set all options
for option,value in pairs(my_options) do
  vim.o[option] = value
end
