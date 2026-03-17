return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    dependencies = { "HiPhish/rainbow-delimiters.nvim" },
    config = function()
        local highlight = {
            "RainbowRed",
            "RainbowYellow",
            "RainbowBlue",
            "RainbowOrange",
            "RainbowGreen",
            "RainbowViolet",
            "RainbowCyan",
        }

        local hooks = require("ibl.hooks")

        -- create the highlight groups in the highlight setup hook
        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#F38BA8" })
            vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#F9E2AF" })
            vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#89B4FA" })
            vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#FAB387" })
            vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#A6E3A1" })
            vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#CBA6F7" })
            vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#89DCEB" })
        end)

        vim.g.rainbow_delimiters = { highlight = highlight }

        require("ibl").setup {
            indent = { highlight = highlight },
            whitespace = {
                highlight = highlight,
                remove_blankline_trail = false,
            },
        }

        hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end,
}
