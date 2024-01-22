
-- [[
-- Tutorials and References for using Dadbod/Dadbod-UI/Dadbod-Completion
--  .. https://archive.is/ZmbBK (archive.today of 'alpha2phi' blogger article)
--  .. https://github.com/alpha2phi/dotfiles/tree/main/config/nvim
--  .. https://habamax.github.io/2019/09/02/use-vim-dadbod-to-query-databases.html
-- ]]

-- [[
-- integrate vimdadbod w/ vim-dadbod-ui
-- " For all config, see here:
-- "   - https://github.com/kristijanhusak/vim-dadbod-ui
-- ]]

-- [[
-- integrate w/nvim-cmp
-- " hrsh7th/nvim-cmp
-- " For all config, see here:
-- "   -  https://github.com/kristijanhusak/vim-dadbod-completion
-- ]]

-- TODO: uncomment out the following settings once we are
-- sure and ready to configure vim-dadbod-ui and vim-dadbod-completion
--
-- ----- autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })
-- -----
-- -----  -- " Source is automatically added, you just need to include it in the chain complete list
-- ----- let g:completion_chain_complete_list = {
-- -----     \   'sql': [
-- -----     \    {'complete_items': ['vim-dadbod-completion']},
-- -----     \   ],
-- -----     \ }
-- ----- -- " Make sure `substring` is part of this list. Other items are optional for this completion source
-- ----- let g:completion_matching_strategy_list = ['exact', 'substring']
-- -----
-- ----- -- " Useful if there's a lot of camel case items
-- ----- let g:completion_matching_ignore_case = 1

