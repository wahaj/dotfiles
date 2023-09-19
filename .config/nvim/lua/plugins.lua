-- Ensure Plug is installed
local data_path = vim.fn.stdpath('data') .. '/site'
if vim.fn.empty(vim.fn.glob(data_path .. '/autoload/plug.vim')) > 0 then
    vim.fn.system({'curl', '-fLo', data_path .. '/autoload/plug.vim', '--create-dirs',
    'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'})
    vim.cmd 'autocmd VimEnter * PlugInstall --sync | source $MYVIMRC'
end

-- Vim Plugins using vim-plug
local Plug = vim.fn['plug#']
-- Initialize vim-plug
vim.call('plug#begin')

-- Plugins
--

-- Aesthetics
-- Status/Tab Line
Plug 'nvim-lualine/lualine.nvim'
-- Colorscheme
Plug('sainnhe/gruvbox-material', {as = 'gruvbox'})
Plug('catppuccin/nvim', {as = 'catppuccin'})
-- Icons
Plug 'nvim-tree/nvim-web-devicons'

-- File Explorer
-- Plug 'nvim-tree/nvim-tree.lua'

-- Explorer
-- Telescope (Fuzzy Finder) with FZF Native
Plug 'nvim-lua/plenary.nvim'
Plug ('nvim-telescope/telescope.nvim', { ['branch'] = '0.1.x'}) -- Release Branch
Plug ('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' })


-- Linting
Plug ('dense-analysis/ale')

-- Treesitter (Syntax Generation) 
Plug ('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate'})

-- Github Copilot
Plug 'github/copilot.vim'

-- Git Integration 
Plug 'tpope/vim-fugitive'

-- LSP (Language Server Protocol)
--
-- LSP Config
Plug 'neovim/nvim-lspconfig'
-- Mason (Language Server Manager)
Plug ('williamboman/mason.nvim', {config = true})
Plug 'williamboman/mason-lspconfig.nvim'

-- Snippet Engine (luasnip)
Plug 'L3MON4D3/LuaSnip' -- Snippet Engine

-- AutoCompletion (nvim-cmp)
-- Adds LSP completion capabilities
Plug 'hrsh7th/cmp-nvim-lsp' -- LSP Completion
Plug 'hrsh7th/cmp-buffer' -- Buffer Completion
Plug 'hrsh7th/cmp-path' -- Path Completion
Plug 'hrsh7th/cmp-cmdline' -- Command Line Completion
Plug 'saadparwaiz1/cmp_luasnip' -- Snippet Completion
-- Completion Engine
Plug 'hrsh7th/nvim-cmp'

-- Auto Pairs
-- Plug 'jiangmiao/auto-pairs'

-- End Plugins
vim.call('plug#end')
