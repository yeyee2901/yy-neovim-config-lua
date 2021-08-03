---@diagnostic disable: unused-local
-- If you want to install & activate the LSP, go to:
--      https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
--
-- And then search your desired Language Server, install it in your machine.
-- Neovim doesn't launch the Language Server, Neovim is the CLIENT. So you have
-- to download the language server manually.
--
-- After you download the language server, you have to connect Neovim to LSP using:
--
--      require('lspconfig').<language_server>.setup{}
--
-- Or if you want to enable the LSP_signature_setup for better code hover documentation:
--
--      require('lspconfig').<language_server>.setup(LSP_signature_setup)
--
-- The name of <language_server> must match with the one available at file CONFIG.md


-- Attach Custom functionality on LSP startup:
--   1. LSP signature to enable better function documentation
--   2. Completion icons (functions, classes, etc)
--   3. Auto formatting on buffer save
local LSP_signature_setup = {
	on_attach = function(client, bufnr)

    -- Better pop up documentation
		require('lsp_signature').on_attach{
      bind = true,  -- Mandatory for config
      doc_lines = 5,
      floating_window = true,
      fix_pos = false,
      hint_enable = true,
      hint_prefix = "<> ",
      hint_scheme = "String",
      use_lspsaga = true,
      hi_parameter = "Search",
      max_height = 12,
      max_width = 120,
      handler_opts = {
        border = "double" -- single/double/shadow
      },
    }

    -- Big thanks to Takuya Matsuyama from Japan for providing this icon setup.
    -- He provided amazing video on setting up LSP on Neovim 0.5.0.
    -- https://blog.inkdrop.info/how-to-set-up-neovim-0-5-modern-plugins-lsp-treesitter-etc-542c3d9c9887
    require('vim.lsp.protocol').CompletionItemKind = {
      '  Text',
      '  Method',
      '  Function',
      '  Constructor',
      '  Attribute/Field',
      '  Var',
      '  Class',
      'ﰮ  Interface',
      '  Module',
      '  Property',
      '  Unit',
      '  Value',
      '  Enum',
      '  Keyword',
      '﬌  Snippet',
      '  Color',
      '  File',
      '  Ref',
      '  Folder',
      '  Enum Member',
      '  Constant',
      '  Structure',
      '  Event',
      'OP Operator',
      '  TypeParam',
    }

    -- autoformat on save
    if client.resolved_capabilities.document_formatting then
      vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting_seq_sync()")
    end
  end, --end func
}

-- LSPSaga
local lsp_saga = require('lspsaga')
lsp_saga.init_lsp_saga{
  use_saga_diagnostic_sign = true,
  error_sign = '',
  warn_sign = '',
  hint_sign = '',
  infor_sign = '',
  dianostic_header_icon = '  ',
  max_preview_lines = 10,           -- preview lines for provider functions.
  code_action_prompt = {
    enable = false,
  },
  border_style = "round",
}

-- for Ultisnips integration
local snippet_enable = vim.lsp.protocol.make_client_capabilities()
snippet_enable.textDocument.completion.completionItem.snippetSupport = true
snippet_enable.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

-- Clone from git, then run 'cargo xtask install --server'
require('lspconfig').rust_analyzer.setup{
  filetypes = { "rust" },
  on_attach = LSP_signature_setup.on_attach,
  capabilities = snippet_enable,
}

-- sudo apt install clangd
require('lspconfig').clangd.setup{
  filetypes = { "c", "cpp", "objc", "objcpp" },
  on_attach = LSP_signature_setup.on_attach,
  capabilities = snippet_enable,
}

-- sudo npm install -g vim-language-server
require('lspconfig').vimls.setup(LSP_signature_setup)

-- sudo npm install -g pyright
require('lspconfig').pyright.setup{
  filetypes = { "python" },
  on_attach = LSP_signature_setup.on_attach,
  capabilities = snippet_enable,
}

-- sudo npm install -g bash-language-server
require('lspconfig').bashls.setup{
  filetypes = {'sh', 'zsh'},
  on_attach = LSP_signature_setup.on_attach,
  capabilities = snippet_enable,              -- UltiSnips has snippet for zsh
}

-- pip install cmake-language-server
require('lspconfig').cmake.setup{
  filetypes = { "cmake" },
  on_attach = LSP_signature_setup.on_attach
}

-- npm i -g vscode-langservers-extracted
require('lspconfig').html.setup{
  on_attach = LSP_signature_setup.on_attach,
  capabilities = snippet_enable
}

require('lspconfig').cssls.setup{
  on_attach = LSP_signature_setup.on_attach,
  capabilities = snippet_enable
}

-- npm i -g typescript typescript typescript-language-server
require('lspconfig').tsserver.setup{
  on_attach = LSP_signature_setup.on_attach,
  capabilities = snippet_enable
}

-- npm i -g intelephense
require('lspconfig').intelephense.setup{
  on_attach = LSP_signature_setup.on_attach,
  capabilities = snippet_enable
}

-- npm i -g sql-language-server
require('lspconfig').sqlls.setup{
  on_attach = LSP_signature_setup.on_attach,
  capabilities = snippet_enable
}

-- cargo install tectonic (for compiling)
-- cargo install --git https://github.com/latex-lsp/texlab.git --locked (for language server)
require('lspconfig').texlab.setup{

  on_attach = LSP_signature_setup.on_attach,
  capabilities = snippet_enable,

  cmd = { 'texlab' },
  filetypes = { 'tex', 'bib' },

  settings = {
    bibtexFormatter = 'texlab',

    -- check section
    chktex = {
      onOpenAndSave = true,
      onEdit = true,
    },

    diagnosticsDelay = 100, --ms
    formatterLineLength = 100,
  }
}


-- https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)
-- Because I install Lua Language manually, We have to do some setup here
local OS_name
if vim.fn.has('unix') == 1 then
  OS_name = 'Linux'
elseif vim.fn.has('mac') == 1 then
  OS_name = 'macOS'
elseif vim.fn.has('win32') == 1 then
  OS_name = 'Windows'
else
  print("What do you use, my man?")
end

-- Get the Lua Language Server path
local HOME_path = os.getenv('HOME')
local sumneko_root_path = HOME_path .. '/bin/lua-language-server'
local sumneko_binary_path = sumneko_root_path .. '/bin/' .. OS_name .. '/lua-language-server'

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')


require('lspconfig').sumneko_lua.setup {
  cmd = {
    sumneko_binary_path,
    '-E',
    sumneko_root_path .. '/main.lua'
  };

  settings = {
    Lua = {
      -- Tell which version of LuaJIT and where it is located
      runtime = {
        version = 'LuaJIT',

        path = runtime_path,
      },

      -- Get the language server to understand 'vim' global
      diagnostics = {
        globals = {
                'vim',
        }
      },

      -- Tell the Lua language server where is Neovim runtime files
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
      },

      -- Disable sending debug data
      telemetry = {
        enable = false,
      },
    },
  },

  -- On attaching the language server, We to also attach lsp_signature & snippet enable
  on_attach = LSP_signature_setup.on_attach,
  capabilities = snippet_enable,
}
