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

          --
          OOMP = { icon = ">", color = "#5232F2" },
          KEEP = { icon = "?", color = "#8242F2" },
          ERR = { icon = "!!", color = "#82424F" },

          --
          ACTIVE = { icon = ">", color = "#77DD77" },
          ACTV = { icon = ">", color = "#77DD77" },
          NOWW = { icon = "!", color = "#77DD77" },

          -- ..tbd
          WAIT = { icon = "!", color = "#CC7010" },
          W8NG = { icon = "!", color = "#CC7010" },
          NEXT = { icon = "!", color = "warning" },

          -- ..tbd
          URGENT = { icon = "!", color = "#FF6000" },
          RGNT = { icon = "!", color = "#FF6000" },
          -- URGENT = { icon = "?", color = "#FF964F" },

          --
          ARCHIVE = { icon = ".", color = "#303450" },
          RKIV = { icon = ".", color = "#303450" },
          L8TR = { icon = ".", color = "#556655" },
          DONE = { icon = ".", color = "#514460" },
        },
        highlight = {
          -- pattern or table of patterns, used for highlighting (vim regex)
          pattern = {
            [[.*<(KEYWORDS)\s*:]],
            [[.*<(KEYWORDS)\s*--]],
            --   [[^\s*--\s*(CUSTOM_TAG):]], -- Custom pattern for Lua comments
            --   [[^\s*#\s*(MY_TASK)\s*:]], -- Custom pattern for Python/Shell comments
          },

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
          xoxo = { "Identifier", "#9932F2" },
        },
      }
    end,
  }


-- =============================================
-- POSSIBLE CUSTOM CODE TAGS TO ADD:
--
-- ref: https://peps.python.org/pep-0350/
-- =============================================
--
-- recommended mnemonic (& synonym list)
-- canonical name: semantics
--
--
-- TODO (MILESTONE, MLSTN, DONE, YAGNI, TBD, TOBEDONE)
-- To do: Informal tasks/features that are pending completion.
--
-- FIXME (XXX, DEBUG, BROKEN, REFACTOR, REFACT, RFCTR, OOPS, SMELL, NEEDSWORK, INSPECT)
-- Fix me: Areas of problematic or ugly code needing refactoring or cleanup.
--
-- BUG (BUGFIX)
-- Bugs: Reported defects tracked in bug database.
--
-- NOBUG (NOFIX, WONTFIX, DONTFIX, NEVERFIX, UNFIXABLE, CANTFIX)
-- ..... Will Not Be Fixed: Problems that are well-known but will never be addressed due to design problems or domain limitations.
--
-- REQ (REQUIREMENT, STORY)
-- Requirements: Satisfactions of specific, formal requirements.
--
-- RFE (FEETCH, NYI, FR, FTRQ, FTR)
-- Requests For Enhancement: Roadmap items not yet implemented.
--
-- IDEA
-- Ideas: Possible RFE candidates, but less formal than RFE.
--
-- ??? (QUESTION, QUEST, QSTN, WTF)
-- Questions: Misunderstood details.
--
-- !!! (ALERT)
-- Alerts: In need of immediate attention.
--
-- HACK (CLEVER, MAGIC)
-- Hacks: Temporary code to force inflexible functionality, or simply a test change, or workaround a known problem.
--
-- PORT (PORTABILITY, WKRD)
-- Portability: Workarounds specific to OS, Python version, etc.
--
-- CAVEAT (CAV, CAVT, WARNING, CAUTION)
-- Caveats: Implementation details/gotchas that stand out as non-intuitive.
--
-- NOTE (HELP)
-- Notes: Sections where a code reviewer found something that needs discussion or further investigation.
--
-- FAQ
-- Frequently Asked Questions: Interesting areas that require external explanation.
--
-- GLOSS (GLOSSARY)
-- Glossary: Definitions for project glossary.
--
-- SEE (REF, REFERENCE)
-- See: Pointers to other code, web link, etc.
--
-- TODOC (DOCDO, DODOC, NEEDSDOC, EXPLAIN, DOCUMENT)
-- Needs Documentation: Areas of code that still need to be documented.
--
-- CRED (CREDIT, THANKS)
-- Credits: Accreditations for external provision of enlightenment.
--
-- STAT (STATUS)
-- Status: File-level statistical indicator of maturity of this file.
--
-- RVD (REVIEWED, REVIEW)
-- Reviewed: File-level indicator that review was conducted.
--
-- =============================================

