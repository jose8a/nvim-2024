-- =============================================
-- Telescope (and related plugins and extensions)
-- =============================================
return {
  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim'
    },

    config = function ()
      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup({
        defaults = {
          mappings = {
            i = {
              ['<C-u>'] = false,
              ['<C-d>'] = false,
            },
          },
          extensions = {
            arecibo = {
              ["selected_engine"]   = 'google',
              ["url_open_command"]  = 'xdg-open',
              ["show_http_headers"] = false,
              ["show_domain_icons"] = false,
            },
          }
        },
      })

      -- Telescope keymap config
      -- =============================================
      -- See `:help telescope.builtin`
      local builtin = require('telescope.builtin')
      local themes = require('telescope.themes')

      vim.keymap.set('n', '<leader>t?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
      vim.keymap.set('n', '<leader>t<space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
      vim.keymap.set('n', '<leader>t/', function ()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        builtin.current_buffer_fuzzy_find(themes.get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      vim.keymap.set('n', '<leader>tf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>th', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>tw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>tg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>td', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })

      -- Enable any loaded extensions
      -- =============================================
      require('telescope').load_extension('fzf')
      -- FIXME: 23/1204 (luasnip loading errors)
      -- require('telescope').load_extension('luasnip')
      require('telescope').load_extension('tasks')
      require('telescope').load_extension('git_diffs')
      -- require('telescope').load_extension('arecibo')
    end
  },


  -- Telescope-related plugins / extensions
  -- =============================================
  -- [[
  -- use { 'fhill2/telescope-ultisnips.nvim' }
  -- ]]

  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

  {
    'axkirillov/easypick.nvim',
    dependencies = 'nvim-telescope/telescope.nvim'
  },

  {"lpoto/telescope-tasks.nvim"},

  {
    'paopaol/telescope-git-diffs.nvim',
     dependencies = {
       "nvim-lua/plenary.nvim",
       "sindrets/diffview.nvim",
     },
  },

  {
    "benfowler/telescope-luasnip.nvim",

    -- if you wish to lazy-load
    module = "telescope._extensions.luasnip",
  },

  {
    'sudormrfbin/cheatsheet.nvim',
    dependencies = {
      {'nvim-telescope/telescope.nvim'},
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
    }
  },

  -- {
  --   "nvim-telescope/telescope-arecibo.nvim",
  --   rocks = {"openssl", "lua-http-parser"}
  -- },
}
