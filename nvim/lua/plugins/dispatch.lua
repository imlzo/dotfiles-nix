--
-- dispatch.lua     -- options for dispatch
--

-- Don't load maps
vim.api.nvim_set_var("dispatch_no_maps", 1)

-- Disable tmux make. Prefer jobs
vim.api.nvim_set_var("dispatch_no_tmux_make", 0)
vim.api.nvim_set_var("dispatch_no_tmux_start", 0)

