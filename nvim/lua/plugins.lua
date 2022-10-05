return require('packer').startup(function()

-- so that it can manage itself
use 'wbthomason/packer.nvim'

-- ========================================================== core development start ==================================================

-- nerd tree note: used with font ubuntu Mono Nerd Regular size 15
use 'kyazdani42/nvim-web-devicons' --  for file icons
use 'kyazdani42/nvim-tree.lua'

--  commenting
use 'tpope/vim-commentary'

--  telescope
--  ripgrep should be installed for live grep => sudo apt-get install ripgrep
use {
  'nvim-telescope/telescope.nvim', tag = '0.1.0',
  requires = { {'nvim-lua/plenary.nvim'} }
}

-- gitsigns
use 'lewis6991/gitsigns.nvim'

-- lsp managers
use { "williamboman/mason.nvim" }
use "williamboman/mason-lspconfig.nvim"
use 'neovim/nvim-lspconfig'

--completion
--use 'hrsh7th/cmp-nvim-lsp'
--use 'hrsh7th/cmp-buffer'
--use 'hrsh7th/cmp-path'
--use 'hrsh7th/cmp-cmdline'
--use 'hrsh7th/nvim-cmp'
--snipets
--use 'L3MON4D3/LuaSnip'
--use 'saadparwaiz1/cmp_luasnip'


use {'neoclide/coc.nvim', branch = 'release'}

-- terminal on the fly
use {"akinsho/toggleterm.nvim", tag = '*'}

--auto pairs
use "windwp/nvim-autopairs"

--surroundings
use "tpope/vim-surround"



-- ========================================================== core development end ==================================================

--  themes
use {'sonph/onehalf', rtp = 'vim' }
use 'joshdick/onedark.vim'
use 'tomasiser/vim-code-dark'
use "EdenEast/nightfox.nvim"
use 'Mofiqul/vscode.nvim'

--  scratch buffers
use 'vim-scripts/scratch.vim'


-- you need to install fzf and bat on system
use 'junegunn/fzf'
use 'junegunn/fzf.vim'

--  vimwiki
use 'vimwiki/vimwiki'

-- lua line
use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
}

-- treesitter
use { 'nvim-treesitter/nvim-treesitter', run = function() require('nvim-treesitter.install').update({ with_sync = true }) end, }

-- which key
use 'liuchengxu/vim-which-key'

end)


