-- LSP Configs
-- Ensure that the 'setup' order for the LSP plugins
-- runs in this order:
-- 1. "williamboman/mason.nvim"
-- 2. "williamboman/mason-lspconfig.nvim"
-- 3. "nvim-lspconfig"
-- =======================================================
return {
  {
    -- Setup mason so it can manage external tooling
    "williamboman/mason.nvim",
    -- lazy = false,

    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    -- lazy = false,
    --
    opts = {
      auto_install = true,
    },
  },

  {
    "neovim/nvim-lspconfig",
    -- lazy = false,

    -- lazy-load events or commands
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "LspInfo", "LspInstall", "LspUninstall" },

    dependencies = {
      -- Useful status updates for LSP
      { 'j-hui/fidget.nvim', opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      {
        'folke/neodev.nvim',
        config = function()
          require("neodev").setup({
            library = {
              plugins = { "neotest" },
              types = true
            },
          })
        end
      }
    },

    config = function()
      -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

      local mason_lspconfig = require('mason-lspconfig')
      local lspconfig = require("lspconfig")

      local on_attach = require('utils.lsp-utils.on_attach');
      local servers = require('utils.lsp-utils.servers');

      -- [[
      -- lspconfig.tsserver.setup({
      --   capabilities = capabilities
      -- })
      -- lspconfig.html.setup({
      --   capabilities = capabilities
      -- })
      -- lspconfig.lua_ls.setup({
      --   capabilities = capabilities
      -- })
      -- ]]

      mason_lspconfig.setup {
        ensure_installed = vim.tbl_keys(servers),
      }

      mason_lspconfig.setup_handlers {
        function(server_name)
          -- require('lspconfig')[server_name].setup {
          lspconfig[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
          }
        end,
      }
    end,
  },
}
