--
-- Setup for aerial.nvim
-- https://github.com/stevearc/aerial.nvim/
--

require("aerial").setup({

  on_attach = function(bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>a', '<cmd>AerialToggle right<CR>', {})

    vim.api.nvim_buf_set_keymap(bufnr, 'n', '[[', '<cmd>AerialPrev<CR>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ']]', '<cmd>AerialNext<CR>', {})
  end

})


