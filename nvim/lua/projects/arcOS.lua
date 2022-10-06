--
-- arcOS.lua   -- Configuration for arcOS project
-- See also ~/.config/nvim/lua/plugins/nvim-projectconfig.lua
--

local M = {}

--[[
-- Setup module. This installs commands
--]]
M.setup = function(opts)
  vim.api.nvim_echo({ {'Loaded arcOS project config' } }, true, {})
  vim.cmd([[
    command! ArcOSMake lua require('projects.arcOS').make_arcOS()
    command! ArcOSBuildLog lua require('projects.arcOS').open_build_log()
  ]])
end

--[[
-- Trigger build of arcOS at path based on cwd.
--]]
M.make_arcOS = function()
  local function find_script_path()
    local cwd = vim.fn.getcwd()
    local script_name = 'setup-and-build.sh'

    local script_path = cwd .. '/' .. script_name
    if vim.fn.filereadable(script_path) == 1 then
      return script_path
    end

    local script_path = cwd .. '/LINUX/android/' .. script_name
    if vim.fn.filereadable(script_path) == 1 then
      return script_path
    end

    return nil
  end

  local script_path = find_script_path()
  if script_path then
    vim.cmd('Dispatch ' .. script_path)
  else
    vim.api.nvim_echo({ {'Could not find script', "WarningMsg" } }, true, {})
  end
end

--[[
-- Open .h4build_log into quickfix buffer
--]]
M.open_build_log = function()
  local log_path = vim.fn.expand('~/.h4build_log')
  if vim.fn.filereadable(log_path) == 1 then
    -- Load quickfix and focus back to editor
    vim.cmd('cfile ' .. log_path .. '| copen | wincmd p')
  else
    vim.api.nvim_echo({ {'Could not find ' .. log_path, "WarningMsg" } }, true, {})
  end
end

return M
