--
-- nvim-projectconfig.lua   -- Config for nvim-projectconfig
-- Loads `~/.config/nvim/lua/projects/awesome.lua ` when opening directory `awesome`
--

require('nvim-projectconfig').setup({
  project_dir = "~/.config/nvim/lua/projects/",     -- keep within lua dir
  -- project_config contains list of projects with:
  -- - project path (lua regex or full path)
  -- - config (function or config filename)
  project_config={
    {
      path = ".*arcOS.*",
      config = function()
        require('projects.arcOS').setup()
      end
    },
  },
  silent = false,
})

