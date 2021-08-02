local options = {
  nvim_tree_side = 'left',
  nvim_tree_width = 27,

  nvim_tree_ignore = {
    '.git',
    'node_modules',
    '.cache',
    '__pycache__'
  },

  nvim_tree_gitignore = false,
  nvim_tree_auto_open = false,
  nvim_tree_auto_close = false,
  nvim_tree_auto_ignore_ft = { "png", "jpeg", "jpg", "gif" },
  nvim_tree_quit_on_open = false,
  nvim_tree_follow = true,
  nvim_tree_indent_markers = false,
  nvim_tree_hide_dotfiles = false,
  nvim_tree_git_hl = true,
  nvim_tree_highlight_opened_files = false,
  nvim_tree_root_folder_modifier = ':~',
  nvim_tree_tab_open = false,
  nvim_tree_auto_resize = false,
  nvim_tree_disable_netrw = true,
  nvim_tree_hijack_netrw = true,
  nvim_tree_add_trailing = true,
  nvim_tree_group_empty = false,
  nvim_tree_lsp_diagnostics = false,
  nvim_tree_disable_window_picker = false,
  nvim_tree_hijack_cursor = true,
  nvim_tree_icon_padding = ' ',
  nvim_tree_update_cwd = 1,

  nvim_tree_icons = {
    default = "" ,
    symlink = "" ,

    git = {
      unstaged = "✗",
      staged = "✓",
      unmerged = "",
      renamed = "➜",
      untracked = "★",
      deleted = "",
      ignored = "◌"
    },

    folder = {
      arrow_open = "",
      arrow_closed = "",
      default = "",
      open = "",
      empty = "",
      empty_open = "",
      symlink = "",
      symlink_open = "",
    },

    lsp = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  }
}

for opt,val  in pairs(options) do
  vim.g[opt] = val
end
