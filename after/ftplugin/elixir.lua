-- Elixir specific vim options
vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

-- See: pythonrepl-vimscript.lua
local silent = { silent = true, noremap = true }
local map = vim.api.nvim_set_keymap

-- Send "end" to terminal buffer
map("n", "<C-E>", ":call SendStringTermBuf('end')<CR>", silent)

-- Start iex repl
map("n", "<leader>es", ":call StartRepl('iex')<CR>", silent)

-- Start mix repl
map("n", "<leader>ms", ":call StartRepl('iex -S mix')<CR>", silent)

-- Format the current buffer, with mix format
map("n", "<leader>ef", ":!mix format %<CR><CR>", silent)
