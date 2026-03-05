-- ~/.config/nvim/lua/config/autocmds.lua
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local my_group = augroup('MyAutocmds', { clear = true })

-- Highlight on yank
autocmd('TextYankPost', {
    group = my_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 150 })
    end,
})

-- Resize splits when the window is resized [citation:5]
autocmd('VimResized', {
    group = my_group,
    callback = function()
        vim.cmd('tabdo wincmd =')
    end,
})
