-- init.lua
-- Configuration for Neovim
--

--[[
-- Load module and notify errors
--]]
local function opt_require(module_name)
    local ok, moduleOrError = pcall(require, module_name)
    if not ok then
        vim.notify("*** Failed to load module '" .. module_name .. "'\n " .. moduleOrError)
        do return end
    end
    return moduleOrError
end

opt_require 'plugins'
opt_require 'options'
opt_require 'keymaps'
opt_require 'themes'
opt_require 'yank'
opt_require 'directory'
opt_require 'lsp'
opt_require 'sessions'

-- TODO: Add init.lua to plugins dir
opt_require 'plugins.telescope'
opt_require 'plugins.vimwiki'
opt_require 'plugins.vim-better-whitespace'
opt_require 'plugins.qf-helper'
opt_require 'plugins.vim-markdown'
opt_require 'plugins.delimitmate'
opt_require 'plugins.lightline'
opt_require 'plugins.todo-comments'
opt_require 'plugins.nvim-terminal'
opt_require 'plugins.luapad'
opt_require 'plugins.comments'
opt_require 'plugins.fugitive'
opt_require 'plugins.nvim-projectconfig'
opt_require 'plugins.dispatch'
opt_require 'plugins.luasnip'
opt_require 'plugins.treesitter'
opt_require 'plugins.hop'
opt_require 'plugins.aerial'
