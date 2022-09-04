local o = vim.opt

vim.cmd "set whichwrap+=l,h,<,>,[,]"
o.delcombine = true
o.encoding = 'utf-8'
o.splitbelow = true
o.splitright = true
o.mouse = "a"
o.scrolloff = 8
o.sidescrolloff = 8
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.smartindent = true
o.autoindent = true
o.number=true
o.relativenumber = true
o.wrap = false
o.hls = false
o.ruler = true
o.cursorline = true
o.clipboard="unnamedplus" -- xclip must be installed for this to work
o.termguicolors = true
o.smartcase = true

-- for nvim-cmp
vim.opt.completeopt= {menu,menuone,noselect,preview}

-- fast lsp check
o.updatetime = 300

-- folding
o.foldmethod = "manual"
o.foldlevelstart = 2

-- one global status line
o.laststatus=3
