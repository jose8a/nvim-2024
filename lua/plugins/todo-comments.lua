  -- =============================================
  -- Begin custom (non-nvim-kickstart) plugins
  -- =============================================
  return {
    'folke/todo-comments.nvim',

    dependencies = { 'nvim-lua/plenary.nvim' },

    config = function()
      local comments = require('todo-comments')

      -- require('todo-comments').setup {
      comments.setup {
        -- use the default settings
        keywords = {
          FIX = {
            icon = " ", -- used for sign, and w/search results
            color = "error", -- hex color, or named color (see below)
            alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of
              -- other keywords that all map to this FIX keywords
            -- signs = false, -- configure signs for some keywords individually
          },
          TODO = { icon = " ", color = "info" },
          HACK = { icon = " ", color = "warning" },
          WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX", "DOVE" } },
          PERF = { icon = " ", color= "info", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE", "IMPROVE" } },
          NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
          TEST = { icon = ">", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
        },
        highlight = {
          -- uses treesitter to match keywords in comments only if value = true
          comments_only = false,
        },
        colors = {
          error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
          warning = { "DiagnosticWarning", "WarningMsg", "#FBBF24" },
          info = { "DiagnosticInfo", "#2563EB" },
          hint = { "DiagnosticHint", "#10B981" },
          default = { "Identifier", "#7C3AED" },
          test = { "Identifier", "#F2992F" },
        },
      }
    end,
  }


