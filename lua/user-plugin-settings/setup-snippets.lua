local options = {
  UltiSnipsExpandTrigger = "<M-CR>",
  UltiSnipsJumpForwardTrigger= "<M-CR>",
  UltiSnipsJumpBackwardTrigger = "<M-BS>",
  UltiSnipsListSnippets = "<M-?>",
  UltiSnipsEditSplit = "vertical",
  UltiSnipsSnippetsDir = "~/.config/nvim/Snippets/",
}

for opt,val in pairs(options) do
	vim.g[opt] = val
end
