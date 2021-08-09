local execute = vim.api.nvim_command
local fn = vim.fn

-- Ensure that packer is always installed in new machine
-- Might differ on macOS & winOS
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
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
    -- Packer self management, DO NOT REMOVE
    use {'wbthomason/packer.nvim'}

    -- Start menu
    use {'mhinz/vim-startify'}

    -- File tree preview
    use {'kyazdani42/nvim-web-devicons'}
    use {'kyazdani42/nvim-tree.lua'}

    --Themes choose only one
    use {'tanvirtin/monokai.nvim'}
    use {'tomasiser/vim-code-dark'}
    use {'ayu-theme/ayu-vim'}
    use {'folke/tokyonight.nvim'}
    use {'ray-x/aurora'}
    use {'tjdevries/gruvbuddy.nvim',
      requires = {
        'tjdevries/colorbuddy.vim'
      },
    }

    -- Status line
    use {'hoob3rt/lualine.nvim',
      requires = {
        'kyazdani42/nvim-tree.lua'
      }
    }

    -- Colorizer for color codes like this one -> #ff0000
    use {'norcalli/nvim-colorizer.lua'}

    --CMake Integration
    use {'cdelledonne/vim-cmake'}

    -- LSP (Language Server)
    use {'neovim/nvim-lspconfig'}
    use {'hrsh7th/nvim-compe'}
    use {'ray-x/lsp_signature.nvim'}
    use {'glepnir/lspsaga.nvim'}

    -- Tree Sitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use {'nvim-treesitter/playground'}

    -- Telescopeee, behold the most overpowered meta plugin
    use {'nvim-lua/popup.nvim'}
    use {'nvim-lua/plenary.nvim'}
    use {'nvim-telescope/telescope.nvim'}
    use {'nvim-telescope/telescope-symbols.nvim'}
    use {'nvim-telescope/telescope-fzy-native.nvim'}
    use { 'fhill2/telescope-ultisnips.nvim',
      requires = {
        'SirVer/ultisnips'
        }
    }

    -- Git it gud
    use {'tpope/vim-fugitive'}

    -- Snippets
    use {'SirVer/ultisnips'}
    use {'honza/vim-snippets'}

    -- Bracket stuffs
    use {'jiangmiao/auto-pairs'}
    use {'tpope/vim-surround'}

    -- Markdown editing
    use {'iamcco/markdown-preview.nvim', run = ':call mkdp#util#install()'}
    use {'ferrine/md-img-paste.vim'}

  end
)

if new_install then
  vim.cmd('PackerInstall')
end
