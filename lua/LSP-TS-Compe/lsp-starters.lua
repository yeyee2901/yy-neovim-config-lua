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


-- Attach LSP signature to enable better function documentation
local LSP_signature_setup = {
	on_attach = function(client, bufnr)
		require('lsp_signature').on_attach()
	end
}

-- pip install cmake-language-server
require('lspconfig').cmake.setup{}

-- sudo apt install clangd
require('lspconfig').clangd.setup(LSP_signature_setup)

-- sudo npm install -g vim-language-server
require('lspconfig').vimls.setup{}

-- sudo npm install -g bash-language-server
require('lspconfig').bashls.setup{}

-- sudo npm install -g pyright
require('lspconfig').pyright.setup(LSP_signature_setup)


-- https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)
-- Because I install Lua Language manually, We have to do some setup here
local OS_name
if vim.fn.has('unix') == 1      then OS_name = 'Linux'
elseif vim.fn.has('mac') == 1   then OS_name = 'macOS'
elseif vim.fn.has('win32') == 1 then OS_name = 'Windows'
else print("What do you use, my man?")
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
                }
        },

        -- On attaching the language server, We want to call lsp_signature
        on_attach = function(client, bufnr)
                require('lsp_signature').on_attach()
        end
}

