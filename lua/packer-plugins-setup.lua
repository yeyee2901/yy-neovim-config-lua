local execute = vim.api.nvim_command
local fn = vim.fn

-- Ensure that packer is always installed in new machine
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim' -- Might differ on macOS & winOS
local new_install = false

if fn.empty(fn.glob(install_path)) > 0 then
  print('[PACKER] Packer not yet installed')
  print('[PACKER] Now installing packer in' .. install_path)
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute('packadd packer.nvim')
  new_install = true
end


require('packer').startup(
  function()
    use {'wbthomason/packer.nvim'}

    -- Nvim tree > NERDTree, no debate :)
    use{'kyazdani42/nvim-web-devicons'}
    use{'kyazdani42/nvim-tree.lua'}

    -- Floaterm for terminal integration
    use {'voldikss/vim-floaterm'}

    --Themes choose only one
    use {'hoob3rt/lualine.nvim',
      requires = {
        'kyazdani42/nvim-tree.lua'
      }
    }
    use {'tanvirtin/monokai.nvim'}
    use {'tomasiser/vim-code-dark'}
    use {'ayu-theme/ayu-vim'}
    use {'folke/tokyonight.nvim'}
    use {'ray-x/aurora'}

    --Rainbow - Bracket pair colorizer
    use {'luochen1990/rainbow'}

    -- Colorizer for color codes
    use {'norcalli/nvim-colorizer.lua'}

    --CMake Integration
    use {'cdelledonne/vim-cmake'}

    -- LSP setup
    use {'neovim/nvim-lspconfig'}
    use {'hrsh7th/nvim-compe'}
    use {'ray-x/lsp_signature.nvim'}
    use {'glepnir/lspsaga.nvim'}

    -- Tree Sitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- Telescopeeeeeee
    use {'nvim-lua/popup.nvim'}
    use {'nvim-lua/plenary.nvim'}
    use {'nvim-telescope/telescope.nvim'}

    -- Git it gud
    use {'tpope/vim-fugitive'}

    -- Snippets
    use {'SirVer/ultisnips'}
    use {'honza/vim-snippets'}

    -- Bracket stuffs
    use {'rstacruz/vim-closer'}
    use {'tpope/vim-surround'}

  end
)

if new_install then
  vim.cmd('PackerUpdate')
end
