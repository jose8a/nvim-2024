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

    config = true

    -- FIXME: add an adapter as explained here:
    -- https://github.com/olimorris/codecompanion.nvim?tab=readme-ov-file#electric_plug-adapters
}
