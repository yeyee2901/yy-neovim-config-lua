-- All the keymaps specified here are for INSERT mode, since
-- we can only expand snippets in INSERT mode.
-- This also includes ListSnippets!
local options = {
  UltiSnipsExpandTrigger = "<M-CR>",
  UltiSnipsJumpForwardTrigger= "<M-CR>",
  UltiSnipsJumpBackwardTrigger = "<M-BS>",
  UltiSnipsListSnippets = "<M-?>",
  UltiSnipsEditSplit = "vertical",
}

for opt,val in pairs(options) do
	vim.g[opt] = val
end
