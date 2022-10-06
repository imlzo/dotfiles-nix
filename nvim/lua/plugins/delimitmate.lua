-- delimitMate.lua
-- Configuration for delimitMate

vim.api.nvim_exec([[
augroup DelimitMateHTML
  autocmd!
  autocmd FileType html let b:delimitMate_matchpairs = "(:),[:],{:}"
augroup END
]], false)

