return {
    "olimorris/codecompanion.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",

        -- Optional: For using slash commands and variables in the chat buffer
        -- "hrsh7th/nvim-cmp",

        -- Optional: For using slash commands
        "nvim-telescope/telescope.nvim",

        -- Optional: Improves `vim.ui.select`
        { "stevearc/dressing.nvim", opts = {} },
    },

    -- config = true

    -- FIXME: add an adapter as explained here:
    -- https://github.com/olimorris/codecompanion.nvim?tab=readme-ov-file#electric_plug-adapters
    opts = {
      strategies = {
        -- Change the default chat adapter
        chat = {
          adapter = 'qwen',
        },
        inline = {
          adapter = 'qwen',
        },
      },
      adapters = {
        qwen = function()
          return require('codecompanion.adapters').extend('ollama', {
            name = 'qwen', -- Give this adapter a different name to differentiate it from the default ollama adapter
            schema = {
              model = {
                default = 'qwq:32b',
              },
            },
          })
        end,
      },
      opts = {
        log_level = 'DEBUG',
      },
      display = {
        diff = {
          enabled = true,
          close_chat_at = 240, -- Close an open chat buffer if the total columns of your display are less than...
          layout = 'vertical', -- vertical|horizontal split for default provider
          opts = { 'internal', 'filler', 'closeoff', 'algorithm:patience', 'followwrap', 'linematch:120' },
          provider = 'default', -- default|mini_diff
        },
      },
    },
}
