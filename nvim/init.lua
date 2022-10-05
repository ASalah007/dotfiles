
require 'myconf.mappings'
require 'myconf.options'
require 'myconf.mappings'

require 'plugins'
require 'pconf.telescope'
require 'pconf.nvimtree'
require 'pconf.treesitter'
require 'pconf.lualine'
require 'pconf.gitsigns'
require 'pconf.toggleterm'
-- require 'pconf.completion'
require 'pconf.autopairs'
require 'pconf.coc'

local source = 'source ~/.config/nvim/vim/'
vim.cmd(source..'nvimtree.vim')
vim.cmd(source..'ps.vim')
vim.cmd(source..'vimwiki.vim')
vim.cmd(source..'themes.vim')

-- always split vertically
-- local gp = vim.api.nvim_create_augroup("split vertically", {clear = true})
-- vim.api.nvim_create_autocmd("WinNew", {command="wincmd L", group=gp})

-- vim.cmd[[
-- aug python
--     " ftype/python.vim overwrites this
--     au FileType python setlocal ts=4 sts=4 sw=4 expandtab
-- aug end
-- ]]

-- require'lspconfig'.sumneko_lua.setup {
--     settings = {
--         Lua = {
--             diagnostics = {
--                 globals = { 'vim', 'use' }
--             }
--         }
--     }
-- }

