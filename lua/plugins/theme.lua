-- ~/.config/nvim/lua/plugins/theme.lua
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- Load this before all other start plugins
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- Other options: latte, frappe, macchiato
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  }
}
