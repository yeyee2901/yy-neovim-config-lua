require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'seoul256',
    component_separators = {'', ''},
    section_separators = {'', ''},
    disabled_filetypes = {}
  },
  sections = {

    -- A component must be a table, not sequential args
    lualine_a = {
      {
        'mode',
        icon = "Neoim",

      }
    },
    lualine_b = {
      {
        'filetype',
        colored = true
      },
      {
        'filename',
        path = 1,
      },
    },
    lualine_c = {
      {
        'diagnostics',
        sources = {'nvim_lsp'},
        symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '},
        color_error = '#ff0000',
        color_warn = '#dff705',
        color_info = '#16f70a',
        color_hint = '#05d8f0',
      },
    },
    lualine_x = {
      {
        'diff',
        colored = true,
        color_added = '#16f70a',
        color_modified = '#dff705',
        color_removed = '#ff0000',

        symbols = {added = ' 🞧 ', modified = ' ᐃ ', removed = ' ⊖ '}
      },
      {
        'branch'
      },
    },
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },

  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { { 'filename', path = 0 }, },
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },

  tabline = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
  },
}

-- Enable this if you like tabline
vim.cmd('source $HOME/.config/nvim/lua/themes/tabline.vim')
