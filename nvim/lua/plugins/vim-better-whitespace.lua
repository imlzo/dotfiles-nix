-- vim-better-whitespace.lua
-- Config for vim-better-whitespace

local cmd = vim.cmd

-- Skip confirmation
vim.g.strip_whitespace_confirm = false

-- Only trim modified lines
vim.g.strip_only_modified_lines = true

-- Autocmd Strip on Save
cmd([[
  augroup StripWhitespaceOnSave
    autocmd!
    autocmd FileType lua EnableStripWhitespaceOnSave
    autocmd FileType c EnableStripWhitespaceOnSave
    autocmd FileType vim EnableStripWhitespaceOnSave
  augroup END

  augroup DisableWhitespaceInTerminal
    autocmd!
    autocmd TermOpen * DisableWhitespace
  augroup END
]])
