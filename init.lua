vim.g.mapleader = ","

-- initialze lazy.nvim (plugin manager)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
   "git",
   "clone",
   "--filter=blob:none",
   "https://github.com/folke/lazy.nvim.git",
   "--branch=stable", -- latest stable release
   lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
   "williamboman/mason.nvim",         -- part of lsp setup
   "williamboman/mason-lspconfig.nvim", -- part of lsp setup
   "neovim/nvim-lspconfig",          -- part of lsp setup
   'hrsh7th/vim-vsnip',
   'hrsh7th/vim-vsnip-integ',
   "hrsh7th/cmp-nvim-lsp",
   "hrsh7th/cmp-buffer",
   "hrsh7th/cmp-path",
   "hrsh7th/cmp-cmdline",
   "hrsh7th/nvim-cmp",
   {
      "nvim-treesitter/nvim-treesitter", 
      build = ":TSUpdate"
   },
   {
      "nvim-tree/nvim-tree.lua",
      version = "*",
      lazy = false,
      dependencies = {
         "nvim-tree/nvim-web-devicons",
      }
   },
   {
      'nvim-telescope/telescope.nvim', tag = '0.1.8',
      dependencies = { 
         'nvim-lua/plenary.nvim' 
      }
   },
   { 
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make' 
   },
   { 
     "catppuccin/nvim",
     name = "catppuccin",
     priority = 1000 
   },
   { 
     'echasnovski/mini.nvim', 
     version = '*' 
   },
})

-- Vim options
local opt = vim.opt
opt.number = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true

-- Keybindings
local opts = { silent = true, noremap = true }

-- Normal mode
-- Easier split navigation (ctrl+direction)
local map = vim.api.nvim_set_keymap
map("n", "<C-J>", "<C-W><C-J>", opts)
map("n", "<C-K>", "<C-W><C-K>", opts)
map("n", "<C-L>", "<C-W><C-L>", opts)
map("n", "<C-H>", "<C-W><C-H>", opts)

-- Easier split navigation (ctrl+direction)
map("n", "<C-S-J>", "<C-W><S-J>", opts)
map("n", "<C-S-K>", "<C-W><S-K>", opts)
map("n", "<C-S-L>", "<C-W><S-L>", opts)
map("n", "<C-S-H>", "<C-W><S-H>", opts)

-- Add extra mapping for splits
map("n", "<Leader>h", ":split<CR>", opts)
map("n", "<Leader>v", ":vsplit<CR>", opts)

-- Easier resizing of splits
map("n", "<C-UP>", "<C-W>+", opts)
map("n", "<C-DOWN>", "<C-W>-", opts)
map("n", "<C-LEFT>", "<C-W><", opts)
map("n", "<C-RIGHT>", "<C-W>>", opts)

-- Buffer cycle next and prev
map("n", "<C-N>", ":bnext<CR>", opts)
map("n", "<C-P>", ":bprevious<CR>", opts)

-- List all available buffers 
map("n", "<Leader>b", ":ls<CR>:b<Space>", opts)

-- Visual and select mode
-- Yank lines into secondary clipboard
map("v", "<leader>y", "\"+y", opts)

-- Left mouse release triggers copy to secondary clipboard
map("v", "<LeftRelease>", "\"+y", opts)

-- Terminal mode
-- Exit insert mode with esc in terminal window
map("t", "<ESC>", "<C-\\><C-N>", opts)
