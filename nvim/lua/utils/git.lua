--
-- git.lua      Module containing git utilities
--

local M = {}

--[[
-- Returns the parent git directory for directory or file specified by path
-- When `path` is `nil`, checks relative to current buffer
-- May return `nil` if path is not in git directory
--]]
M.git_directory = function(path)
  path = path or "%:p"
  path = vim.fn.expand(path)

  local parent_dir = ""
  if vim.fn.isdirectory(path) == 1 then
    parent_dir = path
  else
    parent_dir = vim.fn.fnamemodify(path, ":h")
  end

  -- Get parent git directory
  local git_dir = vim.fn.system('cd ' .. parent_dir .. '; git rev-parse --show-toplevel')
  local success = vim.api.nvim_get_vvar("shell_error") == 0

  if success then
    return vim.trim(git_dir)
  else
    return nil
  end
end


return M
