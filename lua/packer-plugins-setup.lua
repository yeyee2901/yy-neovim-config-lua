-- Ensure that packer is always installed in
local execute = vim.api.nvim_command
local fn = vim.fn

-- Do not change the default installation path
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

local new_install = false

if fn.empty(fn.glob(install_path)) > 0 then
  print('[PACKER] Packer not yet installed')
  print('[PACKER] Now installing packer in' .. install_path)
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
  new_install = true
end


-- Insert your packages
require('packer').startup(
  function()
    use {'wbthomason/packer.nvim'}

    -- NERDTree for classic vim :)
    use {'preservim/nerdtree'}

    -- Floaterm for terminal integration
    use {'voldikss/vim-floaterm'}

    --Themes choose only one
    use {'vim-airline/vim-airline'}
    use {'vim-airline/vim-airline-themes'}
--    use {'tanvirtin/monokai.nvim'}
--    use {'tomasiser/vim-code-dark'}
--    use {'ayu-theme/ayu-vim'}
--    use {'folke/tokyonight.nvim'}
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
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- Telescopeeeeeee
    use {'nvim-lua/popup.nvim'}
    use {'nvim-lua/plenary.nvim'}
    use {'nvim-telescope/telescope.nvim'}
  end
)

if new_install then
  vim.cmd('PackerUpdate')
end
