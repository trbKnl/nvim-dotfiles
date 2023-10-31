vim.g.mapleader = ","

require("packer-plugins")

-- Vim options
local opt = vim.opt
opt.number = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true

-- Keybindings
local silent = { silent = true, noremap = true }

-- Easier split navigation (ctrl+direction)
local map = vim.api.nvim_set_keymap
map("n", "<C-J>", "<C-W><C-J>", silent)
map("n", "<C-K>", "<C-W><C-K>", silent)
map("n", "<C-L>", "<C-W><C-L>", silent)
map("n", "<C-H>", "<C-W><C-H>", silent)

-- Remap splits
map("n", "<C-W>h", "<C-W>s", silent)

-- Easier resizing of splits
map("n", "<C-UP>", "<C-W>+", silent)
map("n", "<C-DOWN>", "<C-W>-", silent)
map("n", "<C-LEFT>", "<C-W><", silent)
map("n", "<C-RIGHT>", "<C-W>>", silent)

-- List all available buffers 
map("n", "<Leader>b", ":ls<CR>:b<Space>", silent)

-- Buffer cycle next and prev
map("n", "<C-N>", ":bnext<CR>", silent)
map("n", "<C-P>", ":bprevious<CR>", silent)

-- Exit insert mode with esc in terminal window
map("t", "<ESC>", "<C-\\><C-N>", silent)

