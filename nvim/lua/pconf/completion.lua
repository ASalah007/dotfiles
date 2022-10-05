local kind_icons = { Text = "", Method = "", Function = "", Constructor = "", Field = "", Variable = "", Class = "ﴯ", Interface = "", Module = "", Property = "ﰠ", Unit = "", Value = "", Enum = "", Keyword = "", Snippet = "", Color = "", File = "", Reference = "", Folder = "", EnumMember = "", Constant = "", Struct = "", Event = "", Operator = "", TypeParameter = "" }
-- mason Lsp Installer
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {"sumneko_lua", "clangd", "pyright" },
})


-- nvim-cmp setup
local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),

  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp', Keyword_length=2, max_item_count=30},
    { name = 'luasnip', max_item_count=5 },
  }, {
    -- { name = 'buffer' },
  }),
  formatting = {
    format = function(entry, vim_item)
      local MAX_LABEL_WIDTH = 25
      local ELLIPSIS_CHAR = '…'
      local get_ws = function (max, len)
        return (" "):rep(max - len)
      end
      local content = vim_item.abbr
      vim_item.dup = { buffer = 1, path = 1, nvim_lsp = 0 }
      if #content > MAX_LABEL_WIDTH then
        vim_item.abbr = vim.fn.strcharpart(content, 0, MAX_LABEL_WIDTH) .. ELLIPSIS_CHAR
      else
        vim_item.abbr = content .. get_ws(MAX_LABEL_WIDTH, #content)
      end
      -- Kind icons
      vim_item.kind = string.format('(%s)', vim_item.kind) -- This concatonates the icons with the name of the item kind
      -- Source
      vim_item.menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        nvim_lua = "[Lua]",
        latex_symbols = "[LaTeX]",
      })[entry.source.name]
      return vim_item
    end
  },
})


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
    { name = 'path', max_item_count=10}
  }, {
    { name = 'cmdline', max_item_count=10 }
  })
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['clangd'].setup { capabilities = capabilities }
require('lspconfig')['sumneko_lua'].setup { capabilities = capabilities }
require('lspconfig')['pyright'].setup { capabilities = capabilities }
require('lspconfig')['svls'].setup { capabilities = capabilities }

