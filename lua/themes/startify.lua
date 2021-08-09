local split = vim.fn.split
local system = vim.fn.system

-- Custom header
vim.g["startify_custom_header"] = vim.fn["startify#pad"](
    split(system('fortune | cowsay'), '\n')
)
