return {
  {
    -- Adds git releated signs to the gutter, as well as
    -- utilities for managing changes
    'lewis6991/gitsigns.nvim',
    event = "LazyFile",

    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  -- Git/Github Utilities
  {
    'sindrets/diffview.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim'
    }
  },

  {
    'TimUntersberger/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
    opts = {}
  },

  { 'tpope/vim-fugitive' },
  { 'tpope/vim-rhubarb' },
}
