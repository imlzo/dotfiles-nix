--
-- nvim-terminal.lua    -- Configuration for nvim-terminal (filetype plugin)
--


require('terminal').setup()

--
-- Autogroup for ft=terminal to:
--    Hide ANSI character codes
--    Set readonly
--    Set buftype to nofile to allow exiting without saving
--
-- See also `rippager` shell script
--
vim.cmd([[
augroup FileTypeTerminal
    autocmd!
    autocmd FileType terminal set buftype=nofile
    autocmd BufEnter * autocmd FileType terminal
      \ setlocal concealcursor=nc |
      \ set readonly
    autocmd BufLeave * autocmd FileType terminal
      \ setlocal concealcursor="" |
      \ set noreadonly
augroup END
]])

