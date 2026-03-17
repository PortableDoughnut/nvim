return {
    'bennypowers/nvim-cursorline',
    branch = 'feat/disable-filetype',
    enabled = true,
    opts = {
        cursorline = {
            enable = true,
            timeout = 1000,
            number = false,
        },
        cursorword = {
            enable = true,
            min_length = 3,
            hl = { underline = true },
        },
        disable_filetypes = {
            'alpha',
            'neo-tree',
            'neo-tree-popup',
        },
    },
}
