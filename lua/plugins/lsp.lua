-- ~/.config/nvim/lua/plugins/lsp.lua
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      -- Set up mason (installer)
      require("mason").setup()

      -- Set up mason-lspconfig to ensure servers are installed
      require("mason-lspconfig").setup({
        ensure_installed = { "sourcekit", "lua_ls", "ast-grep", "beautysh"  }, -- add servers you want
        -- Optional: automatic setup (see note below)
      })

      -- Common on_attach function (unchanged)
      local on_attach = function(client, bufnr)
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
      end

      -- Capabilities (unchanged)
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.workspace.didChangeWatchedFiles = {
        dynamicRegistration = true,
      }

      -- ------------------------------------------------------------------
      -- NEW WAY: Define server configurations with vim.lsp.config
      -- ------------------------------------------------------------------

      -- SourceKit-LSP (Swift)
      vim.lsp.config('sourcekit', {
        on_attach = on_attach,
        capabilities = capabilities,
        -- No explicit cmd needed if sourcekit-lsp is in PATH (Mason adds it)
      })

      -- Lua language server (for editing your Neovim config)
      vim.lsp.config('lua_ls', {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = { version = 'LuaJIT' },
            diagnostics = { globals = { 'vim' } },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        },
      })

      -- Enable both servers
      vim.lsp.enable({ 'sourcekit', 'lua_ls', 'ast-grep', 'beautysh'})
    end
  }
}
