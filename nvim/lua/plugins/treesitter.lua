--
-- treesitter.lua - Configuration for treesitter.
-- https://github.com/nvim-treesitter/nvim-treesitter
--

require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "bash",
    "c",
    "cpp",
    "css",
    "html",
    "javascript",
    "json",
    "lua",
    "markdown",
    "python",
    "rust",
    "tsx",
    "typescript",
  },
  -- highlight = {
  --   enable = false,
  --   use_languagetree = false,
  --   additional_vim_regex_highlighting = false,
  --   disable = { "markdown", "vimwiki" },
  -- },
  -- indent = {
  --   enable = true,
  --   disable = { "html" },
  -- },
}

vim.cmd([[
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
]])
