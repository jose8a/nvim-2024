local cmd = vim.cmd

-- "-----------------------------------"
-- "Markdown: FileType SETTINGS
-- "..................................."
-- "
-- " set the appropriate filetype based on file extension"
-- " then, disable spellcheck for markdown files
-- " then, create shortcut to open MD files w/Brave Browser
-- " finally, set the colorscheme for Markdown files-only"
-- "-----------------------------------"
cmd([[
  augroup ft_markdown
    autocmd!

    autocmd BufNewFile,BufRead *.md set filetype=markdown
    autocmd BufNewFile,BufRead *.m*down set filetype=markdown

    autocmd BufRead,BufNewFile *.md setlocal nospell
    nmap <leader>o :!/Applications/Brave\ Browser.app/Contents/MacOS/Brave\ Browser %<CR>
    autocmd BufEnter *.md colorscheme onedark
  augroup END
]])


-- "-----------------------------------"
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

