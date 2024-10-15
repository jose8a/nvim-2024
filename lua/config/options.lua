-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)

-- "-----------------------------------"
-- " leader affects all of vim, while localleader is meant for a specific buffer,
-- " you generally use localleader based on a filetype.
-- " Using a localleader you can use the same leader-mapping for (slightly) different actions.
-- " or read more about it in the helpfiles:
-- "   -- http://vimdoc.sourceforge.net/htmldoc/map.html#mapleader
-- "-----------------------------------"
-- vim.g.mapleader = ' '
-- vim.g.maplocalleader = ' '
vim.g.mapleader = ";"                 -- " Want a different map leader than \
vim.g.maplocalleader = ","            -- " Map a local filetype leader to '\'
vim.o.termguicolors = true


-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = false

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
-- Remove this option if you want your OS clipboard to
-- remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
-- vim.o.termguicolors = true

