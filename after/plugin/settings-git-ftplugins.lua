-- "-----------------------------------"
-- Local LUA aliases
-- "-----------------------------------"
local cmd = vim.cmd
local user_cmd = vim.api.nvim_create_user_command
local set = vim.opt
local map = vim.api.nvim_set_keymap
local options = { noremap = true }


-- "-----------------------------------"
-- " Ack mappings
-- "-----------------------------------"
map('n', '<leader>ak', ':Ack!<space>', options)


-- "-----------------------------------"
-- " Fugitive mappings
-- "-----------------------------------"
map('n', '<leader>gd', ':Gdiff<cr>', options)
map('n', '<leader>gs', ':Gstatus<cr>', options)
map('n', '<leader>gw', ':Gwrite<cr>', options)
map('n', '<leader>ga', ':Gadd<cr>', options)
map('n', '<leader>gb', ':Gblame<cr>', options)
map('n', '<leader>gco', ':Gcheckout<cr>', options)
map('n', '<leader>gci', ':Gcommit<cr>', options)
map('n', '<leader>gm', ':Gmove<cr>', options)
map('n', '<leader>gr', ':Gremove<cr>', options)
map('n', '<leader>gl :Shell git gl -18<cr>:wincmd', '|<cr>', options)

vim.cmd([[
  augroup ft_fugitive
      autocmd!

      autocmd BufNewFile,BufRead .git/index setlocal nolist
  augroup end
]])

vim.cmd([[
  augroup gitsigns
    au!

    autocmd FileType * highlight GitSignsAdd guibg=NONE
  augroup end
]])


-- "gitHub
map('n', '<leader>H', ':Gbrowse<cr>', options)
map('v', '<leader>H', ':Gbrowse<cr>', options)


-- " 'Fenced' markdown syntax highlighting
-- "   }--> ensure syntax highlighting for 'fenced' code in Markdown files
-- "
-- "   NOT NEEDED IF TPOPE's vim-markdown plugin is installed.  All recent Vim
-- "   versions now include this plugin
-- "-----------------------------------"
vim.g.vim_markdown_fenced_languages = {
  'css',
  'erb=eruby',
  'javascript',
  'js=javascript',
  'json=javascript',
  'ruby',
  'sass',
  'xml',
  'html'
}

vim.g.vim_markdown_folding_style_pythonic = 1
vim.g.vim_markdown_toc_autofit = 1
vim.g.vim_markdown_folding_level = 4

