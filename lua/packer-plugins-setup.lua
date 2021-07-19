local M = {}

-- Ensure that packer is always installed in 
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local new_install = false

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
  new_install = true
end


M = require('packer').startup(function()
  -- Packer can manage itself (mandiri sekali :))
  use {'wbthomason/packer.nvim'}


  -- NERDTree for classic vim :)
  use {'preservim/nerdtree'}

  -- Floaterm for terminal integration
  use {'voldikss/vim-floaterm'}

  --Themes
  use {'vim-airline/vim-airline'}
  use {'vim-airline/vim-airline-themes'}
  use {'ayu-theme/ayu-vim'}
  use {'folke/tokyonight.nvim'}
  use {'ray-x/aurora'}
                                   
  --Rainbow - Bracket pair colorizer
  use {'luochen1990/rainbow'}
                                   
  --CMake Integration
  use {'cdelledonne/vim-cmake'}

  -- LSP setup
  use {'neovim/nvim-lspconfig'}
  use {'hrsh7th/nvim-compe'}
  use {'ray-x/lsp_signature.nvim'}

  -- Tree Sitter
  use {'nvim-treesitter/nvim-treesitter'}

  -- Telescopeeeeeee
  use {'nvim-lua/popup.nvim'}
  use {'nvim-lua/plenary.nvim'}
  use {'nvim-telescope/telescope.nvim'}

end)

if new_install then 
  vim.cmd('PackerUpdate') 
end

return M
