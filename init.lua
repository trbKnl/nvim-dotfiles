vim.g.mapleader = ","
vim.g.maplocalleader = ","

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
   'hrsh7th/vim-vsnip',
   'hrsh7th/vim-vsnip-integ',
   "hrsh7th/cmp-nvim-lsp",
   "hrsh7th/cmp-buffer",
   "hrsh7th/cmp-path",
   "hrsh7th/cmp-cmdline",
   "hrsh7th/nvim-cmp",
   "folke/zen-mode.nvim",
   { -- USE PURELY THIS PLUGIN TO INSTALL LANGUAGE SERVERS 
     -- :LspInfo 
     -- :LspInstall
       "mason-org/mason-lspconfig.nvim",
       opts = {
         automatic_enable = false,
         ensure_installed = {
           "ts_ls",
           "vue_ls",
           "pyright",
           -- add more here
         },
      },
       dependencies = {
           { "mason-org/mason.nvim", opts = {} },
           "neovim/nvim-lspconfig",
       },
   },
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
   {
     "lervag/vimtex",
     lazy = false,     -- we don't want to lazy load VimTeX
     -- tag = "v2.15", -- uncomment to pin to a specific release
     init = function()
       -- VimTeX configuration goes here, e.g.
       vim.g.vimtex_view_method = "zathura"
     end
   }
})

-- Configure LSP clients
-- h :lspconfig-all

-- Set default root markers for all clients
-- marks the beginning of a project, which is the folder which contains .git, can be overridden per language server
vim.lsp.config('*', {
  root_markers = { '.git' },
})

local vue_language_server_path = vim.fn.expand '$MASON/packages' .. '/vue-language-server' .. '/node_modules/@vue/language-server'
local vue_plugin = {
 name = '@vue/typescript-plugin',
 location = vue_language_server_path,
 languages = { 'vue' },
 configNamespace = 'typescript',
}

vim.lsp.config('vtsls', {
 settings = {
   vtsls = {
     tsserver = {
       globalPlugins = {
         vue_plugin,
       },
     },
   },
 },
 filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
})

vim.lsp.enable({'vtsls', 'vue_ls'})

--  LSP diagnostic options  (how errors are shown etc.)

vim.diagnostic.config({
  virtual_text = true,        -- inline text on the line
  signs = true,               -- gutter symbols
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

vim.keymap.set("n", "<leader>e", function()
  vim.diagnostic.open_float(nil, {
    scope = "cursor",
    focusable = false,
    border = "rounded",
  })
end, { silent = true })


-- All other Vim options
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

-- Start zen mode
map("n", "<leader>z", ":ZenMode<CR>", opts)
