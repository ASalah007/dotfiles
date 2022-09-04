local function km(old, new)
  vim.api.nvim_set_keymap("n", old, new, { noremap = true, silent = true })
end

-- make space the leader key
km("<Space>", "<Nop>")
vim.g.mapleader = " "


km("<leader>sd", "gg0dG$")
km("<leader>ss", "gg0VG$")
km("<leader>sa", "gg0yG$")


-- km("<C-n>", "<CMD>Lexplore 30<CR>")

-- working with buffers
km("<A-o>", ":bp<cr>")
km("<A-i>", ":bn<cr>")
km("<A-w>", ":bw<cr>")
km("<A-l>", ":ls<cr>")
km("<A-d>", ":bd<cr>")

-- save
km("<C-s>", "<cmd>w<cr>")

-- for nvimtree
km("<C-n>", "<CMD>NvimTreeToggle<CR>")
km("<leader>r", "<CMD>NvimTreeRefresh<CR>")
km("<leader>n", "<CMD>NvimTreeFindFile<CR>")

-- for telescope
km("<leader>ff", "<cmd>Telescope find_files<cr>")
km("<leader>fg", "<cmd>Telescope live_grep<cr>")
km("<leader>fb", "<cmd>Telescope buffers<cr>")
km("<leader>fh", "<cmd>Telescope help_tags<cr>")

-- for lsp
km('gd', '<CMD>lua vim.lsp.buf.definition()<cr>')
km('gD', '<CMD>lua vim.lsp.buf.declaration()<cr>')
km('gi', '<CMD>lua vim.lsp.buf.implementation()<cr>')
km('gw', '<CMD>lua vim.lsp.buf.document_symbol()<cr>')
km('gW', '<CMD>lua vim.lsp.buf.workspace_symbol()<cr>')
km('gr', '<CMD>lua vim.lsp.buf.references()<cr>')
km('gt', '<CMD>lua vim.lsp.buf.type_definition()<cr>')
km('gk', '<CMD>lua vim.lsp.buf.hover()<cr>')
km('<c-k>', '<CMD>lua vim.lsp.buf.signature_help()<cr>')
km('<leader>rn', '<CMD>lua vim.lsp.buf.rename()<cr>')
km('<leader>fa', '<CMD>lua vim.lsp.buf.code_action()<cr>')
km('gf', '<CMD> lua vim.lsp.buf.formatting_sync()<CR>')

-- for diagnostics
km('<leader>dn', '<cmd>lua vim.diagnostic.goto_next()<cr>')
km('<leader>dp', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
km('<leader>dd', '<cmd>lua vim.diagnostic.disable()<cr>')
km('<leader>de', '<cmd>lua vim.diagnostic.enable()<cr>')
km('<leader>dk', '<cmd>lua vim.diagnostic.open_float()<cr>')

-- git signs
km('<leader>gn', '<cmd>Gitsigns next_hunk<cr>')
km('<leader>gp', '<cmd>Gitsigns prev_hunk<cr>')
km('<leader>gk', '<cmd>Gitsigns preview_hunk<cr>')
km('<leader>gb', '<cmd>Gitsigns blame_line<cr>')
km('<leader>gs', '<cmd>Gitsigns stage_hunk<cr>')
km('<leader>gu', '<cmd>Gitsigns undo_stage_hunk<cr>')
km('<leader>gd', '<cmd>Gitsigns diffthis<cr>')
km('<leader>gr', '<cmd>Gitsigns reset_hunk<cr>')
km('<leader>gt', '<cmd>Gitsigns toggle_deleted<cr><cmd>Gitsigns toggle_word_diff<cr>')

-- java specific
-- km('<A-o>', "<Cmd>lua require'jdtls'.organize_imports()<CR>")
-- km('crv', "<Cmd>lua require('jdtls').extract_variable()<CR>")
-- km('crv', "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>")
-- km('crc', "<Cmd>lua require('jdtls').extract_constant()<CR>")
-- km('crc', "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>")
-- km('crm', "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>")

-- -- If using nvim-dap
-- -- This requires java-debug and vscode-java-test bundles, see install steps in this README further below.
-- km('<leader>df', "<Cmd>lua require'jdtls'.test_class()<CR>")
-- km('<leader>dn', "<Cmd>lua require'jdtls'.test_nearest_method()<CR>")

-- arrow keys for resizing
km("<c-up>", ":resize +2<CR>")
km("<c-down>", ":resize -2<CR>")
km("<c-left>", ":vertical resize -2<CR>")
km("<c-right>", ":vertical resize +2<CR>")



local opts = { noremap = true, silent = true };

-- easy coding
vim.api.nvim_set_keymap("i", "<C-j>", "{<cr>}<esc>ko", opts)
-- vim.api.nvim_set_keymap("i", "<C-k>", '""<esc>i', opts)
vim.api.nvim_set_keymap("i", "<A-l>", "<esc>la", opts)
vim.api.nvim_set_keymap("i", "<A-h>", "<esc>ha", opts)


-- del left with c-h and right with c-l in insert mode;
vim.api.nvim_set_keymap("i", "<C-l>", '<esc>s', opts)

-- stay in visual mode after indent
vim.api.nvim_set_keymap("v", "<", "<gv", opts)
vim.api.nvim_set_keymap("v", ">", ">gv", opts)

-- draging text
vim.api.nvim_set_keymap("v", "J", ":move '>+1<CR>gv", opts) -- move the visualized area under the line below the last line in the visualized area
vim.api.nvim_set_keymap("v", "K", ":move '<-2<CR>gv", opts)

-- undo in insert mode
vim.api.nvim_set_keymap("i", "<c-z>", "<cmd>undo<cr>", { noremap = true, silent = true })
