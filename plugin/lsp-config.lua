require("mason").setup()
require("mason-lspconfig").setup()

-- mason-lspconfig
-- checkout docs how to install language servers
-- h: lspconfig-all

-- python: pyright
require'lspconfig'.pyright.setup{}

-- elixir 
require'lspconfig'.lexical.setup{
   cmd = {"/home/turbo/.local/share/nvim/mason/bin/lexical"}
}

-- typescript
require'lspconfig'.ts_ls.setup{}

-- elixir: elixir-ls
--capabilities = require("cmp_nvim_lsp").default_capabilities()
--require'lspconfig'.elixirls.setup{
--   cmd = {"/home/turbo/.local/share/nvim/mason/bin/elixir-ls"},
--   capabilities = capabilities,
--   on_attach = on_attach,
--}




---- lsp and complete settings
---- Mappings.
---- See `:help vim.diagnostic.*` for documentation on any of the below functions
--local opts = { noremap=true, silent=true }
----vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
--    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
--    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
--    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
--
---- Use an on_attach function to only map the following keys
---- after the language server attaches to the current buffer
--local on_attach = function(client, bufnr)
--  -- Enable completion triggered by <c-x><c-o>
--  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
--
--  -- Mappings.
--  -- See `:help vim.lsp.*` for documentation on any of the below functions
--  local bufopts = { noremap=true, silent=true, buffer=bufnr }
--  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
--  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
--  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
--  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
--  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
--  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
--  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
--  vim.keymap.set('n', '<space>wl', function()
--    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--  end, bufopts)
--  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
--  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
--  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
--  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
--  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
--end
--
--local lsp_flags = {
--  -- This is the default in Nvim 0.7+
--  debounce_text_changes = 150,
--}
--
--require'lspconfig'.pyright.setup{
--    on_attach = on_attach,
--    flags = lsp_flags,
--}
--
--require'lspconfig'.elixirls.setup{
--   cmd = { "/home/turbo/.config/elixirls/elixir-ls-v0.24.1/language_server.sh" };
--}
----require'lspconfig'.tsserver.setup{
----}
--
--require'lspconfig'.volar.setup {
--  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
--  init_options = {
--    vue = {
--      hybridMode = false,
--    },
--  },
--}
