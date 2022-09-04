local ls = require('null-ls')

local formatting = require("null-ls").builtins.formatting
local code_actions = require('null-ls').builtins.code_actions
local diagnostics = require("null-ls").builtins.diagnostics

require("null-ls").setup({
  sources = {
    -- these sources must be installed on your system
    -- require("null-ls").builtins.formatting.stylua,

    -- code actions
    -- ls.builtins.code_actions.gitsigns,
    code_actions.eslint, -- js


    -- formatters
    formatting.prettier, -- js
    formatting.clang_format, -- c++
    formatting.black, -- python

    -- diagnostics
    -- diagnostics.flake8, -- puthon
    -- diagnostics.eslint, -- js

  },
})
