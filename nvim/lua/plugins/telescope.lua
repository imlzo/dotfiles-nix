--
-- telescope.lua    - Configuration for telescope
--


--[[
-- Extensions
--]]

require('telescope').load_extension('heading')
require('telescope').load_extension('project')
require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')
require("telescope").load_extension('live_grep_args')
require("telescope").load_extension('luasnip')

local map = vim.api.nvim_set_keymap
local user = os.getenv("USER")
local actions = require "telescope.actions"
local fb_actions = require("telescope").extensions.file_browser.actions

--[[
-- General
--]]
map('n', '<leader>tt', "<cmd>Telescope<cr>", { noremap = true })
map('n', '<leader>ts', "<cmd>Telescope treesitter<cr>", { noremap = true })
map('n', '<leader>;;', '<cmd>Telescope commands<cr>', { noremap = true }) -- mneumonic - ; for Ex

--[[
-- Resume (Still picking favorites)
--]]
map('n', '<leader><leader>', "<cmd>Telescope resume<cr>", { noremap = true })
map('n', '<leader>tr', "<cmd>Telescope resume<cr>", { noremap = true })
map('n', '<leader>fr', "<cmd>Telescope resume<cr>", { noremap = true })

--[[
-- Files
--]]
-- "Do the right thing" find file
vim.keymap.set('n', '<leader>ff', function()
  local builtin = require("telescope.builtin")

  -- git_files (only if there's no lcd)
  if not vim.fn.haslocaldir() then
    local ok = pcall(builtin.git_files)
    if ok then
      return
    end
  end

  -- Default - find_files
  builtin.find_files()
end)

-- More find files
map('n', '<leader>FF', "<cmd>Telescope find_files<cr>", { noremap = true })   -- always call find_files

-- Find old files
map('n', '<leader>fo', "<cmd>Telescope oldfiles<cr>", { noremap = true })

-- Find by status
map('n', '<leader>fg', '<cmd>Telescope git_status<cr>', { noremap = true })
map('n', '<leader>fb', '<cmd>Telescope file_browser<cr>', { noremap = true })

-- Wiki Find
local wiki_dirs = {}
if user == "eruesu" then
  wiki_dirs = {"~/wiki" }
else
  wiki_dirs = {"~/wiki", "~/proj-humane/wiki-humane" }
end
vim.keymap.set('n', '<leader>fw', function()
  require('telescope.builtin').find_files({
    prompt_title = "Find Wiki",
    search_dirs = wiki_dirs,
    cwd = "~"
  })
end)

map('n', '<leader>c/', '<cmd>Telescope quickfix<cr>', { noremap = true })

-- Find dotfiles
local dotfiles_dir = vim.loop.os_homedir() .. "/dotfiles"
vim.keymap.set('n', '<leader>fd', function()
  require('telescope.builtin').find_files({
    prompt_title = "Find dotfiles",
    search_dirs = { dotfiles_dir },
    cwd = dotfiles_dir
  })
end)

-- Find nvim plugins
local plugins_dir = vim.fn.stdpath("data") .. "/site/pack/paqs/start"
vim.keymap.set('n', '<leader>fvp', function()
  require('telescope.builtin').find_files({
    prompt_title = "Find Neovim Packages",
    search_dirs = { plugins_dir },
    cwd = plugins_dir,
  })
end)

-- Find packages
local package_dirs = { "node_modules" }
vim.keymap.set('n', '<leader>fp', function()
  require('telescope.builtin').find_files({
    prompt_title = "Find Packages",
    search_dirs = package_dirs,
  })
end)


--[[
-- Search
--]]

-- Live grep CWD (w/ rg arguments)
map('n', '<leader>/', ':lua require("telescope").extensions.live_grep_args.live_grep_args()<cr>', { noremap = true })

-- Search selection in CWD
vim.keymap.set('v', '<leader>/', function()
  vim.cmd('noau normal! "vy"')
  text = vim.fn.getreg('v')
  require('telescope.builtin').grep_string({
    search = text
  })
end)

-- Search within current buffer
map('n', '<leader>sb', "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", { noremap = true })

-- search headings
map('n', '<leader>sh', '<cmd>Telescope heading theme=ivy<cr>', { noremap = true })

--[[
-- Buffers
--]]
map('n', '<leader>bb', '<cmd>Telescope buffers<cr>', { noremap = true })

--[[
-- Registers
--]]
map('n', '<leader>""', '<cmd>Telescope registers<cr>', { noremap = true })

--[[
-- Project
--]]
map('n', '<leader>pp', '<cmd>Telescope project<cr>', { noremap = true })

--[[
-- Help
--]]
map('n', '<leader>?', '<cmd>Telescope keymaps<cr>', { noremap = true })
map('n', '<leader>hh', '<cmd>Telescope help_tags<cr>', { noremap = true })

--[[
-- Setup
--]]
require("telescope").setup{
  defaults = {
    mappings = {
      n = {
        ['q'] = actions.close,                -- Close with q in normal

        -- Scroll results by page
        ["<C-f>"] = actions.results_scrolling_down,
        ["<C-b>"] = actions.results_scrolling_up,

        -- Open file in default application
        ["<C-o>"] = fb_actions.open,
      },
      i = {
        ["<C-u>"] = false,                    -- Override defaault to allow emacs style delete

        -- Scroll results by page
        ["<C-f>"] = actions.results_scrolling_down,
        ["<C-b>"] = actions.results_scrolling_up,

        -- Open file in default application
        ["<C-o>"] = fb_actions.open,
      }
    },
    layout_strategy = 'vertical',
    layout_config = {
      vertical = {
        width = 0.80,
        height = 0.80,
        prompt_position = 'top',
        preview_height = 0.35,
      },
    },
    sorting_strategy = "ascending",
    path_display = {
      shorten = { len = 10, exclude = { 0, -1, -2 } },
    },
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--hidden'
    }
  },
  pickers = {
    find_files = {
      find_command = {
        'rg',
        '--files',
        '--hidden',
        '--color=never',
        '--smart-case',
        '-g',
        '!.git',
        '-g',
        '!node_modules',
        '-g',
        '!.cache',
      }
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
    file_browser = {
        dir_icon = '/',
        hidden = true
    },
    live_grep_args = {
      auto_quoting = false
    }
  }
}

--[[
-- Prevent quote matching in prompt
--]]
vim.cmd([[
augroup TelescopePromptNoDelimitMate
  autocmd!
  autocmd BufEnter * autocmd FileType TelescopePrompt silent! DelimitMateOff
  autocmd BufLeave * autocmd FileType TelescopePrompt silent! DelimitMateOn
augroup end
]])

