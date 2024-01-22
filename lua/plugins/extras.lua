return {
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim', opts = {} },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- TMUX
  'christoomey/vim-tmux-navigator',

  -- a 'vim-vinegar'-like file explorer for neovim
  {
    'stevearc/oil.nvim',
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    opts = {}
  },
}
