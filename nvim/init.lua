
require 'myconf.mappings'
require 'myconf.options'
require 'myconf.mappings'

require 'plugins'
require 'pconf.telescope'
require 'pconf.completion'
require 'pconf.nvimtree'
require 'pconf.treesitter'
require 'pconf.lualine'
require 'pconf.gitsigns'
require 'pconf.toggleterm'
require 'pconf.nullls'
require 'pconf.prettier'


local source = 'source ~/.config/nvim/vim/'

vim.cmd(source..'themes.vim')
vim.cmd(source..'nvimtree.vim')
vim.cmd(source..'ps.vim')
vim.cmd(source..'vimwiki.vim')

-- always split vertically
local gp = vim.api.nvim_create_augroup("split vertically", {clear = true})
vim.api.nvim_create_autocmd("WinNew", {command="wincmd L", group=gp})

-- compile and run java files directly with @r
local ps = vim.api.nvim_create_augroup("problem solving", {clear=true})
vim.api.nvim_create_autocmd("BufNewFile",{
    pattern = {"*.java"},
    command=[[let @r = ':w:!javac %:p:!java %:p < in ']],
    group=ps
})

local wk= vim.api.nvim_create_augroup("convienece", {clear=true})
vim.api.nvim_create_autocmd("BufEnter",{
    pattern = {"index.md"},
    command = [[normal 4l]],
    group = wk
})






