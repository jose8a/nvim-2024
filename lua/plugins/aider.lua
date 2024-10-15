return {
    "joshuavial/aider.nvim",

    config = function()
        local aider = require("aider")

        aider.setup ({
            -- defaults
            -- auto_manage_context = true,
            -- default_bindings = true
        })

        -- set a keybinding for the AiderOpen function
        vim.api.nvim_set_keymap(
            "n",
            "<leader>oa",
            "<cmd>lua AiderOpen()<cr>",
            {
                noremap = true,
                silent = true
            }
        )

        -- set a keybinding for the AiderBackground function
        vim.api.nvim_set_keymap(
            "n",
            "<leader>ob",
            "<cmd>lua AiderBackground()<cr>",
            {
                noremap = true,
                silent = true
            }
        )
    end
}
