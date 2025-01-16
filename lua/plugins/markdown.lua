return {
--     -- ..tbd
--     'MeanderingProgrammer/render-markdown.nvim',
--     dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
--     -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
--     -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
--     ---@module 'render-markdown'
--     ---@type render.md.UserConfig
--     opts = {},
--
--     config = function()
--         local rm = require("render-markdown")
--
--         rm.setup ({
--             enabled = false,
--         })
--
--         -- quarto key-bindings
--         vim.keymap.set('n', '<leader>mR', rm.enable, { silent = true, noremap = true })
--         vim.keymap.set('n', '<leader>mr', rm.disable, { silent = true, noremap = true })
--         vim.keymap.set('n', '<leader>mt', rm.toggle, { silent = true, noremap = true })
--         vim.keymap.set('n', '<leader>m!', rm.toggle, { silent = true, noremap = true })
--     end,
}

