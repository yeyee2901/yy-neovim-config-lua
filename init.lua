-- YYYY                     YYYY
-- YYYY                     YYYY
-- YYYY                     YYYY
-- YYYY                     YYYY
-- YYYY                     YYYY
-- YYYY                     YYYY
-- YYYY                     YYYY
-- YYYY                     YYYY      22222222222
--  YYYYY                   YYYY    222         222
--    YYYYYYYYYYYYYYYYYYYYYYYYYY   222           222
--      YYYYYYYYYYYYYYYYYYYYYYYY                 222
--                         YYYY                222
--                         YYYY               222
--                         YYYY             222
--                         YYYY           222
--                         YYYY         222
--                         YYYY        222
--  YYY                  YYYY        222
--   YYY                YYYY       222
--     YYYYYYYYYYYYYYYYYYY       2222222222222222
--      YYYYYYYYYYYYYYYY         2222222222222222
--
-- FEATURES
-- 1. Plugin manager: 'Vim-plug'
-- 2. Native LSP support: Clangd, CMake, Vimls, Bash, Pyright
-- 3. Floaterm for easy new terminal instance inside nvim (without closing editor)
-- 4. File manager: FFF (Fucking Fast File-manager), called with floatterm
-- 	                from inside of nvim.
-- 5. Theme: Ayu Mirage, Vim-Airline, Rainbow Bracket Colorizer
--
-- TO DO
-- 1. Implement native LSP : PHP
--
-- KEYMAPPINGS
-- Leader Key = Space
--
-- Visual Mode Indent-Highlighted-Target
--	- (+)Indent : Tab
--	- (-)Indent : Shift + Tab
--
-- Search Highlighting
-- 	- Toggle : Shift + h
--
-- Window (prefix: Ctrl+W)
--	- Navigation	: h,j,k,l
--		or	: Ctrl + (h,j,k,l)
--	- New win	: v,s
--	- quit win	: q
--
-- Tabs (prefix: Shift+T)
-- 	- Navigation : h,l
-- 	- New tab    : n
-- 	- Quit tab   : q
--
-- Buffer (prefix: Shift+B)
-- 	- Navigation	: h,l
-- 	- New buffer	: n
-- 	- Quit buffer	: q
--
-- Floaterm & FFF file manager (prefix: Leader)
-- 	- Open floaterm	: t
-- 	- Open FFF	: f
--
-- CMake (prefix: Leader)
-- 	- CMake generate : cg
-- 	- CMake build 	 : cb
--
-- LSP Autocompletion & Snippet (INSERT mode only)
-- 	- Go to: 1. Definition          : gd
-- 		 2. Declaration               : gD
-- 		 3. Implementation            : gi
-- 	- Scroll Up/Down                : Ctrl + n / Ctrl + p
-- 	- Confirm selection             : Tab
-- 	- Close snippets                : Ctrl + q
-- 	- Show hover documentation      : Shift + k
--         (target: word under cursor)
--
-- REQUIREMENTS :
-- - NeoVim >= 0.5.0	: 'https://github.com/neovim/neovim/releases'
--   (THIS IS A MUST HAVE, otherwise most of the plugins will not ork)
--
-- - Node		: 'sudo apt install node'
-- - Python >= 3.7	: 'sudo apt install python3'
-- - pip		: 'sudo apt install python3-pip'
-- - FFF file manager	: 'https://github.com/dylanaraps/fff' (install as root)
--
-- - LSPs (npm & apt have to install as root if you're using UNIX based OS)
--    1. Clangd >= 9.0	: 'apt install clangd'
--    2. CMake		: 'pip install cmake-language-server'
--    3. Vimls		: 'npm i -g vim-language-server'
--    4. Bashls		: 'npm i -g bash-language-server'
--                         'npm i -g bash-language-server vim-language-server'
--    5. Sumneko-Lua : Follow the installation guide from here, install it to your ~/bin :
--                      https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)

require('basic-settings')
require('packer-plugins-setup')

require('user-plugin-settings.setup-floaterm-fff')
require('user-plugin-settings.setup-vim_cmake')
require('user-plugin-settings.setup-nvim-tree')
require('user-plugin-settings.setup-telescope')
require('user-plugin-settings.setup-snippets')

require('LSP-TS-Compe.compe_config')
require('LSP-TS-Compe.lsp-diagnostic-setup')
require('LSP-TS-Compe.lsp-starters')
require('LSP-TS-Compe.tree-sitter-configs')

require('keymaps')

-- Setup theme (airline, main theme, etc)
require('my-themes').set_aurora()
--require('my-themes').set_monokai()
--require('my-themes').set_ayu("mirage")
--require('my-themes').set_tokyonight("night")
--require('my-themes').set_codedark()

-- For startup page
vim.cmd('source ~/.config/nvim/start-page.vim')
vim.cmd('autocmd VimEnter * call Start()')
