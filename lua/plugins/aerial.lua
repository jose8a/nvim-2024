return {
    'stevearc/aerial.nvim',

    opts = {},

    -- Optional dependencies
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    },

    config = function()
        local aerial = require("aerial")

        aerial.setup({

            on_attach = function(bufnr)
                -- Jump forwards/backwards with '{' and '}'
                vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
                vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
            end,

            -- optionally use on_attach to set keymaps when aerial has attached to a buffer
            layout = {
                min_width = 0.2,
                max_width = { 60, 0.3 },
            },
        })

        -- You probably also want to set a keymap to toggle aerial
        vim.keymap.set("n", "<leader>at", "<cmd>AerialToggle!<CR>")
    end
}
