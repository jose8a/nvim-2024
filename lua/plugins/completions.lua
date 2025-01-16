return {
--   { "hrsh7th/cmp-nvim-lsp",                 lazy=true },
--   { 'hrsh7th/cmp-buffer',                   lazy=true },
--   { 'hrsh7th/cmp-path',                     lazy=true },
--   { 'hrsh7th/cmp-nvim-lua',                 lazy=true },
--   { 'ray-x/cmp-treesitter',                 lazy=true },
--   { 'hrsh7th/cmp-cmdline',                  lazy=true },
--   { 'hrsh7th/cmp-calc',                     lazy=true },
--   { 'f3fora/cmp-spell',                     lazy=true },
--   { 'hrsh7th/cmp-emoji',                    lazy=true },
--   { 'hrsh7th/cmp-nvim-lsp-signature-help',  lazy=true },
--   { 'saadparwaiz1/cmp_luasnip',             lazy=true },
--   { 'rafamadriz/friendly-snippets',         lazy=true },
--   { 'honza/vim-snippets',                   lazy=true },
--
--   {
--   -- FIXME: 23/1204 (luasnip loading errors)
--     'L3MON4D3/LuaSnip',
--     keys = function ()
--       return {}
--     end,
--
--     -- dependencies = {
--     -- 'rafamadriz/friendly-snippets',
--     -- 'honza/vim-snippets',
--     -- },
--
--     config = function ()
--       local luasnip = require "luasnip"
--
--       luasnip.config.set_config {
--         history = false,
--         updateevents = "TextChanged,TextChangedI",
--       }
--
--       require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/vsc_snippets/typescript"})
--       require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/vsc_snippets/svelte"})
--       require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/vsc_snippets/vue"})
--       require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/vsc_snippets/markdown"})
--       require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/vsc_snippets/json"})
--       require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/vsc_snippets/css"})
--       require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/vsc_snippets/astro"})
--     end
--   },
--
--
--   {
--     -- Autocompletion
--     'hrsh7th/nvim-cmp',
--     event = { "InsertEnter", "CmdlineEnter" },
--
--     -- dependencies = {
--     -- 'hrsh7th/cmp-nvim-lsp',
--     -- 'hrsh7th/cmp-buffer',
--     -- 'hrsh7th/cmp-path',
--     -- 'hrsh7th/cmp-nvim-lua',
--     -- 'ray-x/cmp-treesitter',
--     -- 'hrsh7th/cmp-cmdline',
--     -- 'hrsh7th/cmp-calc',
--     -- 'f3fora/cmp-spell',
--     -- 'hrsh7th/cmp-emoji',
--     -- 'hrsh7th/cmp-nvim-lsp-signature-help',
--     -- 'saadparwaiz1/cmp_luasnip',
--     -- 'rafamadriz/friendly-snippets',
--     -- 'honza/vim-snippets',
--     -- },
--
--     config = function ()
--       local cmp = require('cmp')
--
--       -- FIXME: 23/1204 (luasnip loading errors)
--       -- FIXME: 23/1214 - this next line is causing errors, so comment out
--       -- for now ...
--       local luasnip = require('luasnip')
--       luasnip.config.setup({})
--
--
--       -- FIXME: 23/1204 (luasnip loading errors)
--       -- FIXME: 23/1214 - remove all calls to luasnip until my config error
--       -- causing luasnip errors can be found and fixed in my config.
--
--       cmp.setup({
--         snippet = {
--           expand = function(args)
--             -- FIXME: 23/1204 (luasnip loading errors)
--             luasnip.lsp_expand(args.body)
--           end,
--         },
--
--         mapping = cmp.mapping.preset.insert {
--           ["<C-j>"] = cmp.mapping.select_next_item(),
--           ["<C-k>"] = cmp.mapping.select_prev_item(),
--           ['<C-f>'] = cmp.mapping.scroll_docs(4),
--           ['<C-d>'] = cmp.mapping.scroll_docs(-4),
--           ['<C-Space>'] = cmp.mapping.complete {},
--           ['<C-e>'] = cmp.mapping.abort(),
--           ['<CR>'] = cmp.mapping.confirm {
--             behavior = cmp.ConfirmBehavior.Replace,
--             select = true,
--           },
--           ['<Tab>'] = cmp.mapping(function(fallback)
--             if cmp.visible() then
--               cmp.select_next_item()
--             -- FIXME: 23/1204
--             -- elseif luasnip.expand_or_jumpable() then
--               -- FIXME: 23/1204
--               -- luasnip.expand_or_jump()
--             else
--               fallback()
--             end
--           end, { 'i', 's' }),
--           ['<S-Tab>'] = cmp.mapping(function(fallback)
--             if cmp.visible() then
--               cmp.select_prev_item()
--             -- FIXME: 23/1204 (luasnip loading errors)
--             elseif luasnip.jumpable(-1) then
--               luasnip.jump(-1)
--             else
--               fallback()
--             end
--           end, { 'i', 's' }),
--         },
--
--         sources = {
--           { name = 'nvim_lsp' },
--           -- FIXME: 23/1204 (luasnip loading errors)
--           { name = 'luasnip' },
--           { name = "buffer" },
--           { name = "path" },
--           { name = "nvim_lua" },
--           { name = "treesitter" },
--           { name = "calc" },
--           { name = "spell" },
--           { name = "emoji" },
--           { name = 'nvim_lsp_signature_help' },
--         },
--       })
--
--       -- Use buffer source for `/` and `?`
--       -- (if you enabled `native_menu`, this won't work anymore).
--       cmp.setup.cmdline({ '/', '?' }, {
--         mapping = cmp.mapping.preset.cmdline(),
--         sources = {
--           { name = 'buffer' }
--         }
--       })
--
--       -- Use cmdline & path source for ':'
--       -- (if you enabled `native_menu`, this won't work anymore).
--       cmp.setup.cmdline(':', {
--         mapping = cmp.mapping.preset.cmdline(),
--         sources = cmp.config.sources({
--           { name = 'path' }
--         }, {
--           { name = 'cmdline' }
--         })
--       })
--
--       cmp.setup.filetype({ 'sql' }, {
--         sources = {
--           { name = 'vim-dadbod-completion' },
--           { name = 'buffer' },
--         },
--       })
--
--     end
--   },

  {
    "saghen/blink.cmp",
    version = not vim.g.lazyvim_blink_main and "*",
    build = vim.g.lazyvim_blink_main and "cargo build --release",
    opts_extend = {
      "sources.completion.enabled_providers",
      "sources.compat",
      "sources.default",
    },
    dependencies = {
      "rafamadriz/friendly-snippets",
      -- add blink.compat to dependencies
      {
        "saghen/blink.compat",
        optional = true, -- make optional so it's only enabled if any extras need it
        opts = {},
        version = not vim.g.lazyvim_blink_main and "*",
      },
    },
    event = "InsertEnter",

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      snippets = {
        expand = function(snippet, _)
          return LazyVim.cmp.expand(snippet)
        end,
      },
      appearance = {
        -- sets the fallback highlight groups to nvim-cmp's highlight groups
        -- useful for when your theme doesn't support blink.cmp
        -- will be removed in a future release, assuming themes add support
        use_nvim_cmp_as_default = false,
        -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- adjusts spacing to ensure icons are aligned
        nerd_font_variant = "mono",
      },
      completion = {
        accept = {
          -- experimental auto-brackets support
          auto_brackets = {
            enabled = true,
          },
        },
        menu = {
          draw = {
            treesitter = { "lsp" },
          },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
        },
        ghost_text = {
          enabled = vim.g.ai_cmp,
        },
      },

      -- experimental signature help support
      -- signature = { enabled = true },

      sources = {
        -- adding any nvim-cmp sources here will enable them
        -- with blink.compat
        compat = {},
        default = { "lsp", "path", "snippets", "buffer" },
        cmdline = {},
      },

      keymap = {
        preset = "enter",
        ["<C-y>"] = { "select_and_accept" },
      },
    },
    ---@param opts blink.cmp.Config | { sources: { compat: string[] } }
    config = function(_, opts)
      -- setup compat sources
      local enabled = opts.sources.default
      for _, source in ipairs(opts.sources.compat or {}) do
        opts.sources.providers[source] = vim.tbl_deep_extend(
          "force",
          { name = source, module = "blink.compat.source" },
          opts.sources.providers[source] or {}
        )
        if type(enabled) == "table" and not vim.tbl_contains(enabled, source) then
          table.insert(enabled, source)
        end
      end

      -- add ai_accept to <Tab> key
      if not opts.keymap["<Tab>"] then
        if opts.keymap.preset == "super-tab" then -- super-tab
          opts.keymap["<Tab>"] = {
            require("blink.cmp.keymap.presets")["super-tab"]["<Tab>"][1],
            LazyVim.cmp.map({ "snippet_forward", "ai_accept" }),
            "fallback",
          }
        else -- other presets
          opts.keymap["<Tab>"] = {
            LazyVim.cmp.map({ "snippet_forward", "ai_accept" }),
            "fallback",
          }
        end
      end

      ---  NOTE: compat with latest version. Currenlty 0.7.6
      if not vim.g.lazyvim_blink_main then
        ---@diagnostic disable-next-line: inject-field
        opts.sources.completion = opts.sources.completion or {}
        opts.sources.completion.enabled_providers = enabled
        if vim.tbl_get(opts, "completion", "menu", "draw", "treesitter") then
          ---@diagnostic disable-next-line: assign-type-mismatch
          opts.completion.menu.draw.treesitter = true
        end
      end

      -- Unset custom prop to pass blink.cmp validation
      opts.sources.compat = nil

      -- check if we need to override symbol kinds
      for _, provider in pairs(opts.sources.providers or {}) do
        ---@cast provider blink.cmp.SourceProviderConfig|{kind?:string}
        if provider.kind then
          local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
          local kind_idx = #CompletionItemKind + 1

          CompletionItemKind[kind_idx] = provider.kind
          ---@diagnostic disable-next-line: no-unknown
          CompletionItemKind[provider.kind] = kind_idx

          ---@type fun(ctx: blink.cmp.Context, items: blink.cmp.CompletionItem[]): blink.cmp.CompletionItem[]
          local transform_items = provider.transform_items
          ---@param ctx blink.cmp.Context
          ---@param items blink.cmp.CompletionItem[]
          provider.transform_items = function(ctx, items)
            items = transform_items and transform_items(ctx, items) or items
            for _, item in ipairs(items) do
              item.kind = kind_idx or item.kind
            end
            return items
          end

          -- Unset custom prop to pass blink.cmp validation
          provider.kind = nil
        end
      end

      require("blink.cmp").setup(opts)
    end,
  }
}
