  -- Docs
  -- =============================================
  -- ... tbd
return {
  "danymat/neogen",

  -- Uncomment next line if you want to follow only stable versions
  version = "*",

  dependencies = "nvim-treesitter/nvim-treesitter",

  -- config = true,
  config = function ()
      require('neogen').setup()

      -- FIXME: 23/1204 (luasnip loading errors)
      -- snippet_engine = "luasnip"

      -- "-----------------------------------"
      -- " NEOGEN Mappings
      -- "
      -- "   <leader>nf: function (default)
      -- "   <leader>nc: class
      -- "   <leader>nt: type
      -- "   <leader>nm: file/module
      -- "-----------------------------------"
      local opts = { noremap = true, silent = true }

      vim.api.nvim_set_keymap("n", "<Leader>nf", ":lua require('neogen').generate()<CR>", opts)
      vim.api.nvim_set_keymap("n", "<Leader>nc", ":lua require('neogen').generate({ type = 'class' })<CR>", opts)
      vim.api.nvim_set_keymap("n", "<Leader>nm", ":lua require('neogen').generate({ type = 'file' })<CR>", opts)
      vim.api.nvim_set_keymap("n", "<Leader>nt", ":lua require('neogen').generate({ type = 'type' })<CR>", opts)

  end
}
