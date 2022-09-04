return require('packer').startup(function()

use 'wbthomason/packer.nvim'

--  themes
use {'sonph/onehalf', rtp = 'vim' }
use 'joshdick/onedark.vim'
use 'tomasiser/vim-code-dark'

--  scratch buffers
use 'vim-scripts/scratch.vim'

-- for better syntax highlighting, other plugins need this
use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

-- for completion
use 'williamboman/nvim-lsp-installer' -- easily install lsp
use 'neovim/nvim-lspconfig'           -- lsp configurations
use 'hrsh7th/nvim-cmp'                -- completion engine
use 'hrsh7th/cmp-nvim-lsp'            -- for lsp
use 'hrsh7th/cmp-path'                -- for path completion
use 'hrsh7th/cmp-cmdline'             -- cmdline completion
use 'hrsh7th/cmp-buffer'              -- for buffer text
use 'hrsh7th/cmp-nvim-lua'            -- for vim completion

-- snip
use 'L3MON4D3/LuaSnip'
use 'saadparwaiz1/cmp_luasnip'
-- use "rafamadriz/friendly-snippets"

-- icons
use 'onsails/lspkind.nvim'


-- nerd tree note: used with font ubuntu Mono Nerd Regular size 15
use 'kyazdani42/nvim-web-devicons' --  for file icons
use 'kyazdani42/nvim-tree.lua'

--  telescope
use 'nvim-lua/plenary.nvim'
use 'nvim-telescope/telescope.nvim'
use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

--  vimwiki
use 'vimwiki/vimwiki'

--  commenting
use 'tpope/vim-commentary'

-- vim api for auto completion
use 'tjdevries/nlua.nvim'

-- java lsp and debugger
-- use 'mfussenegger/nvim-jdtls'

-- html css
use 'mattn/emmet-vim'

-- lua line
use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
}

-- gitsigns
use 'lewis6991/gitsigns.nvim'

-- terminal on the fly 
use {"akinsho/toggleterm.nvim", tag = 'v2.*', config = function()
  require("toggleterm").setup()
end}

-- for formatting
use 'jose-elias-alvarez/null-ls.nvim' 
use 'MunifTanjim/prettier.nvim'

end)


