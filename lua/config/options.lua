-- ~/.config/nvim/lua/config/options.lua
vim.opt.number = true          -- Show line numbers
vim.opt.relativenumber = true  -- Show relative line numbers
vim.opt.tabstop = 4             -- Number of spaces a tab counts for
vim.opt.shiftwidth = 4          -- Number of spaces for (auto)indent
vim.opt.expandtab = true        -- Use spaces instead of tabs
vim.opt.termguicolors = true    -- Enable 24-bit RGB colors
vim.opt.hlsearch = false        -- Don't highlight all search results
vim.opt.incsearch = true        -- Show search matches as you type
vim.opt.ignorecase = true       -- Ignore case in search patterns
vim.opt.smartcase = true        -- Override ignorecase if search contains uppercase
vim.opt.scrolloff = 8           -- Keep 8 lines above/below cursor
vim.opt.updatetime = 50         -- Faster completion
vim.opt.colorcolumn = "80"      -- Show a column at 80 characters
vim.opt.guifont = "JetBrainsMono Nerd Font:h14"  -- matches your terminal font
vim.opt.termguicolors = true

vim.g.mapleader = " "       -- Space as leader
vim.g.maplocalleader = ","  -- comma as local leader (optional)
vim.opt.clipboard = "unnamedplus"
