return {
  { "hrsh7th/cmp-nvim-lsp" },


  {
  -- FIXME: 23/1204 (luasnip loading errors)
    'L3MON4D3/LuaSnip',
    keys = function ()
      return {}
    end,

    dependencies = {
      'rafamadriz/friendly-snippets',
      'honza/vim-snippets',
    },

    config = function ()
      local luasnip = require "luasnip"

      luasnip.config.set_config {
        history = false,
        updateevents = "TextChanged,TextChangedI",
      }

      require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/vsc_snippets/typescript"})
      require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/vsc_snippets/svelte"})
      require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/vsc_snippets/vue"})
      require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/vsc_snippets/markdown"})
      require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/vsc_snippets/json"})
      require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/vsc_snippets/css"})
      require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/vsc_snippets/astro"})
    end
  },


  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = { "InsertEnter", "CmdlineEnter" },

    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lua',
      'ray-x/cmp-treesitter',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-calc',
      'f3fora/cmp-spell',
      'hrsh7th/cmp-emoji',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets',
      'honza/vim-snippets',
    },

    config = function ()
      local cmp = require('cmp')

      -- FIXME: 23/1204 (luasnip loading errors)
      -- FIXME: 23/1214 - this next line is causing errors, so comment out
      -- for now ...
      local luasnip = require('luasnip')
      luasnip.config.setup({})


      -- FIXME: 23/1204 (luasnip loading errors)
      -- FIXME: 23/1214 - remove all calls to luasnip until my config error
      -- causing luasnip errors can be found and fixed in my config.

      cmp.setup({
        snippet = {
          expand = function(args)
            -- FIXME: 23/1204 (luasnip loading errors)
            luasnip.lsp_expand(args.body)
          end,
        },

        mapping = cmp.mapping.preset.insert {
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-Space>'] = cmp.mapping.complete {},
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            -- FIXME: 23/1204
            elseif luasnip.expand_or_jumpable() then
              -- FIXME: 23/1204
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            -- FIXME: 23/1204 (luasnip loading errors)
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        },

        sources = {
          { name = 'nvim_lsp' },
          -- FIXME: 23/1204 (luasnip loading errors)
          { name = 'luasnip' },
          { name = "buffer" },
          { name = "path" },
          { name = "nvim_lua" },
          { name = "treesitter" },
          { name = "calc" },
          { name = "spell" },
          { name = "emoji" },
          { name = 'nvim_lsp_signature_help' },
        },
      })

      -- Use buffer source for `/` and `?`
      -- (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      -- Use cmdline & path source for ':'
      -- (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        })
      })

    end
  }
}
