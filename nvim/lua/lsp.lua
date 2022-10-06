-- lsp.lua
-- Configuration for LSP

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Bindings for LSP
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'sgd', '<cmd>split | lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'vgd', '<cmd>vsplit | lua vim.lsp.buf.definition()<CR>', opts)

  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('n', '<space>rf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

  -- Aerial.nvim
  require("aerial").on_attach(client, bufnr)

end


--[[
-- Language Server Configuration
-- See https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
--]]

--
-- shared
--
local lsp_flags = {
  debounce_text_changes = 150,
}

--
-- tsserver
--
require('lspconfig')['tsserver'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
}

--
-- html
--
require('lspconfig').html.setup {
  on_attach = on_attach,
  flags = lsp_flags,
}

--
-- rust-analyzer
--
require('lspconfig').rust_analyzer.setup {
  on_attach = on_attach,
  flags = lsp_flags,
  settings = {
    ["rust-analyzer"] = {
      imports = {
        granularity = {
          group = "module",
        },
        prefix = "self",
      },
      cargo = {
        buildScripts = {
          enable = true,
        },
      },
      procMacro = {
        enable = true
      },
    }
  },
}

--
-- elixir-ls
--
require('lspconfig').elixirls.setup {
  cmd = { "/opt/homebrew/bin/elixir-ls" },
  on_attach = on_attach,
}

