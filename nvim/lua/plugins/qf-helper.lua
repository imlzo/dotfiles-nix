-- qf-helper.lua
-- Configuration for `qf-helper.nvim`

local map = vim.api.nvim_set_keymap

-- Configuration
require('qf_helper').setup {
  prefer_loclist = false,
  sort_lsp_diagnostics = true,
  quickfix = {
    autoclose = false,
    default_bindings = false,
    default_options = true,
    max_height = 20,
    min_height = 5,
    track_location = 'cursor',
  },
  loclist = {
    autoclose = false,
    default_bindings = false,
    default_options = true,
    max_height = 20,
    min_height = 5,
    track_location = 'cursor',
  },
}

-- <C-N> and <C-P> to navigate qf
map('n', '<leader>cn', '<cmd>cnext<CR>', { silent = true })
map('n', '<leader>cp', '<cmd>cprev<CR>', { silent = true })

-- Opening / Closing QF and Loc list
map('n', '<leader>cc', '<cmd>QFToggle!<CR>', { silent = true })
-- map('n', '<leader>wl', '<cmd>LLToggle!<CR>', { silent = true })

