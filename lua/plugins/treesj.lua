return {
    'Wansmer/treesj',

    -- keys = {
    --     '<leader><leader>t',
    --     '<leader><leader>j',
    --     '<leader><leader>s',
    -- },

    -- if you install parsers with `nvim-treesitter`
    dependencies = { 'nvim-treesitter/nvim-treesitter' },

    config = function()
        require('treesj').setup({ --[[ your config ]] })
    end,

    -- set a keybinding for the treesj Toggle function
    vim.api.nvim_set_keymap(
        "n",
        "<leader><leader>t",
        "<cmd>lua require('treesj').toggle()<cr>",
        {
            noremap = true,
            silent = true
        }
    ),

    -- set a keybinding for the treesj Split function
    vim.api.nvim_set_keymap(
        "n",
        "<leader><leader>s",
        "<cmd>lua require('treesj').split()<cr>",
        {
            noremap = true,
            silent = true
        }
    ),

    -- set a keybinding for the treesj Join function
    vim.api.nvim_set_keymap(
        "n",
        "<leader><leader>j",
        "<cmd>lua require('treesj').join()<cr>",
        {
            noremap = true,
            silent = true
        }
    )
}
