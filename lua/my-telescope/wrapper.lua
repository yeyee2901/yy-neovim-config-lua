local M = {}


local builtin = require('telescope.builtin')
local themes = require('telescope.themes')
local ultisnips = require('telescope').extensions.ultisnips
local default_theme = 'get_ivy'   -- {"get_ivy", "get_dropdown", "get_cursor"}


-- Quick open neovim config files
M.tele_open_config = function()
  builtin.find_files({
    cwd = '~/.config/nvim/',
    prompt_title = ' < Neovim Config >'
  })
end

-- Quick open LSP lists
M.tele_open_lsp_dir = function()
  local lsp_path = vim.fn.stdpath('data')..'/site/pack/packer/start/nvim-lspconfig/lua/lspconfig'
  builtin.find_files({
    cwd = lsp_path,
    prompt_title = ' < YY - LSP Lists - YY >'
  })
end

M.tele_keymaps = function ()
  builtin.keymaps(themes[default_theme]({
    prompt_title = "< Keymap Search >"
  }))
end

M.tele_command_list = function ()
  builtin.commands(themes[default_theme]({
    prompt_title = "< Available Commands >"
  }))
end

M.tele_find_files = function ()
  builtin.find_files(themes[default_theme]({
    prompt_title = "< File Finder >"
  }))
end

M.tele_buffer_lists = function ()
  builtin.buffers(themes[default_theme]({
    prompt_title = "< Buffer List >"
  }))
end

M.tele_current_buffer_fuzzy_find = function ()
  builtin.current_buffer_fuzzy_find(themes[default_theme]({
    prompt_title = "< Buffer Fuzzy Finder >"
  }))
end

M.tele_live_grep = function ()
  builtin.live_grep(themes[default_theme]({
    prompt_title = "< Grep String >"
  }))
end

M.tele_treesitter = function ()
  builtin.treesitter(themes[default_theme]({
    prompt_title = "< Treesitter Symbols >"
  }))
end

M.tele_lsp_document_symbols = function ()
  builtin.lsp_document_symbols(themes[default_theme]({
    prompt_title = "< Document Symbols >"
  }))
end

M.tele_lsp_document_diagnostics = function ()
  builtin.lsp_document_diagnostics(themes[default_theme]({
    prompt_title = "< Document Diagnostics >"
  }))
end

M.tele_lsp_dynamic_workspace_symbols = function ()
  builtin.lsp_dynamic_workspace_symbols(themes[default_theme]({
    prompt_title = "< Workspace Symbols >"
  }))
end

M.tele_lsp_workspace_diagnostics = function ()
  builtin.lsp_workspace_diagnostics(themes[default_theme]{
    prompt_title = "< Workspace Diagnostics >"
  })
end

M.tele_lsp_range_code_actions = function ()
  builtin.lsp_range_code_actions(themes[default_theme]({
    prompt_title = "< Suggested Code Actions >"
  }))
end

M.tele_lsp_definitions = function ()
  builtin.lsp_definitions(themes[default_theme]({
    prompt_title = "< Definitions >"
  }))
end

M.tele_lsp_references = function ()
  builtin.lsp_references(themes[default_theme]({
    prompt_title = "< References >"
  }))
end

M.tele_quickfix = function ()
  builtin.quickfix(themes[default_theme]({
    prompt_title = "< Quickfix Lists >"
  }))
end

M.tele_git_branches = function ()
  builtin.git_branches(themes[default_theme]({
    prompt_tile = "< Git Branches >"
  }))
end

M.tele_git_status = function ()
  builtin.git_status(themes[default_theme]({
    prompt_title = "< Git Status >"
  }))
end

M.tele_git_files = function ()
  builtin.git_files(themes[default_theme]({
    prompt_title = "< Git Files >"
  }))
end

M.tele_git_branch_diff = function ()
  builtin.git_bcommits(themes[default_theme]({
    prompt_title = "< Buffer Diff View >"
  }))
end

M.tele_git_commits = function ()
  builtin.git_commits(themes[default_theme]({
    prompt_title = "< Git Commits Log >"
  }))
end

M.tele_snippets = function ()
  ultisnips.ultisnips(themes[default_theme]({
    prompt_title = "< Available Snippets >"
  }))
end


return M
