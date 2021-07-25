local M = {}

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'nightfly',
    component_separators = {'', ''},
    section_separators = {'', ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    --lualine_d = {'diff'},    -- BUG!
    lualine_x = {
      {
        'filetype',
        colored = true
      },
      'encoding'
    },
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {},
    lualine_b = {'branch'},
    lualine_c = {'filename',{ 'filetype', colored = true }},
  },

  extensions = {}
}
return M
