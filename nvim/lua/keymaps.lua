-- keymap.lua
-- Neovim Keymaps

local map = vim.api.nvim_set_keymap
local job = require('plenary.job')


-- leader key
vim.g.mapleader = ' '

--- Disable Ex mode keymap
map('n', 'Q', '<nop>', { noremap = true, silent = true });

-- jk to escape insert mode
map('i', 'jk', '<esc>', { noremap = true })

-- Swap `;` and `:`
map('n', ':', ';', { noremap = true })
map('n', ';', ':', { noremap = true })
map('v', ':', ';', { noremap = true })
map('v', ';', ':', { noremap = true })

-- In normal mode, ESC
map('n', '<leader>th', ':set hlsearch!<cr>', { noremap = true })

-- Pane Navigation
-- map('n', '<C-H>', '<C-W><C-H>', { noremap = true })
-- map('n', '<C-J>', '<C-W><C-J>', { noremap = true })
-- map('n', '<C-K>', '<C-W><C-K>', { noremap = true })
-- map('n', '<C-L>', '<C-W><C-L>', { noremap = true })

-- Search cword w/o jump
map('n', '*',
    '<cmd>let @/ = expand(\'<cword>\') | set hlsearch<CR>',
    { noremap = true, silent = true })

-- Insert mode undo breakpoints
map('i', '.', '<C-G>u.', { noremap = true })
map('i', ',', '<C-G>u,', { noremap = true })
map('i', '!', '<C-G>u!', { noremap = true })
map('i', '?', '<C-G>u?', { noremap = true })


--[[
-- Git
--]]
map('n', '<leader>gs', ':Git<cr>', { noremap = true })
map('n', '<leader>gd', ':Gvdiffsplit<cr>', { noremap = true })
map('n', '<leader>gll', ':Gclog<cr>', { noremap = true })
map('n', '<leader>glf', ':Telescope git_bcommits<cr>', { noremap = true })
map('n', '<leader>gb', ':Git blame<cr>', { noremap = true })
map('n', '<leader>gp', ':Git pull<cr>', { noremap = true })
map('n', '<leader>gpu', ':Git push<cr>', { noremap = true })
map('n', '<leader>gf', ':Git fetch<cr>', { noremap = true })
map('n', '<leader>ge', ':Gedit<cr>', { noremap = true })
map('n', '<leader>gco', ':Git checkout ', { noremap = true })
-- Add current file and commit
vim.keymap.set('n', '<leader>gcc', function()
  vim.cmd("Git add %")
  vim.cmd("Git commit")
end)

-- Quitting
map('n', '<leader>qq', ':qall<cr>', { noremap = true })

-- Buffers
map('n', '<leader>bn', ':bnext<cr>', { noremap = true })    -- buffer next
map('n', '<leader>bp', ':bprev<cr>', { noremap = true })    -- buffer prev
map('n', '<leader>bm', ':bmod<cr>', { noremap = true })     -- open modified buffer
map('n', '<leader>bd', ':bdelete<cr>', { noremap = true })  -- buffer delete
map('n', '<leader>xx', ':bdelete<cr>', { noremap = true })  -- buffer delete alternative
map('n', '<leader><tab>', '<C-^>', { noremap = true })      -- TAB across buffers

-- Tabs
map('n', '<leader>tn', ':tabnext<cr>', { noremap = true })  -- tab next
map('n', '<leader>tp', ':tabprev<cr>', { noremap = true })  -- tab prev
map('n', '<leader>td', ':tabclose<cr>', { noremap = true }) -- tab delete
map('n', '<leader>tc', ':tabnew<cr>', { noremap = true })   -- tab new

--[[
-- Messages
--]]
-- Open a buffer containing messages.
map('n', '<leader>mm', ':Bufferize messages<cr>', { noremap = true })

--[[
-- Terminal
--]]

-- Open vim wd in terminal
map('n', '<leader>\"', ':split | terminal zsh<cr>i', { noremap = true })

-- Open directory relative to current file in terminal
map('n', '<leader>\'', ':split | lcd %:p:h | terminal zsh<cr>i', { noremap = true })

-- Terminal: ESC / jk to escape terminal mode
map('t', 'jk', '<C-\\><C-n>', { noremap = true })
map('t', '<esc>', '<C-\\><C-n>', { noremap = true })

--[[
-- Toggle
--]]
-- Text Wrap
vim.cmd([[
" Toggle text wrap
function! ToggleWrap()
  set wrap!
  if &colorcolumn == ""
      set colorcolumn=+1
  else
      set colorcolumn=
  endif
endfunction

command! ToggleWrap :call ToggleWrap()
nnoremap <leader>tw :ToggleWrap<cr>
]])
-- Spell
vim.keymap.set('n', '<leader>sp', ":set spell!<cr>")


--[[
-- Visual Drag
--]]
map('v', 'J', ':move \'>+1<cr>gv=gv', { noremap = true })
map('v', 'K', ':move \'<-2<cr>gv=gv', { noremap = true })


--[[
-- Open
--]]

-- Open file
map('n', '<leader>oo', '<cmd>!open %<cr>', { noremap = true, silent = true })

-- Open directory
map('n', '<leader>od', '<cmd>!open %:p:h<cr>', { noremap = true, silent = true })

-- Open blog post
-- TODO: Move to dedicated keymap for `blog` proj, maybe
map('n', '<leader>op', '<cmd>!open %<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>op', function()
  local post_name = vim.fn.expand("%:p:t:r")
  local post_url = "http://localhost:8080/posts/" .. post_name
  vim.api.nvim_command('!open ' .. post_url)
end)


-- Open git directory
vim.keymap.set('n', '<leader>og', function()
  git_dir = require("utils.git").git_directory()
  if git_dir then
    vim.api.nvim_command('!open ' .. git_dir)
  else
    vim.api.nvim_echo({ {'Could not find git directory', "WarningMsg" } }, true, {})
  end
end)

-- Open in chrome
map('n', '<leader>oc', '<cmd>!open -a "Google Chrome" %<cr>', { noremap = true, silent = true })

--[[
-- Reload this file for plugin dev
--]]
vim.keymap.set('n', "<space>s<space>s", function()
  local path = vim.fn.expand('%:p')
  vim.api.nvim_echo({ { 'Reloaded ' .. path } }, true, {})
  vim.cmd("source " .. path)
end)

--[[
-- Foldmethods
--]]
map('n', '<leader>fmm', ':set foldmethod=marker<cr>', { noremap = true, silent = false })
map('n', '<leader>fmi', ':set foldmethod=indent<cr>', { noremap = true, silent = false })
map('n', '<leader>fme', ':set foldmethod=expr<cr>', { noremap = true, silent = false })
map('n', '<leader>fms', ':set foldmethod=syntax<cr>', { noremap = true, silent = false })

--[[
-- Jira
--]]

vim.keymap.set('n', '<leader>jo', function()
  local line = vim.trim(vim.fn.getline("."))
  job:new({
    command = 'open_jira',
    args = { line },
    on_exit = function(j, return_val)
      print(vim.inspect(j:result()))
    end,
  }):sync()
end)

vim.keymap.set('v', '<leader>jo', function()
  vim.cmd('noau normal! "vy"')
  text = vim.fn.getreg('v')
  job:new({
    command = 'open_jira',
    args = { text },
    on_exit = function(j, return_val)
      print(vim.inspect(j:result()))
    end,
  }):sync()
end)
