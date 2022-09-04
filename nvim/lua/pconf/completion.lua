local lsp_installer = require("nvim-lsp-installer")
local cmp = require 'cmp'
local lspkind = require('lspkind')
local kind_icons = { Text = "", Method = "", Function = "", Constructor = "", Field = "", Variable = "",
  Class = "ﴯ", Interface = "", Module = "", Property = "ﰠ", Unit = "", Value = "", Enum = "",
  Keyword = "", Snippet = "", Color = "", File = "", Reference = "", Folder = "", EnumMember = "",
  Constant = "", Struct = "", Event = "", Operator = "", TypeParameter = "" }

-- load snippets
require("luasnip/loaders/from_vscode").lazy_load()
cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },

  window = {
    -- completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-j>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lua' },
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'cmdline' },
    { name = 'luasnip' }, -- For luasnip users.
  }, {
    -- { name = 'buffer' },
  }),
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format('%s ', kind_icons[vim_item.kind]) -- This concatonates the icons with the name of the item kind
      -- Source
      vim_item.menu = ({
        buffer = "(Buffer)",
        nvim_lsp = "(LSP)",
        luasnip = "(LuaSnip)",
        nvim_lua = "(Lua)",
        latex_symbols = "(LaTeX)",
      })[entry.source.name]
      return vim_item
    end
  },
})


vim.cmd [[
    " gray
    highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080

    " blue
    highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
    highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6

    " light blue
    highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
    highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
    highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE

    " pink
    highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
    highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0

    " front
    highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
    highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
    highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4
]]

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')['jdtls'].setup { capabilities = capabilities } -- java
--  require('lspconfig')['clangd'].setup{capabilities = capabilities} -- c c++

-- nvim-lsp-installer
local lspconfig = require("lspconfig")

local function on_attach(client, bufnr)
  -- set up buffer keymaps, etc.
end

lsp_installer.setup()
lspconfig.jdtls.setup { on_attach = on_attach, capabilities = capabilities }
lspconfig.sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim', 'use' }
      },
    }
  }
}

lspconfig.tsserver.setup {
  on_attach = function(client)
    client.server_capabilities.documentRangeFormattingProvider = false
  end
}
lspconfig.clangd.setup { on_attach = on_attach, capabilities = capabilities }
lspconfig.sqlls.setup { on_attach = on_attach, capabilities = capabilities }
lspconfig.jedi_language_server.setup { on_attach = on_attach, capabilities = capabilities }

-- diagnostics look
local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

vim.diagnostic.config({
  underline = {
    severity = vim.diagnostic.severity.ERROR
  },
  virtual_text = {
    severity = vim.diagnostic.severity.ERROR
  },
  sign = {
    active = signs
  },
  float = {
    header = ""
  }
})

-- bordered window for diagnostics
-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover,{
--     border ="rounded"
-- })

-- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help,{
--     border ="rounded"
-- })

-- suppress error messages from lang servers
-- vim.notify = function(msg, log_level, _opts)
--     if msg:match("exit code") then
--         return
--     end
--     if log_level == vim.log.levels.ERROR then
--         vim.api.nvim_err_writeln(msg)
--     else
--         vim.api.nvim_echo({{msg}}, true, {})
--     end
-- end
