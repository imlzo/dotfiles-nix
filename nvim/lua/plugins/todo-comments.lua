--
-- todo-comments.lua  -- configuration for todo-comments plugins for telescope
--

require("todo-comments").setup {
  signs = false -- No gutter signs
};

-- Find TODOs within project
vim.keymap.set('n', '<leader>ctt', function()
  vim.api.nvim_command("TodoQuickFix")
end)

-- Find TODOs in file
vim.keymap.set('n', '<leader>ctf', function()
  local command = "TodoQuickFix " .. vim.fn.expand("%")
  vim.api.nvim_command(command)
end)

