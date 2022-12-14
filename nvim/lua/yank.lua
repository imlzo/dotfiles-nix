-- yank.lua
-- Configurations for yanking text

local cmd = vim.cmd
local map = vim.api.nvim_set_keymap

-- Leader+Y to system clipboard
map('n', '<leader>y', '"*yy', { noremap = true })
map('v', '<leader>y', '"*y', { noremap = true })
map('n', '<leader>p', '"*p', { noremap = true })

-- Highlight on yank
cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]
