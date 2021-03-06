require('nvim-treesitter.configs').setup {

	ensure_installed = "maintained",

	highlight = {
		enable = true,
    disable = { "markdown" },        -- ISSUE: Breaks everything in MD
		additional_vim_regex_highlighting = false,
	},

	indent = {
		enable = true,
	}
}
