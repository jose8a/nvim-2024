return {
  -- improve the default vim.ui interfaces
  {
    'stevearc/dressing.nvim',
    opts = {},
  },

  --
  -- A pretty diagnostics, references, telescope results,
  -- quickfix and location list to help you solve all the
  -- trouble your code is causing.
  --
  {
    "folke/trouble.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    opts = {}
  },

  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',

    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        -- theme = 'palenight',
        theme = 'onedark',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      -- config example:
      -- https://www.reddit.com/r/neovim/comments/16u5abl/indent_blankline_v3_is_released/
      -- show_trailing_blankline_indent = false,
      -- show_first_indent_level = false,
      indent = {
        char = { '┊' },
      },
      -- remove_blankline_trail = true;
    }
  },

  -- version-2 setup for indent-blankline:
  -- xxx { -- Add indentation guides even on blank lines
  -- xxx   'lukas-reineke/indent-blankline.nvim',
  -- xxx   -- Enable `lukas-reineke/indent-blankline.nvim`
  -- xxx   -- See `:help indent_blankline.txt`
  -- xxx   opts = {
  -- xxx     char = '┊',
  -- xxx     show_trailing_blankline_indent = false,
  -- xxx   },
  -- xxx },

  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup {
        'javascript';
        'css';
        'svelte';
        'vue';
        html = {
          mode = 'foreground';
        }
      }
    end,
  },

  { 'nvim-tree/nvim-web-devicons' },

  { 'ziontee113/color-picker.nvim',
      config = function()
          require('color-picker')
      -- TODO: add configuration opts shown in the repo
      end,
  }

  -- Statusline
  -- =============================================
  -- ... tbd
}
