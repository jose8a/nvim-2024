-- ......................................................................
-- NOTE: this file is a copy of the configuration found in the
--  `lua/plugins/quarto.lua` config file
--  ..
--  That config file can be found in the quarto-nvim-kickstarter repo:
--      - https://github.com/jmbuhr/quarto-nvim-kickstarter
--
--
--  FIX: Example QUARTO dependencies install on ubuntu-based systems:
--
--          $> sudo apt install imagemagick
--          $> sudo apt install libmagickwand-dev
--          $> sudo apt install liblua5.1-0-dev
--          $> sudo apt install luajit
--          $> sudo apt install tree-sitter-cli
-- ......................................................................
return {

    { -- requires plugins in lua/plugins/treesitter.lua and lua/plugins/lsp.lua
        -- for complete functionality (language features)
        'quarto-dev/quarto-nvim',
        ft = { 'quarto' },
        dev = false,
        opts = {},

        -- lower than 50 so that it doesn't conflict with default lsp-config
        -- see here: https://www.reddit.com/r/neovim/comments/1dotm4w/installing_quarto_raises_exceptions_with_mason/
        priority = 40,
        dependencies = {
            -- for language features in code cells
            -- configured in lua/plugins/lsp.lua and
            -- added as a nvim-cmp source in lua/plugins/completion.lua
            'jmbuhr/otter.nvim',
            'nvim-treesitter/nvim-treesitter',
        },

        config = function()
            local quarto = require("quarto")
            local runner = require("quarto.runner")

            quarto.setup ({
                -- -- defaults ...
                debug = false,
                closePreviewOnExit = true,
                lspFeatures = {
                    enabled = true,
                    chunks = "curly",
                    languages = { "r", "python", "julia", "bash", "html" },
                    diagnostics = {
                        enabled = true,
                        triggers = { "BufWritePost" },
                    },
                    completion = {
                        enabled = true,
                    },
                },
                codeRunner = {
                    enabled = true,
                    -- default_method = nil, -- 'molten' or 'slime'

                    -- 'molten' or 'slime'
                    default_method = 'slime',

                    -- filetype to runner, ie. `{ python = "molten" }`.
                    -- Takes precedence over `default_method`
                    ft_runners = {},

                    -- filetypes which are never sent to a code runner
                    never_run = { "yaml" },
                },
            })

            -- quarto key-bindings
            vim.keymap.set('n', '<leader>kp', quarto.quartoPreview, { silent = true, noremap = true })

            -- code-runner key-bindings
            vim.keymap.set("n", "<leader>kc", runner.run_cell,  { desc = "run cell", silent = true })
            vim.keymap.set("n", "<leader>ka", runner.run_above, { desc = "run cell and above", silent = true })
            vim.keymap.set("n", "<leader>kA", runner.run_all,   { desc = "run all cells", silent = true })
            vim.keymap.set("n", "<leader>kl", runner.run_line,  { desc = "run line", silent = true })
            vim.keymap.set("v", "<leader>kv", runner.run_range, { desc = "run visual range", silent = true })
            vim.keymap.set("n", "<leader>kk", function()
                runner.run_all(true)
            end, { desc = "run all cells of all languages", silent = true })
        end,
    },

    -- { -- directly open ipynb files as quarto docuements
    --     -- and convert back behind the scenes
    --     'GCBallesteros/jupytext.nvim',
    --     opts = {
    --         custom_language_formatting = {
    --             python = {
    --                 extension = 'qmd',
    --                 style = 'quarto',
    --                 force_ft = 'quarto',
    --             },
    --             r = {
    --                 extension = 'qmd',
    --                 style = 'quarto',
    --                 force_ft = 'quarto',
    --             },
    --         },
    --     },
    -- },

    { -- send code from python/r/qmd documets to a terminal or REPL
        -- like ipython, R, bash
        'jpalardy/vim-slime',
        dev = false,
        init = function()
            vim.b['quarto_is_python_chunk'] = false
            Quarto_is_in_python_chunk = function()
                require('otter.tools.functions').is_otter_language_context 'python'
            end

            vim.cmd [[
            let g:slime_dispatch_ipython_pause = 100
            function SlimeOverride_EscapeText_quarto(text)
                call v:lua.Quarto_is_in_python_chunk()
                if exists('g:slime_python_ipython') && len(split(a:text,"\n")) > 1 && b:quarto_is_python_chunk && !(exists('b:quarto_is_r_mode') && b:quarto_is_r_mode)
                    return ["%cpaste -q\n", g:slime_dispatch_ipython_pause, a:text, "--", "\n"]
                else
                    if exists('b:quarto_is_r_mode') && b:quarto_is_r_mode && b:quarto_is_python_chunk
                        return [a:text, "\n"]
                    else
                        return [a:text]
                    end
                end
            endfunction
            ]]

            vim.g.slime_target = 'neovim' -- this is the default
            -- vim.g.slime_target = 'tmux'
            vim.g.slime_no_mappings = true
            vim.g.slime_python_ipython = 1
        end,
        config = function()
            vim.g.slime_input_pid = false
            vim.g.slime_suggest_default = true
            vim.g.slime_menu_config = false
            vim.g.slime_neovim_ignore_unlisted = true

            local function mark_terminal()
                local job_id = vim.b.terminal_job_id
                vim.print('job_id: ' .. job_id)
            end

            local function set_terminal()
                vim.fn.call('slime#config', {})
            end
            vim.keymap.set('n', '<leader>cm', mark_terminal, { desc = '[m]ark terminal' })
            vim.keymap.set('n', '<leader>cs', set_terminal, { desc = '[s]et terminal' })
        end,
    },

    -- { -- paste an image from the clipboard or drag-and-drop
    --     'HakonHarnes/img-clip.nvim',
    --     event = 'BufEnter',
    --     ft = { 'markdown', 'quarto', 'latex' },
    --     opts = {
    --         default = {
    --             dir_path = 'img',
    --         },
    --         filetypes = {
    --             markdown = {
    --                 url_encode_path = true,
    --                 template = '![$CURSOR]($FILE_PATH)',
    --                 drag_and_drop = {
    --                     download_images = false,
    --                 },
    --             },
    --             quarto = {
    --                 url_encode_path = true,
    --                 template = '![$CURSOR]($FILE_PATH)',
    --                 drag_and_drop = {
    --                     download_images = false,
    --                 },
    --             },
    --         },
    --     },
    --     config = function(_, opts)
    --         require('img-clip').setup(opts)
    --         vim.keymap.set('n', '<leader>ii', ':PasteImage<cr>', { desc = 'insert [i]mage from clipboard' })
    --     end,
    -- },

    -- { -- preview equations
    --     'jbyuki/nabla.nvim',
    --     keys = {
    --         { '<leader>qm', ':lua require"nabla".toggle_virt()<cr>', desc = 'toggle [m]ath equations' },
    --     },
    -- },

    -- {
    --     'benlubas/molten-nvim',
    --     enabled = false,
    --     build = ':UpdateRemotePlugins',
    --     init = function()
    --         vim.g.molten_image_provider = 'image.nvim'
    --         vim.g.molten_output_win_max_height = 20
    --         vim.g.molten_auto_open_output = false
    --     end,
    --     keys = {
    --         { '<leader>mi', ':MoltenInit<cr>',           desc = '[m]olten [i]nit' },
    --         {
    --             '<leader>mv',
    --             ':<C-u>MoltenEvaluateVisual<cr>',
    --             mode = 'v',
    --             desc = 'molten eval visual',
    --         },
    --         { '<leader>mr', ':MoltenReevaluateCell<cr>', desc = 'molten re-eval cell' },
    --     },
    -- },
}
