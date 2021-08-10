-- For some reason, calling ExpandTrigger,
-- will make nvim-compe completion behave
-- like a UltiSnips placeholder.
-- So we can make type functions completions behave like 
-- UltiSnips snippets
local options = {
  UltiSnipsExpandTrigger = "<M-CR>",
  UltiSnipsJumpForwardTrigger= "<M-CR>",
  UltiSnipsJumpBackwardTrigger = "<M-BS>",
  UltiSnipsListSnippets = "<C-?>",
  UltiSnipsEditSplit = "vertical",
}

for opt,val in pairs(options) do
	vim.g[opt] = val
end
