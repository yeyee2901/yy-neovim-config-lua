-- Wrapper function for remaps
local _noremap = function(mode, key, map_to)
  vim.api.nvim_set_keymap(mode, key, map_to, {noremap = true, silent = false})
end

local _noremap_expr = function(mode, key, map_to)
  vim.api.nvim_set_keymap(mode, key, map_to, {noremap = true, silent = false, expr = true})
end

local _noremap_silent = function(mode, key, map_to)
  vim.api.nvim_set_keymap(mode, key, map_to, {noremap = true, silent = true})
end


-- Map <leader> key to SPACE
_noremap('', '<Space>', '<Nop>')
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Togle highlighting after searching
_noremap('n', '<S-h>', '<cmd>set hlsearch!<CR>')

-- Simple file browser
_noremap('n', '<Leader>ef', '<cmd>Lexplore<CR>')

-- Allow navigation in wrapped line
--_noremap('n', 'j', 'gj')
--_noremap('n', 'k', 'gk')

-- Visual mode editing ----------------------------------------------------------
_noremap('v', '<Tab>',        '>gv')
_noremap('v', '<S-Tab>',      '<gv')
_noremap('v', '<BS>',         'xgv')

-- useful for moving lines up and down with auto indenting
_noremap_silent('v', '<M-k>', ':m-2<CR>gv=gv')
_noremap_silent('v', '<M-j>', ':m \'>+1<CR>gv=gv')


-- append to all selected line
-- (intended to be used with VISUAL-BLOCK mode only)
_noremap('v', 'aa', '$<S-a>')


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

-- PLUGIN: Nvim-tree
_noremap('n', '<Leader>nt', '<cmd>NvimTreeToggle<CR>')
_noremap('n', '<Leader>nr', '<cmd>NvimTreeRefresh<CR>')


-- PLUGIN: LSP saga (for floating terminal)
_noremap('n', '<Leader>ft', '<cmd>lua require("lspsaga.floaterm").open_float_terminal()<CR>')
_noremap('t', '<ESC><ESC>', '<cmd>lua require("lspsaga.floaterm").close_float_terminal()<CR>')

-- PLUGIN: LSP stuffs (I don't know if there's a more proper way, contact me if you know)
_noremap('n', '<Leader>p',   '<cmd>lua require("lspsaga.provider").preview_definition()<CR>')
_noremap('n', 'gd',          '<cmd>lua vim.lsp.buf.definition()<CR>')
_noremap('n', 'gD',          '<cmd>lua vim.lsp.buf.declaration()<CR>')
_noremap('n', 'K',           '<cmd>lua require("lspsaga.hover").render_hover_doc()<CR>')
_noremap('n', '<C-u>',       '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>')
_noremap('n', '<C-d>',       '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>')
_noremap('n', '<Leader>lr',  '<cmd>lua require("lspsaga.provider").lsp_finder()<CR>')
_noremap('n', '<Leader>ld',  '<cmd>lua require("lspsaga.diagnostic").show_line_diagnostics()<CR>')
_noremap('n', '<Leader>la',  '<cmd>lua require("lspsaga.codeaction").code_action()<CR>')
_noremap('n', '<Leader>j',   '<cmd>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_next()<CR>')
_noremap('n', '<Leader>k',   '<cmd>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_prev()<CR>')
_noremap('n', '<Leader>rn',  '<cmd>lua require("lspsaga.rename").rename()<CR>')


-- PLUGIN: Nvim-compe (for code completion)
_noremap_expr('i', '<Tab>', 'compe#confirm("<Tab>")')
_noremap_expr('i', '<C-q>', 'compe#close("<C-q>")')


-- PLUGIN: fuGITive (the rest are provided by telescope functionality)
_noremap('n', '<Leader>gs', '<cmd>G<CR>')
_noremap('n', '<Leader>ga', '<cmd>Git add .<CR>')

-- for easy merge conflict resolving
_noremap('n', '<Leader>gh', '<cmd>diffget //2<CR>')
_noremap('n', '<Leader>gl', '<cmd>diffget //3<CR>')


-- PLUGIN: Markdown Previewer
_noremap('n', '<Leader>mp', '<cmd>MarkdownPreviewToggle<CR>')
_noremap('n', '<Leader>mi', '<cmd>call mdip#MarkdownClipboardImage()<CR>')


-- PLUGIN: Telescope
_noremap('n', '<Leader>tc', '<cmd>Telescope commands<CR>')
_noremap('n', '<Leader>tf', '<cmd>Telescope find_files<CR>')
_noremap('n', '<Leader>tz', '<cmd>Telescope current_buffer_fuzzy_find<CR>')
_noremap('n', '<Leader>tb', '<cmd>Telescope buffers<CR>')
_noremap('n', '<Leader>t?', '<cmd>Telescope keymaps<CR>')
_noremap('n', '<Leader>tsg', ':Telescope grep_string search=')
_noremap('n', '<Leader>tsl',
  '<cmd>lua require("telescope.builtin").live_grep( require("telescope.themes").get_dropdown() )<CR>'
)

-- Query all function names, vars, and ohter symbols from Tree Sitter queries
_noremap('n', '<Leader>tt', '<cmd>lua require("telescope.builtin").treesitter()<CR>')

-- LSP in Telescope
_noremap('n', '<Leader>tlds',   '<cmd>Telescope lsp_document_symbols<CR>')
_noremap('n', '<Leader>tldd',   '<cmd>Telescope lsp_document_diagnostics<CR>')
_noremap('n', '<Leader>tlws',   ':Telescope lsp_workspace_symbols query=')
_noremap('n', '<Leader>tlwS',   '<cmd>Telescope lsp_dynamic_workspace_symbols<CR>')
_noremap('n', '<Leader>tlwd',   '<cmd>Telescope lsp_workspace_diagnostics<CR>')
_noremap('n', '<Leader>tla',
  '<cmd>lua require("telescope.builtin").lsp_range_code_actions( require("telescope.themes").get_dropdown() )<CR>'
)
_noremap('n', '<Leader>tlgd',
  '<cmd>lua require("telescope.builtin").lsp_definitions( require("telescope.themes").get_dropdown())<CR>')
_noremap('n', '<Leader>tlr',
  '<cmd>lua require("telescope.builtin").lsp_references( require("telescope.themes").get_dropdown())<CR>')

-- Open quickfix list (you can send any search result from telescope to quickfix list
-- by pressing Ctrl + q while Telescope is open)
-- There are 2 ways to fill quickfix list:
--  - using any Telescope calls
--  - using vimgrep (ex: vimgrep /def/g ./*.py    -> search all 'def' in *.py file in current dir)
_noremap('n', '<Leader>tqf', '<cmd>Telescope quickfix<CR>')

-- Git in Telescope
_noremap('n', '<Leader>tgs',
  '<cmd>lua require("telescope.builtin").git_branches( require("telescope.themes").get_dropdown() )<CR>'
)
_noremap('n', '<Leader>tgs',
  '<cmd>lua require("telescope.builtin").git_status( require("telescope.themes").get_dropdown() )<CR>'
)
_noremap('n', '<Leader>tgf',
  '<cmd>lua require("telescope.builtin").git_files( require("telescope.themes").get_dropdown() )<CR>'
)

-- commits = diff all files,  bcommits = diff current buffer
_noremap('n', '<Leader>tgca',
  '<cmd>lua require("telescope.builtin").git_commits( require("telescope.themes").get_dropdown() )<CR>'
)
_noremap('n', '<Leader>tgcb',
  '<cmd>lua require("telescope.builtin").git_bcommits( require("telescope.themes").get_dropdown() )<CR>'
)

-- SOME HELPER FUNCTIONALITY
-- open neovim config
_noremap('n', '<Leader>tinit', '<cmd>lua require("my-telescope.wrapper").tele_open_config()<CR>')
_noremap('n', '<Leader>tu', '<cmd>Telescope ultisnips<CR>')
