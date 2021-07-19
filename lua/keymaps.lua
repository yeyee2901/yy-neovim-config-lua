-- Map <leader> key to SPACE
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Togle highlighting after searching
vim.api.nvim_set_keymap('n', '<S-h>', '<cmd>set hlsearch!<CR>', {noremap = true, silent = false})

-- Simple file browser
vim.api.nvim_set_keymap('n', '<Leader>ef', '<cmd>Lexplore<CR>', {noremap = true, silent = false})

-- Allow navigation in wrapped line
vim.api.nvim_set_keymap('n', 'j', 'gj', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'k', 'gk', {noremap = true, silent = true})

-- Visual mode editing
vim.api.nvim_set_keymap('v', '<Tab>',   '>gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<S-Tab>', '<gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<BS>',    'xgv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<S-a>',   '$A',  {noremap = true, silent = true})


-- Window Keymappings ------------------------------------------------------------
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {noremap = true, silent = true})

-- Rotate / move window around
vim.api.nvim_set_keymap('n', '<S-r>', '<C-w>r', {noremap = true, silent = true})

-- Resize window
-- Up, right    = increase
-- down, left   = decrease
vim.api.nvim_set_keymap('n', '<M-Up>',    '<C-w>+', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<M-Down>',  '<C-w>-', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<M-Right>', '<C-w>>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<M-Left>',  '<C-w><', {noremap = true, silent = true})


-- Buffer keymappings ------------------------------------------------------------
vim.api.nvim_set_keymap('n', '<S-b>b', '<cmd>buffers<CR>',   {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-b>n', '<cmd>enew<CR>',      {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-b>q', '<cmd>bdelete<CR>',   {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-b>l', '<cmd>bNext<CR>',     {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-b>h', '<cmd>bprevious<CR>', {noremap = true, silent = true})


-- Tab keymappings ---------------------------------------------------------------
vim.api.nvim_set_keymap('n', '<S-t>n', '<cmd>tabnew<CR>',      {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-t>q', '<cmd>tabclose<CR>',    {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-t>l', '<cmd>tabNext<CR>',     {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-t>h', '<cmd>tabprevious<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Tab>',  '<cmd>tabNext<CR>',     {noremap = true, silent = true})


-- Plugin specific keymaps -------------------------------------------------------
-- Most of the plugin keymapping will start with <leader>  (SPACE key)
-- All silent = false, so we can see what command was called

-- PLUGIN: CMake
vim.api.nvim_set_keymap('n', '<Leader>cg', '<cmd>CMakeClean<CR><cmd>CMakeGenerate<CR>', {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<Leader>cb', '<cmd>CMakeBuild<CR>', {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<Leader>cq', '<cmd>CMakeClose<CR>', {noremap = true, silent = false})

-- PLUGIN: NERDTree
vim.api.nvim_set_keymap('n', '<Leader>nt', '<cmd>NERDTreeToggle<CR>', {noremap = true, silent = false})

-- PLUGIN: Floaterm
vim.api.nvim_set_keymap('n', '<Leader>ft', '<cmd>FloatermNew<CR>', {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<Leader>ff', '<cmd>FloatermNew fff<CR>', {noremap = true, silent = false})

-- PLUGIN: LSP helper (I don't know if there's a more proper way, contact me if you know)
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>',  {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', 'K',  '<cmd>lua vim.lsp.buf.hover()<CR>',       {noremap = true, silent = false})

-- Snippet & Code completion on TAB press
vim.api.nvim_set_keymap('i', '<Tab>', 'compe#confirm("<Tab>")', {expr = true, noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-q>', 'compe#close("<C-q>")',   {expr = true, noremap = true, silent = true})

-- PLUGIN: Telescope
vim.api.nvim_set_keymap('n', '<Leader>tf', '<cmd>Telescope find_files<CR>',                 {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<Leader>tz', '<cmd>Telescope current_buffer_fuzzy_find<CR>',  {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<Leader>tb', '<cmd>Telescope buffers<CR>',                    {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<Leader>t?', '<cmd>Telescope keymaps<CR>',                    {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<Leader>ts', ':Telescope grep_string search=',                {noremap = true, silent = false})

-- LSP in Telescope
vim.api.nvim_set_keymap('n', '<Leader>tlds', '<cmd>Telescope lsp_document_symbols<CR>',      {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<Leader>tldd', '<cmd>Telescope lsp_document_diagnostics<CR>',  {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<Leader>tlws', '<cmd>Telescope lsp_workspace_symbols<CR>',     {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<Leader>tlwd', '<cmd>Telescope lsp_workspace_diagnostics<CR>', {noremap = true, silent = false})

-- Open quickfix list (you can send any search result from telescope to quickfix list
-- by pressing Ctrl + q while Telescope is open)
-- There are 2 ways to fill quickfix list:
--  - using any Telescope calls
--  - using vimgrep (ex: vimgrep /def/g ./*.py    -> search all 'def' in *.py file in current dir)
vim.api.nvim_set_keymap('n', '<Leader>tqf', '<cmd>Telescope quickfix<CR>', {noremap = true, silent = false})

-- Git in Telescope
vim.api.nvim_set_keymap('n', '<Leader>tgs', '<cmd>Telescope git_status<CR>',   {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<Leader>tgc', '<cmd>Telescope git_commits<CR>',  {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<Leader>tgf', '<cmd>Telescope git_files<CR>',    {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<Leader>tgb', '<cmd>Telescope git_branches<CR>', {noremap = true, silent = false})

-- Quick open neovim config files
vim.api.nvim_set_keymap('n', '<Leader>tinit', '<cmd>Telescope find_files cwd=~/.config/nvim/<CR>', {noremap = true, silent = false})
