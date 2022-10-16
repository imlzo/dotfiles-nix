--
-- plugins.lua - Neovim plugins
-- Packer - https://github.com/wbthomason/packer.nvim
--

local p = require('packer')

-- Packer
p.startup(function(use)
  use 'wbthomason/packer.nvim'

  -- editor
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'ntpeters/vim-better-whitespace'
  use 'tpope/vim-repeat'
  use 'Raimondi/delimitMate'
  use 'tpope/vim-unimpaired'
  use 'stevearc/qf_helper.nvim'
  use 'L3MON4D3/LuaSnip'
  use 'folke/todo-comments.nvim'
  use 'dylanaraps/root.vim'
  use 'AndrewRadev/bufferize.vim'
  use 'numToStr/Comment.nvim'
  use 'tpope/vim-dispatch'
  use 'windwp/nvim-projectconfig'
  use 'phaazon/hop.nvim'
  use 'rafcamlet/nvim-luapad'
  use 'stevearc/aerial.nvim'

  -- theme
  use 'morhetz/gruvbox'
  use 'folke/tokyonight.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }
  use 'itchyny/lightline.vim'

  -- git
  use 'tpope/vim-fugitive'

  -- lsp / ts
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use 'neovim/nvim-lspconfig'

  -- filetypes
  use 'tpope/vim-markdown'
  use 'mracos/mermaid.vim'
  use 'thinca/vim-logcat'
  use 'rust-lang/rust.vim'
  use 'norcalli/nvim-terminal.lua'
  use 'rhysd/vim-wasm'
  use 'LnL7/vim-nix'

  -- web
  use 'mattn/emmet-vim'
  use 'alvan/vim-closetag'

  -- telescope
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-project.nvim'
  use 'crispgm/telescope-heading.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'nvim-telescope/telescope-live-grep-args.nvim'
  use 'benfowler/telescope-luasnip.nvim'

  -- wiki
  use 'vimwiki/vimwiki'
  use 'mattn/calendar-vim'

end)

vim.cmd([[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])


