-- "-----------------------------------"
-- Local LUA aliases
-- "-----------------------------------"
-- local autocmd = vim.api.nvim_create_autocmd
local cmd = vim.cmd
local user_cmd = vim.api.nvim_create_user_command
local set = vim.opt
local map = vim.api.nvim_set_keymap
local options = { noremap = true }


-- "-----------------------------------"
-- " Mappings and Autocommands
-- "-----------------------------------"
-- " Automatically change current directory to that of the file in the buffer
-- autocmd BufEnter * cd %:p:h
cmd([[ autocmd BufEnter * cd %:p:h ]])

-- " Map escape key to jj -- much faster
-- imap jj <esc>
vim.keymap.set('i', 'jj', '<esc>')

-- autocmd FocusLost * :wa              " Saves file when Vim window loses focus
cmd([[ autocmd FocusLost * :wa ]])

-- " Mapping for commenting out lines in javascript or python
-- :autocmd FileType javascript nnoremap <buffer> <leader>cc I//<esc>
-- :autocmd FileType python     nnoremap <buffer> <leader>cc I#<esc>
cmd([[ autocmd FileType javascript nnoremap <buffer> <leader>cc I//<esc> ]])
cmd([[ autocmd FileType python     nnoremap <buffer> <leader>cc I#<esc> ]])

-- " Automatically strip trailing spaces on Save
-- autocmd BufWritePre * :%s/\s\+$//e
cmd([[ autocmd BufWritePre * :%s/\s\+$//e ]])


-- "-----------------------------------"
-- " NEOGEN Mappings
-- "
-- "   <leader>nf: function (default)
-- "   <leader>nc: class
-- "   <leader>nt: type
-- "   <leader>nm: file/module
-- "-----------------------------------"
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<Leader>nf", ":lua require('neogen').generate()<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>nc", ":lua require('neogen').generate({ type = 'class' })<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>nm", ":lua require('neogen').generate({ type = 'file' })<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>nt", ":lua require('neogen').generate({ type = 'type' })<CR>", opts)



-- "-----------------------------------"
-- " QUICKLY FORCE filetypes for some files
-- "-----------------------------------"
map('n', '<leader>sj', ':setf javascript<cr>', options)
map('n', '<leader>sh', ':setf html<cr>', options)
map('n', '<leader>sm', ':setf markdown<cr>', options)
map('n', '<leader>sv', ':setf vue<cr>', options)


-- "-----------------------------------"
-- " NATIVE VIM COMPLETION
-- "-----------------------------------"
-- " whole lines
vim.keymap.set('i', '<tab>yl', '<C-x><C-l>')
vim.keymap.set('i', '<leader>xl', '<C-x><C-l>')

-- " omni-completion
vim.keymap.set('i', '<tab>yo', '<C-x><C-o>')
vim.keymap.set('i', '<leader>xo', '<C-x><C-o>')

-- " tags
vim.keymap.set('i', '<tab>y]', '<C-x><C-]>')
vim.keymap.set('i', '<leader>x]', '<C-x><C-]>')

-- " file names
vim.keymap.set('i', '<tab>yf', '<C-x><C-f>')
vim.keymap.set('i', '<leader>xf', '<C-x><C-f>')

-- " defs or macros
vim.keymap.set('i', '<tab>yd', '<C-x><C-d>')
vim.keymap.set('i', '<leader>xd', '<C-x><C-d>')

-- " vim command-line
vim.keymap.set('i', '<tab>yv', '<C-x><C-v>')
vim.keymap.set('i', '<leader>xv', '<C-x><C-v>')

-- " keywords curr file
vim.keymap.set('i', '<tab>yn', '<C-x><C-n>')
vim.keymap.set('i', '<leader>xn', '<C-x><C-n>')

-- " current and included files
vim.keymap.set('i', '<tab>yi', '<C-x><C-i>')
vim.keymap.set('i', '<leader>xi', '<C-x><C-i>')

-- " dictionary
vim.keymap.set('i', '<tab>yk', '<C-x><C-k>')
vim.keymap.set('i', '<leader>xk', '<C-x><C-k>')

-- " thesaurus
vim.keymap.set('i', '<tab>yt', '<C-x><C-t>')
vim.keymap.set('i', '<leader>xt', '<C-x><C-t>')

-- " user-defined completion
vim.keymap.set('i', '<tab>yu', '<C-x><C-u>')
vim.keymap.set('i', '<leader>xu', '<C-x><C-u>')

-- " spelling suggestions
vim.keymap.set('i', '<tab>ys', '<C-x><C-s>')
vim.keymap.set('i', '<leader>xs', '<C-x><C-s>')


-- "-----------------------------------"
-- " EASIER FOLDS
-- "-----------------------------------"
-- " other fold settings in the file ./settings-general.vim
-- " only the new mappings go in this file
-- "

-- "CLOSE all folds in current buffer
map('n', '<leader>fa', ':set foldlevel=0<cr>', options)

-- "OPEN all folds in current buffer
map('n', '<leader>fA', ':set foldlevel=20<cr>', options)

map('n', '<leader>fd', 'zd|', options)		-- "delete fold at the cursor - manual/marker only
map('n', '<leader>fD', 'zD|', options) 		-- "Delete folds at cursor recursively - manual/marker only
map('n', '<leader>fE', 'zE|', options) 		-- "eliminate all folds in window
map('n', '<leader>fo', 'zo|', options) 		-- "open fold under cursor
map('n', '<leader>fO', 'zO|', options) 		-- "Open all folds under cursor recursively
map('n', '<leader>fc', 'zc|', options) 		-- "close one fold under cursor
map('n', '<leader>fC', 'zC|', options) 		-- "Close all folds under cursor recursively
map('n', '<leader>ft', 'za|', options) 		-- "toggle one fold under cursor
map('n', '<leader>fT', 'zA|', options) 		-- "Toggle folds recursively under the cursor


-- "-----------------------------------"
-- " Quick editing of a few settings files
-- "-----------------------------------"
map('n', '<leader>ev', ':vsplit ~/.vimrc<cr>', options)
map('n', '<leader>ea', ':vsplit ~/.alias<cr>', options)
map('n', '<leader>eb', ':vsplit ~/.alias<cr>', options)
map('n', '<leader>et', ':vsplit ~/.tmux.conf<cr>', options)
map('n', '<leader>en', ':vsplit /usr/local/etc/nginx/nginx.conf<cr>', options)


-- "-----------------------------------"
-- " Basic Completion Remaps
-- "-----------------------------------"
-- " sources: https://www.cs.oberlin.edu/~kuperman/help/vim/completion.html
-- " sources: https://stackoverflow.com/questions/2269005/how-can-i-change-the-keybinding-used-to-autocomplete-in-vim

-- " use <SPACE> to auto-complete
-- "inoremap <Nul> <C-n>
-- inoremap <leader>cn <C-n>
-- inoremap <leader>cp <C-p>
-- inoremap <leader>cl <C-x><C-l>
map('i', '<leader>cn', '<C-n>', options)
map('i', '<leader>cp', '<C-p>', options)
map('i', '<leader>cl', '<C-x><C-l>', options)

-- " dictionary completion
set.dictionary = '/usr/share/dict/words'

-- inoremap <leader>cd <C-x><C-k>
map('i', '<leader>cd', '<C-x><C-k>', options)


-- "-----------------------------------"
-- " Save View
-- "-----------------------------------"
-- " source:
--    + [Make views automatic](http://vim.wikia.com/wiki/Make_views_automatic)
-- "
-- " save folds when closing file for continuing on next open of same file
-- autocmd BufWinLeave *.* mkview
-- autocmd BufWinEnter *.* silent! loadview
cmd([[ autocmd BufWinLeave *.* mkview ]])
cmd([[ autocmd BufWinEnter *.* silent! loadview ]])


-- "-----------------------------------"
-- " EASIER SPLITS & PANE NAVIGATION
-- "-----------------------------------"
-- " easier window navigation
-- nmap wh <C-W>h
-- nmap wj <C-W>j
-- nmap wk <C-W>k
-- nmap wl <C-W>l
map('n', 'wh', '<C-W>h', {})
map('n', 'wj', '<C-W>j', {})
map('n', 'wk', '<C-W>k', {})
map('n', 'wl', '<C-W>l', {})

-- " MORE NATURAL SPLIT OPENING -- Open new split panes to
-- " the right and bottom, which feels more natural than Vim’s default:
set.splitbelow = true
set.splitright = true

-- " Easier split resizing
-- :command Widen :vertical resize
-- :command Grow  :resize
user_cmd('Widen', ':vertical resize', {})
user_cmd('Grow', ':resize', {})


-- "------------------------"
-- "Copy/Paste SETTINGS
-- "------------------------"
-- """ copy to clipboard
-- nmap cc "+
map('n', 'cc', '"+', {})

-- "" paste from clipboard
-- nmap cp "+p
map('n', 'cp', '"+p', {})


-- "-----------------------------------"
-- " Quick open of current document in the browser
-- "-----------------------------------"
-- :set timeoutlen=1500
-- nmap <leader>x :!/Applications/Firefox.app/Contents/MacOS/firefox %<CR>
-- nmap <leader>b :!/Applications/Brave\ Browser.app/Contents/MacOS/Brave\ Browser %<CR>

set.timeoutlen = 1500

if vim.fn.has('mac') then
  map('n', '<leader>x', ':!/Applications/Firefox.app/Contents/MacOS/firefox %<CR>', {})
  map('n', '<leader>b', ':!/Applications/Brave Browser.app/Contents/MacOS/Brave Browser %<CR>', {})
end

if vim.fn.has('linux') then
  map('n', '<leader>x', ':!/snap/bin/firefox %<CR>', {})
  map('n', '<leader>b', ':!/usr/bin/brave-browser %<CR>', {})
end


-- "-----------------------------------"
-- " Vim Vertical Alignment:
-- "   - https://vimtricks.com/p/vertical-alignment/
-- "   - http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
-- " ..
-- " ..
-- FIXME: LUA convert .. unsure of the best way to convert the following
-- user function to Lua .. or at least something that will execute
-- properly within a LUA context/file.
-- "-----------------------------------"
--
-- inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
-- map('i', '<silent> <Bar>', '<Bar><Esc>:call <SID>align()<CR>a', options)

-- function! s:align()
--   let p = '^\s*|\s.*\s|\s*$'
--   if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
--     let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
--     let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
--     Tabularize/\\\@<!|/l1
--     normal! 0
--     call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
--   endif
-- endfunction


-- "-----------------------------------"
-- " Finito
-- "-----------------------------------"

