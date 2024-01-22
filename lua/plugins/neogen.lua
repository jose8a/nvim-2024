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
      -- FIXME: 23/1204 (luasnip loading errors)
      -- snippet_engine = "luasnip"
  end
}
