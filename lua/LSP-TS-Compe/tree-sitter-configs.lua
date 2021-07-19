require('nvim-treesitter.configs').setup {
	ensure_installed = { "c", "cpp", "python", "php", "html", "javascript", "json", "lua", "cmake", "bash" }, 

        -- Enable syntax highlighting
	highlight = {
		enable = true,              

                -- Disable this to speed things up a bit
		additional_vim_regex_highlighting = false,
	},

	indent = {
		enable = true,
	}
}
