local set = vim.opt
local map = vim.api.nvim_set_keymap
local options = { noremap = true }

-- "-----------------------------------"
--  INDENT SETTINGS
-- "-----------------------------------"
set.autoindent = true
set.smartindent = true
set.smarttab = true
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.expandtab = true


-- "-----------------------------------"
-- " WILDMENU SETTINGS
-- " - wild menu is the menu-completion in command-mode pane
-- "-----------------------------------"
set.wildmenu = true
set.wildmode = "list:longest"
set.wildignore = {
   '*/tmp/*', '*.so', '*.swp', '*.zip',                                 -- " MacOSX/Linux
   '*.DS_Store',                                                        -- " More OSX
   '.git.svn',                                                          -- " Version control
   '*.aux', '*.out', '*.toc',                                           -- " LaTeX intermediate files
   '*.jpg', '*.bmp', '*.gif', '*.png', '*.jpeg',                        -- " binary images
   '*.sw?',                                                             -- " Vim swap files
   '*.pyc',                                                             -- " Python byte code
   '*.orig'                                                             -- " Merge resolution files
}


-- "-----------------------------------"
-- " leader affects all of vim, while localleader is meant for a specific buffer,
-- " you generally use localleader based on a filetype.
-- " Using a localleader you can use the same leader-mapping for (slightly) different actions.
-- " or read more about it in the helpfiles:
-- "   -- http://vimdoc.sourceforge.net/htmldoc/map.html#mapleader
-- "-----------------------------------"
vim.g.mapleader = ";"                 -- " Want a different map leader than \
vim.g.maplocalleader = ","            -- " Map a local filetype leader to '\'

set.hidden = true                     -- " Switch between buffers without saving
set.timeoutlen = 200                  -- " Ever notice a slight lag after typing the
                                      -- " leader key + command? This lowers the timeout.


-- "-----------------------------------"
-- " LINE WRAPPING
-- "-----------------------------------"
set.wrap = true                       -- " Better line wrapping
set.textwidth = 79                    -- " Better line wrapping (2)
set.formatoptions = 'qrn1'            -- " Better line wrapping (3)
map('n', '<leader>q', 'gqip', options)   -- " Hard-wrap paragraphs of text


-- "-----------------------------------"
-- " LINE NUMBERING
-- "-----------------------------------"
vim.g.enable_numbers = 0              -- " Numbers.vim turn off automatic number switching
set.number = true                     -- " Show lines numbers
-- "set.relativenumber = true         -- " Prefer relative line numbering?


-- "-----------------------------------"
-- " SHOW/HIDE VISUAL INDICATORS
-- "-----------------------------------"
set.hlsearch = true                   -- " highlight on search
set.showmatch = true                  -- " Show matching brackets
set.showcmd = true                    -- " Show command in bottom right portion of the screen
set.visualbell = true                 -- " Set bell to visual rather than to a sound
set.mousehide = true                  -- " Hide mouse when typing
set.laststatus = 2                    -- " Always show the status line
set.linespace = 3                     -- " Prefer a slightly higher line height
set.backspace = {
   'indent',
   'eol',
   'start'
}


-- "-----------------------------------"
-- " MISCELLANEOUS SETTINGS
-- "-----------------------------------"
set.autowrite = true                       -- " Write the old file out when switching between files.
set.ruler = true                           -- " Display current cursor position in lower right corner.

-- " 2017.0209 after a MacOSX crash, all
-- files open in RO only mode.  Need to
-- disble RO mode until find cause.
-- NOTE: 2023.0129 .. this appears to be an invalid setting in neovim
-- set.noro = true                            -- " globally set no-readonly mode on all files

-- " Session settings
-- size,buffers,tabpages,folds,curdir,help
set.sessionoptions = {
   'resize',
   'winpos',
   'buffers'
}


-- "-----------------------------------"
-- " SWAP/BACKUP FILE/DIR SETTINGS
-- "-----------------------------------"
-- FIXME: LUA convert - shouldn't these paths be set to a path
-- usually employed by neovim .. such as '~/.local/state/nvim/swap/..'
-- or '.local/state/nvim/undo/..', etc
-- .....
-- "set.backupdir = '~/.vim/tmp/backup//'   -- " Set Backups directory
-- "set.directory = '~/.vim/tmp/swap//'     -- " Set Swap files directory
-- "set.backup = true                          -- " Enable backups
-- "set nobackup                       -- " Disable backups
-- "set noswapfile                     -- " Disable swapfiles


-- FIXME: LUA convert - unsure how to convert
-- set.pastetoggle = <leader>pt
-- " Prevents nasty side-effects when pasting large chunks of text/code


-- -----------------------------------"
--  Simple StatusLine
-- -----------------------------------"
-- NOTE: 2023.0128 .. commented out since likely using lualine or
-- .. similar instead
-- set.statusline = '%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]'


-- -----------------------------------"
--  COLOR SETTINGS
-- -----------------------------------"
-- Set to 256 colors before setting colorscheme
--  TODO??: this setting may no longer be needed in modern VIM
-- set t_Co=256

-- NOTE: already set by the nvim-kickstart 'init.lua' file
-- colorscheme onedark

--  -----
--  Set the background color for the floating/Pmenu
--  REFERENCE (table of xterm-colors):
--    - https://github.com/guns/xterm-color-table.vim
--  -----
--  dark-blue background
--  highlight Pmenu ctermbg=17 guibg=#add8e6
--  vim.cmd[[ highlight Pmenu ctermbg=17 guibg=#add8e6 ]]

--  dark-magenta-ish background
--  highlight Pmenu ctermbg=17 guibg=#add8e6

--  light-magenta-ish background
--  highlight Pmenu ctermbg=17 guibg=#add8e6


-- ----- " Display tabs and trailing spaces visually:
-- FIXME: LUA convert .. fix this for LUA
-- set['list listchars'] = tab:\ \ ,trail:


-- "-----------------------------------"
-- " Ultisnips Trigger configuration. Do not use <tab> if you use:
-- "   - https://github.com/Valloric/YouCompleteMe.
-- "-----------------------------------"

-- FIXME: LUA convert: maybe just used the setup for
-- the plugin in the 'plugins' setup file ??
-- vim.g.UltiSnipsExpandTrigger="<tab>"
-- vim.g.UltiSnipsJumpForwardTrigger="<c-b>"
-- vim.g.UltiSnipsJumpBackwardTrigger="<c-z>"


-- vim.cmd [[highlight Search guibg='#D6B860' guifg='#703D3D']]
vim.cmd [[highlight Search guifg='#342475' guibg='#7EC9D2']]
vim.cmd [[highlight CurSearch guibg='#D6B860' guifg='#342475']]
