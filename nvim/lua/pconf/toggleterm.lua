require("toggleterm").setup{
  -- size can be a number or function which is passed the current terminal
  size = 20,
  open_mapping = [[<A-l>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
  persist_size = true,
  direction = 'float', -- 'vertical' | 'horizontal' | 'tab'
  close_on_exit = true, -- close the terminal window when the process exits
  shell = vim.o.shell, -- change the default shell
  float_opts = {
    border = 'curved', -- | 'double' | 'shadow' | 'curved'
    winblend = 0,
  },
}

local Terminal = require('toggleterm.terminal').Terminal

local node = Terminal:new({cmd = 'node', hidden = true})
local python = Terminal:new({cmd = 'python3', hidden = true})

function TOGGLENODE()
  node:toggle()
end

function TOGGLEPYTHON()
  python:toggle()
end


