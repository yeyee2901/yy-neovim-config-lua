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
    lualine_b = {
      {'branch'},
      {
        'diff',
        colored = true,
        color_added = '#16f70a',
        color_modified = '#dff705',
        color_removed = '#f71b02',
        symbols = {added = '+', modified = '~', removed = '-'}
      },
    },
    lualine_c = {
      {
        'filename',
        path = 1    -- 1 = relative path
      },
      {
        'diagnostics',
        sources = {'nvim_lsp'},
        symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '},
        color_error = '#f71b02',
        color_warn = '#dff705',
        color_info = '#16f70a',
        color_hint = '#05d8f0',
      },
    },
    lualine_x = {
      {
        'filetype',
        colored = true
      },
      {
        'encoding'
      },
    },
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      { 'filename' },
    },
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },

  tabline = {
    lualine_a = {},
    lualine_b = {'branch'},
    lualine_c = {
      {
        'filename',
      },
      {
        'filetype',
        colored = true,
      }
    },
  },

  extensions = {}
}
return M
