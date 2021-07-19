-- Map <leader> key to SPACE
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Wrapper function for remaps
local _noremap = function(mode, key, map_to)
  vim.api.nvim_set_keymap(mode, key, map_to, {noremap = true, silent = false})
end

local _noremap_expr = function(mode, key, map_to)
  vim.api.nvim_set_keymap(mode, key, map_to, {noremap = true, silent = false, expr = true})
end

-- Togle highlighting after searching
_noremap('n', '<S-h>', '<cmd>set hlsearch!<CR>')

-- Simple file browser
_noremap('n', '<Leader>ef', '<cmd>Lexplore<CR>')

-- Allow navigation in wrapped line
_noremap('n', 'j', 'gj')
_noremap('n', 'k', 'gk')

-- Visual mode editing
_noremap('v', '<Tab>',   '>gv')
_noremap('v', '<S-Tab>', '<gv')
_noremap('v', '<BS>',    'xgv')

-- append to all selected line via VISUAL-BLOCK mode only.
_noremap('v', '<S-a>a', '$<S-a>')


-- Window Keymappings ------------------------------------------------------------
_noremap('n', '<C-l>', '<C-w>l')
_noremap('n', '<C-h>', '<C-w>h')
_noremap('n', '<C-j>', '<C-w>j')
_noremap('n', '<C-k>', '<C-w>k')

-- Rotate / move window around
_noremap('n', '<S-r>', '<C-w>r')

-- Resize window
-- Up, right    = increase
-- down, left   = decrease
_noremap('n', '<M-Up>',    '<C-w>+')
_noremap('n', '<M-Down>',  '<C-w>-')
_noremap('n', '<M-Right>', '<C-w>>')
_noremap('n', '<M-Left>',  '<C-w><')


-- Buffer keymappings ------------------------------------------------------------
_noremap('n', '<S-b>b', '<cmd>buffers<CR>')
_noremap('n', '<S-b>n', '<cmd>enew<CR>')
_noremap('n', '<S-b>q', '<cmd>bdelete<CR>')
_noremap('n', '<S-b>l', '<cmd>bNext<CR>')
_noremap('n', '<S-b>h', '<cmd>bprevious<CR>')


-- Tab keymappings ---------------------------------------------------------------
_noremap('n', '<S-t>n', '<cmd>tabnew<CR>')
_noremap('n', '<S-t>q', '<cmd>tabclose<CR>')
_noremap('n', '<S-t>l', '<cmd>tabNext<CR>')
_noremap('n', '<S-t>h', '<cmd>tabprevious<CR>')
_noremap('n', '<Tab>',  '<cmd>tabNext<CR>')


-- Plugin specific keymaps -------------------------------------------------------
-- Most of the plugin keymapping will start with <leader>  (SPACE key)
-- All silent = false, so we can see what command was called

-- PLUGIN: CMake
_noremap('n', '<Leader>cg', '<cmd>CMakeClean<CR><cmd>CMakeGenerate<CR>')
_noremap('n', '<Leader>cb', '<cmd>CMakeBuild<CR>')
_noremap('n', '<Leader>cq', '<cmd>CMakeClose<CR>')

-- PLUGIN: NERDTree
_noremap('n', '<Leader>nt', '<cmd>NERDTreeToggle<CR>')

-- PLUGIN: Floaterm
_noremap('n', '<Leader>ft', '<cmd>FloatermNew<CR>')
_noremap('n', '<Leader>ff', '<cmd>FloatermNew fff<CR>')

-- PLUGIN: LSP helper (I don't know if there's a more proper way, contact me if you know)
_noremap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
_noremap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
_noremap('n', 'K',  '<cmd>lua vim.lsp.buf.hover()<CR>')

-- Snippet & Code completion on TAB press
_noremap_expr('i', '<Tab>', 'compe#confirm("<Tab>")')
_noremap_expr('i', '<C-q>', 'compe#close("<C-q>")')

-- PLUGIN: Telescope
_noremap('n', '<Leader>tf', '<cmd>Telescope find_files<CR>')
_noremap('n', '<Leader>tz', '<cmd>Telescope current_buffer_fuzzy_find<CR>')
_noremap('n', '<Leader>tb', '<cmd>Telescope buffers<CR>')
_noremap('n', '<Leader>t?', '<cmd>Telescope keymaps<CR>')
_noremap('n', '<Leader>ts', ':Telescope grep_string search=')

-- LSP in Telescope
_noremap('n', '<Leader>tlds', '<cmd>Telescope lsp_document_symbols<CR>')
_noremap('n', '<Leader>tldd', '<cmd>Telescope lsp_document_diagnostics<CR>')
_noremap('n', '<Leader>tlws', '<cmd>Telescope lsp_workspace_symbols<CR>')
_noremap('n', '<Leader>tlwd', '<cmd>Telescope lsp_workspace_diagnostics<CR>')

-- Open quickfix list (you can send any search result from telescope to quickfix list
-- by pressing Ctrl + q while Telescope is open)
-- There are 2 ways to fill quickfix list:
--  - using any Telescope calls
--  - using vimgrep (ex: vimgrep /def/g ./*.py    -> search all 'def' in *.py file in current dir)
_noremap('n', '<Leader>tqf', '<cmd>Telescope quickfix<CR>')

-- Git in Telescope
_noremap('n', '<Leader>tgs', '<cmd>Telescope git_status<CR>')
_noremap('n', '<Leader>tgc', '<cmd>Telescope git_commits<CR>')
_noremap('n', '<Leader>tgf', '<cmd>Telescope git_files<CR>')
_noremap('n', '<Leader>tgb', '<cmd>Telescope git_branches<CR>')

-- Quick open neovim config files
_noremap('n', '<Leader>tinit', '<cmd>Telescope find_files cwd=~/.config/nvim/<CR>')
