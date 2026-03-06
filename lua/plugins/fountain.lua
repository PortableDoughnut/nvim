-- lua/plugins/fountain.lua  (extend the existing file)
return {
  {
    "kblin/vim-fountain",
    ft = "fountain",
    config = function()
      -- Export current .fountain file to PDF with <leader>fp
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "fountain",
        callback = function()
          vim.keymap.set("n", "<leader>fp", function()
            local file = vim.fn.expand("%:p")          -- full path
            local out  = vim.fn.expand("%:p:r") .. ".pdf" -- same dir, .pdf
            local cmd  = string.format("afterwriting --source %s --pdf %s", 
                           vim.fn.shellescape(file), 
                           vim.fn.shellescape(out))

            vim.notify("Exporting to PDF...", vim.log.levels.INFO)
            vim.fn.jobstart(cmd, {
              on_exit = function(_, code)
                if code == 0 then
                  vim.notify("✓ Exported: " .. out, vim.log.levels.INFO)
                else
                  vim.notify("✗ Export failed (exit " .. code .. ")", vim.log.levels.ERROR)
                end
              end,
            })
          end, { buffer = true, desc = "Fountain: Export to PDF" })

          -- Optional: open the PDF after export with <leader>fo
          vim.keymap.set("n", "<leader>fo", function()
            local out = vim.fn.expand("%:p:r") .. ".pdf"
            vim.fn.jobstart({ "xdg-open", out })  -- use 'open' on mac
          end, { buffer = true, desc = "Fountain: Open PDF" })
        end,
      })
    end,
  },
}
