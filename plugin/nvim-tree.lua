-- nvim-tree.lua

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
      mappings = {
          custom_only = false,
          list = {
              { key = "u", action = "dir_up" },
              { key = "l", action = "edit", action_cb = edit_or_open },
              { key = "L", action = "vsplit_preview", action_cb = vsplit_preview },
              { key = "h", action = "close_node" },
              { key = "H", action = "collapse_all", action_cb = collapse_all }
          }
      },
  },
  actions = {
      open_file = {
          quit_on_open = false
      }
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

vim.api.nvim_set_keymap("n", "<C-t>", ":NvimTreeToggle<cr>" ,{silent = true, noremap = true})
