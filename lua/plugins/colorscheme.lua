-- =============================================
-- COLORSCHEMES
-- =============================================
return {
  -- MODERN COLOR THEMES
  {
    'navarasu/onedark.nvim',
    config = function ()
      require('onedark').setup {
        style = 'deep'
      }
    end
  },

  { 'Anfigeno/mestizo.nvim',
    config = function ()
      vim.cmd.colorscheme('mestizo')
    end,
  },
  { 'rebelot/kanagawa.nvim' },
  { 'tiagovla/tokyodark.nvim' },
  { 'sainnhe/sonokai' },
  { 'ray-x/aurora' },


  -- 2023.0207 - added these
  { 'talha-akram/noctis.nvim' },
  { 'folke/tokyonight.nvim' },
  { 'JoosepAlviste/palenightfall.nvim' },

  -- 2023.0310 - added these
  { 'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function ()
      -- vim.cmd.colorscheme('catppuccin')
    end,
  },
  { 'embark-theme/vim', name = 'embark' },
  { 'NTBBloodbath/sweetie.nvim', name = 'sweetie' },

  -- { -- Theme inspired by Atom
  --   'JoosepAlviste/palenightfall.nvim',
  --   -- 'navarasu/onedark.nvim',
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme 'palenightfall'
  --   end,
  -- },


  -- LEGACY COLOR THEMES
  -- ..
  { 'zeis/vim-kolor' },
  { 'NLKNguyen/papercolor-theme' },  -- markdown-only theme
  { 'morhetz/gruvbox' },
  { 'dracula/vim' },
}
