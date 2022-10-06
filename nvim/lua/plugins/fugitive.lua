--
-- fugitive.lua   -- Config for fugitive
--

-- Clean straggling fugitive buffers
vim.cmd([[
augroup FugitiveCleanBuf
  autocmd!
  autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END
]])
