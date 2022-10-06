--
-- sessions.lua - Plugin configuration for sessions.nvim
--
local git = require "utils.git"

local set = vim.keymap.set

local session_filename = ".session.vim"

--
-- Returns the directory to store session file to
--
function get_relative_session_dir()
  git_dir = git.git_directory()
  if git_dir then
    return git_dir
  else
    return vim.fn.stdpath('data')
  end
end

--
-- Returns the session file to save / load relative to buf
--
function get_relative_session_file()
  return get_relative_session_dir() .. '/' .. session_filename
end

set('n', '<leader>ss', function()
  local file = get_relative_session_file()
  vim.cmd("mksession! " .. file)
  vim.api.nvim_echo({ { 'Saved session' .. file } }, true, {})
end);

set('n', '<leader>sl', function()
  local file = get_relative_session_file()
  if not vim.fn.filereadable(file) == TRUE then
    vim.api.nvim_echo({ {'No session found', "WarningMsg" } }, true, {})
    return
  end
  vim.cmd("source " .. get_relative_session_file())
  vim.api.nvim_echo({ {'Loaded session' .. file } }, true, {})
end);
