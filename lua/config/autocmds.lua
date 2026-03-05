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

vim.filetype.add({
  extension = {
    fountain = "fountain",
  },
})

-- inside the same FileType autocmd callback
vim.api.nvim_create_autocmd("BufWritePost", {
  buffer = 0,  -- current buffer only
  callback = function()
    local file = vim.fn.expand("%:p")
    local out  = vim.fn.expand("%:p:r") .. ".pdf"
    local cmd  = string.format("afterwriting --source %s --pdf %s",
                   vim.fn.shellescape(file),
                   vim.fn.shellescape(out))
    vim.fn.jobstart(cmd)  -- silent background export
  end,
  desc = "Fountain: Auto-export PDF on save",
})


