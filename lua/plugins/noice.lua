return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
      routes = {
    -- Route output from external commands to a split at the bottom
    {
      filter = {
        event = "msg_show",
        kind = "cmdline_output",   -- captures :! output
      },
      opts = { split = { position = "bottom" } },
    },
  },
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
  }
}
