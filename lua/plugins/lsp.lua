-- ~/.config/nvim/lua/plugins/lsp.lua
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        -- Only Mason-installable servers here, no formatters
        ensure_installed = { "lua_ls" },
        automatic_installation = false, -- important on NixOS
      })

      local on_attach = function(client, bufnr)
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
        vim.keymap.set('n', 'K',  vim.lsp.buf.hover, bufopts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
      end

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.workspace.didChangeWatchedFiles = {
        dynamicRegistration = true,
      }

      -- TypeScript / JavaScript (install via: npm i -g typescript-language-server)
      vim.lsp.config('ts_ls', {
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
        },
        settings = {
            typescript = {
                inlayHints = {
                    includeInlayParameterNameHints = "all",
                    includeInlayVariableTypeHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                },
            },
        },
      })

    vim.lsp.config('cssls', {
        on_attach = on_attach,
        capabilities = capabilities,
    })

    vim.lsp.config('jsonls', {
        on_attach = on_attach,
        capabilities = capabilities,
    })

      -- Swift
      vim.lsp.config('sourcekit', {
        on_attach = on_attach,
        capabilities = capabilities,
      })

      -- Lua
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

      -- Enable all servers
    vim.lsp.enable({ 'ts_ls', 'eslint', 'cssls', 'jsonls', 'sourcekit', 'lua_ls', 'sourcekit' }) 
    end
  }
}
