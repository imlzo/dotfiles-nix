-- theme.lua
-- Visual settings

local opt = vim.opt
local cmd = vim.cmd

-- gruvbox
-- opt.background = "dark"
-- cmd('colorscheme gruvbox')

-- tokyonight
-- cmd('colorscheme tokyonight-night')

-- catppuccin
require("catppuccin").setup()
vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
vim.cmd [[colorscheme catppuccin]]


-- Cursorline on current buffer
cmd([[
    augroup Cursorline
        autocmd!
        autocmd VimEnter,WinEnter,BufWinEnter   * setlocal cursorline
        autocmd WinLeave                        * setlocal nocursorline
    augroup END
]])

