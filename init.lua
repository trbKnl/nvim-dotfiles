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
    "ellisonleao/gruvbox.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "tpope/vim-surround",
    "tpope/vim-repeat",
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
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        dependencies = { 
            'nvim-lua/plenary.nvim' 
        }
    },
    {
      "cuducos/yaml.nvim",
      ft = { "yaml" }, -- optional
      dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-telescope/telescope.nvim", -- optional
      },
    }
})

-- Vim options
local opt = vim.opt
opt.number = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true

-- Keybindings
local silent = { silent = true, noremap = true }

-- Normal mode
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

-- Visual and select mode
-- Yank lines into secondary clipboard
map("v", "<leader>y", "\"+y", silent)

-- Left mouse release triggers copy to secondary clipboard
map("v", "<LeftRelease>", "\"+y", silent)

-- Terminal mode
-- Exit insert mode with esc in terminal window
map("t", "<ESC>", "<C-\\><C-N>", silent)

