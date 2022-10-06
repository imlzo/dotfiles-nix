--
-- hop.lua - Configuration for nvim hop plugin
--

require('hop').setup()

vim.keymap.set('n', '<leader>hl', '<cmd>HopLine<cr>');
vim.keymap.set('n', '<leader>hL', '<cmd>HopLineMW<cr>');
vim.keymap.set('n', '<leader>hw', '<cmd>HopWord<cr>');
vim.keymap.set('n', '<leader>hW', '<cmd>HopWordMW<cr>');
vim.keymap.set('n', '<leader>hf', '<cmd>HopChar1<cr>');
vim.keymap.set('n', '<leader>h/', '<cmd>HopPattern<cr>');
