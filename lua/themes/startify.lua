local split = vim.fn.split
local system = vim.fn.system

local what_does_the_cow_say = 'fortune -sn 80'

-- Custom header
vim.g["startify_custom_header"] = vim.fn["startify#pad"](
    split(system(what_does_the_cow_say .. ' | cowsay'), '\n')
)
