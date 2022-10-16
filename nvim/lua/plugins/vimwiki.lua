-- vimwiki.lua
-- Configuration for vimwiki

local map = vim.api.nvim_set_keymap

-- Personal wiki
wiki_personal = {}
wiki_personal.syntax = 'markdown'
wiki_personal.ext = '.md'
wiki_personal.path = '$HOME/wiki'
wiki_personal.path_html = '$HOME/wiki_html'
wiki_personal.template_path = '$HOME/wiki/templates/'
wiki_personal.custom_wiki2html = 'wiki2html.sh'
wiki_personal.template_default = 'Github'
wiki_personal.template_ext = '.html5'
wiki_personal.automatic_nested_syntaxes = 1
wiki_personal.links_space_char = '-'
wiki_personal.auto_tags = 1
wiki_personal.auto_diary_index = 1
wiki_personal.auto_generate_links = 1
wiki_personal.diary_caption_level = 1

-- Work wiki
wiki_humane = {}
wiki_humane.syntax = 'markdown'
wiki_humane.ext = '.md'
wiki_humane.path = '$HOME/proj-humane/wiki-humane'
wiki_humane.path_html = '$HOME/wiki_html'
wiki_humane.template_path = '$HOME/wiki/templates/'
wiki_humane.custom_wiki2html = 'wiki2html.sh'
wiki_humane.template_default = 'Github'
wiki_humane.template_ext = '.html5'
wiki_humane.automatic_nested_syntaxes = 1
wiki_humane.links_space_char = '-'

-- Global setup
vim.g.vimwiki_global_ext = 0
vim.g.vimwiki_toc_header = 'TOC'
vim.g.vimwiki_toc_header_level = 2
vim.g.vimwiki_auto_chdir = 1
vim.g.vimwiki_auto_header = 1
vim.g.vimwiki_conceal_onechar_markers = 0

-- Registration
local user = os.getenv("USER")
if user == "eruesu" or user == "imlzo" then
  vim.g.vimwiki_list = { wiki_personal }
else
  vim.g.vimwiki_list = { wiki_humane, wiki_personal }
end

-- Text Wrap for Diary Files
vim.api.nvim_exec([[
augroup VimWikiDiaryTextWrap
  autocmd!
  autocmd FileType vimwiki setlocal filetype=vimwiki.markdown
  autocmd FileType vimwiki autocmd BufRead,BufNewFile,BufEnter **/diary/*.md
    \ setlocal textwidth=80 |
    \ setlocal colorcolumn=+1
augroup END
]], false)

-- Push / Pull Keymap
map('n', '<leader>wp', ':!vimwikipull<cr>', { noremap = true })
map('n', '<leader>wP', ':!vimwikipush<cr>', { noremap = true })
