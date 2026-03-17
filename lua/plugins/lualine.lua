-- ~/.config/nvim/lua/plugins/lualine.lua
return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({
                options = {
                    theme = "catppuccin-mocha", -- Or "auto" to match your colorscheme
                },
            })
        end,
    }
}
