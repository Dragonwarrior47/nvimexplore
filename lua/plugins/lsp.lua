return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
    config = function()
      -- local capabilities = require("blink.cmp").get_lsp_capabilities()
      local capabilities = {}
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup { capabilities = capabilities }
      lspconfig.gopls.setup { capabilities = capabilities }
      lspconfig.rust_analyzer.setup { capabilities = capabilities }
      lspconfig.protols.setup { capabilities = capabilities }
      --  lspconfig.markdown_oxide.setup { capabilities = capabilities }
      lspconfig.ts_ls.setup { capabilities = capabilities,
        settings = {
          typescript = {
            format = {
              indentSize = 2,
              tabSize = 2,
              convertTabsToSpaces = true,
            },
          },
          javascript = {
            format = {
              indentSize = 2,
              tabSize = 2,
              convertTabsToSpaces = true,
            },
          }
        }
      }
      -- lspconfig.vsg.setup { capabilities = capabilities }
      lspconfig.sqls.setup { capabilities = capabilities }
      lspconfig.pyright.setup { capabilities = capabilities,
        settings = {
          pyright = {
            disableOrganizeImports = true,
          },
          python = {
            analysis = {
              ignore = { '*' },
            },
          },
        },
        on_attach = function(client)
          client.server_capabilities.documentFormattingProvider = false -- Disable formatting
        end,
      }
      require('lspconfig').ruff.setup({
        capabilities = capabilities,
        init_options = {
          settings = {
            lineLength = 100,
            organizeImports = true,
            logLevel = "trace",
            fixAll = true,
            lint = {
              enable = false
            },
            format = {
              enabled = true, -- allow formatting via Ruff
            },

          }
        },
        on_attach = function(client, bufnr)
          client.server_capabilities.documentFormattingProvider = true
        end,
      })
    end,
  }
}
