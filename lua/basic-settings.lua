-- BASIC SETTINGS -----------------------------------------------
if vim.fn.has('filetype') then
    vim.cmd('filetype indent plugin on')
    vim.cmd('syntax on')
end

-- vim.opt.<field> = set <field>  , field has to match exactly
vim.opt.encoding        = 'utf8'
vim.opt.relativenumber  = true
vim.opt.clipboard       = 'unnamedplus'
vim.opt.mouse           = 'a'
vim.opt.swapfile        = false

-- SPACING & TAB width, tab will be expanded to space
vim.opt.tabstop         = 8
vim.opt.softtabstop     = 8
vim.opt.shiftwidth      = 8 
vim.opt.expandtab       = true
vim.opt.smartindent     = true
vim.opt.smarttab        = true
vim.opt.wrap            = false

-- For slow hand / slow typers like me (timeout in milli seconds)
vim.opt.timeout         = true
vim.opt.timeoutlen      = 2000

-- Disable by default, you can toggle with Shift + H
vim.opt.hlsearch        = false

-- Hide buffers, required for multi buffer navigation
vim.opt.hidden          = true

-- Cursor line for easy line tracking
vim.opt.termguicolors   = true
vim.opt.cursorline      = true

-- Enable Lua syntax highlighting in vimscript files
vim.g.vimsyn_embed      = 'l'


-- Sadly, Lua doesn't have api yet for autocmd, we have to hard code it using
-- vim.cmd()   :(
vim.cmd('autocmd BufWinEnter,InsertLeave * highlight CursorLine guibg=#353b47')
vim.cmd('autocmd InsertEnter * highlight CursorLine guibg=#15181f')

-- Set tab-spacing for these files'
vim.cmd('autocmd FileType php,javascript,html,css,lua set tabstop=2')
vim.cmd('autocmd FileType php,javascript,html,css,lua set softtabstop=2')
vim.cmd('autocmd FileType php,javascript,html,css,lua set shiftwidth=2')

vim.cmd('autocmd FileType c,cpp,python set tabstop=4')
vim.cmd('autocmd FileType c,cpp,python set softtabstop=4')
vim.cmd('autocmd FileType c,cpp,python set shiftwidth=4')


-- Debug Message
if vim.g.load_module_message then
        print('[LOAD] basic-settings.lua')
end
