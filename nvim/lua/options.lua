-- options.lua
-- Settings for Neovim

local opt = vim.opt
local cmd = vim.cmd

-- Search is case insensitive by default, unless term contains uppercase
opt.ignorecase = true
opt.smartcase = true

-- blink instead of beeping
opt.visualbell = true

-- Split below + Split right by default
opt.splitbelow = true
opt.splitright = true

--- MS for non-edited swapfile to be written to disk.
opt.updatetime = 500

-- Always show last status line
opt.laststatus = 2

-- Indentation
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

-- Line numbers
opt.number = true

-- Wildmenu Ignore
opt.wildignore = {
    '*.o',
    '*.bak',
    '*.swp',
}

-- Persistant undo
opt.undofile = true

-- Sequence timeout
opt.timeoutlen = 500 -- default is 1000 (1s)

-- Program for `:grep`
opt.grepprg = "rg --vimgrep --smart-case --follow --hidden"

-- Allow virtual edit for block
opt.virtualedit = "block"

-- netrw options
vim.g.netrw_banner = false

-- Ss
opt.signcolumn = 'yes'

-- fold. See also treesitter.lua
opt.foldlevelstart = 99

