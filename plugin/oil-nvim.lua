require("oil").setup({
   -- Changed: turned off certain keymaps
   keymaps = {
    ["g?"] = "actions.show_help",
    ["<CR>"] = "actions.select",
    ["<C-s>"] = false, -- { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
    ["<C-h>"] = false, -- { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
    ["<C-t>"] = false, -- { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },
    ["<C-p>"] = false, -- "actions.preview",
    ["<C-c>"] = false, -- "actions.close",
    ["<C-l>"] = false, -- "actions.refresh",
    ["-"] = "actions.parent",
    ["_"] = "actions.open_cwd",
    ["`"] = "actions.cd",
    ["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory", mode = "n" },
    ["gs"] = "actions.change_sort",
    ["gx"] = "actions.open_external",
    ["g."] = "actions.toggle_hidden",
    ["g\\"] = "actions.toggle_trash",
  },
})

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
