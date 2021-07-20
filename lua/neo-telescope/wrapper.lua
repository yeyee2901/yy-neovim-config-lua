local M = {}

-- Quick open neovim config files
M.tele_open_config = function()
  require('telescope.builtin').find_files({ 
    cwd = '~/.config/nvim/',
    prompt_title = ' < YY - Neovim Lua Config - YY >'
  })
end

M.tele_open_lsp_dir = function()
  local lsp_path = vim.fn.stdpath('data')..'/site/pack/packer/start/nvim-lspconfig/lua/lspconfig'
  require('telescope.builtin').find_files({ 
    cwd = lsp_path,
    prompt_title = ' < YY - LSP Lists - YY >'
  })
end

return M
