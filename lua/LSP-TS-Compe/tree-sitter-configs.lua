require('nvim-treesitter.configs').setup {
	ensure_installed = { "c", "cpp", "python", "php", "html", "javascript", "json", "lua", "cmake", "bash" }, 

	highlight = {
		enable = true,              
		additional_vim_regex_highlighting = false,
	},

	indent = {
		enable = true,
	}
}
