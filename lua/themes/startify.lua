local split = vim.fn.split
local system = vim.fn.system


-- Randomize header
math.randomseed(os.time())
local fonts_list = {
  "3d.flf",
  "pagga.tlf",
  "mono9.tlf",
  "Bloody.flf",
  "ANSI Shadow.flf",
  "maxiwi.flf",
}
local words_list = {
  "Foo!",
  "Bar!",
  "Neovim",
  "yeyee",
  "Sus~",
  "Bruh..",
}
local choice = math.random(1, table.getn(fonts_list))
local font_choice = fonts_list[choice]

local choice = math.random(1, table.getn(words_list))
local word_choice = words_list[choice]


-- Cowsay as header
local what_does_the_cow_say = 'fortune -sn 80 | cowsay'


-- Apply header randomly (either cowsay / font)
if math.random(1,2) == 1 then
  vim.g["startify_custom_header"] = vim.fn["startify#pad"](
    split(system('figlet -w 60 -f /usr/share/figlet/fonts/"'..font_choice..'" '..word_choice), '\n')
  )

else
  vim.g["startify_custom_header"] = vim.fn["startify#pad"](
    split(system(what_does_the_cow_say), '\n')
  )
end
