--
-- directory.lua    -- Managing working directory
--

-- TODO: Why doesn't nonsilent keymaps get echoed to msg?
local function loud_lcd(dir)
  vim.api.nvim_echo({ {':lcd ' .. dir } }, true, {})
  vim.cmd('lcd ' .. dir)
end

--[[
-- "Do the right thing" cd
-- cd to parent directory for buffer, or git directory for buffer if there is one
--]]
vim.keymap.set('n', '<leader>dd', function()
  -- Parent of current buffer
  buf_dir = vim.fn.expand("%:p:h")

  -- Get parent git directory if it exists
  git_dir = require('utils.git').git_directory(buf_dir)
  if git_dir then
    dest_dir = git_dir
  else
    dest_dir = buf_dir
  end

  loud_lcd(dest_dir)
end)

--[[
-- CD to directory containing file
--]]
vim.keymap.set('n', '<leader>d.', function()
  -- Parent of current buffer
  dest_dir = vim.fn.expand("%:p:h")
  loud_lcd(dest_dir)
end)

--[[
-- Open netrw ("navigate"). Combine with <leader> d. to change wd
--]]
vim.keymap.set('n', '<leader>do', function()
  vim.cmd('Explore')
end)

--[[
-- Change directory to parent
--]]
vim.keymap.set('n', '<leader>dp', function()
  -- Parent of current buffer
  local wd = vim.fn.getcwd()
  local parent_dir = vim.fn.fnamemodify(wd, ":h")
  loud_lcd(parent_dir)
end)

