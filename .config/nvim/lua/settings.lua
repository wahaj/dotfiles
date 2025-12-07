-- Option Types
local o = vim.o -- Global options
local g = vim.g -- Global options
local wo = vim.wo -- Window-local options
local bo = vim.bo -- Buffer-local options

-- Leader
g.mapleader = ' ' -- Set leader key
g.maplocalleader = ' ' -- Set local leader key
g.tabstop = 4

-- Global Options
o.filetype = 'on' -- Enable filetype detection
o.syntax = 'on' -- Enable syntax highlighting
o.undofile = true -- Enable persistent undo
o.swapfile = true -- Enable swap files
o.dir = '/tmp' -- Set swap file directory
o.smartcase = true -- Enable smart case
o.laststatus = 2 -- Always show status line
o.hlsearch = true -- Highlight search results
o.incsearch = true -- Incremental search
o.ignorecase = true -- Ignore case
o.clipboard = 'unnamedplus' -- Use system clipboard
o.mouse = 'a' -- Enable mouse support
o.ttyfast = true -- Enable fast terminal
-- o.noshowmode = true -- Hide mode indicator (!causes errors)
o.ruler = true -- Show cursor position
o.splitright = true -- Split right
o.hidden = true -- Enable background buffers
o.termguicolors = true -- Enable true colors
o.encoding = 'utf-8' -- Set encoding
o.scrolloff = 2 -- Lines of context
o.sidescrolloff = 8 -- Columns of context
o.updatetime = 300 -- Faster completion

-- Global plugin options"

-- ALE
-- Enable completion where available.
-- This setting must be set before ALE is loaded.
-- You should not turn this setting on if you wish to use ALE as a completion
-- source for other completion plugins, like Deoplete.
-- o.ale_completion_enabled = true (!causes errors)


-- Window-local Options
wo.number = true -- Show line numbers
wo.relativenumber = true -- Show relative line numbers
wo.wrap = true -- Wrap lines
wo.cursorline = true -- Highlight current line
wo.signcolumn = 'yes' -- Always show sign column

-- Buffer-local Options
bo.expandtab = true -- Use spaces instead of tabs
bo.tabstop = 4 -- Tab size
bo.shiftwidth = 4 -- Indent size
bo.smartindent = true -- Enable smart indent
bo.autoindent = true -- Enable auto indent

