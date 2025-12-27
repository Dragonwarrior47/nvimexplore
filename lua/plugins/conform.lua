return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black" },                                     -- Run sequentially
      javascript = { "prettierd", "prettier", stop_after_first = true }, -- Use first available
      javascriptreact = { "prettierd", "prettier", stop_after_first = true },
      typescript = { "prettierd", "prettier", stop_after_first = true },
      typescriptreact = { "prettierd", "prettier", "jq", stop_after_first = true },
      json = { "prettierd", "prettier", stop_after_first = true },
      go = { "goimports", "gofmt" },
      java = { "clang-format" },
      rust = { "rustfmt", lsp_format = "fallback" }, -- Use rustfmt, fall back to LSP if missing
    },

    -- 2. Configure Format on Save
    format_on_save = {
      timeout_ms = 500,        -- Timeout (in milliseconds)
      lsp_format = "fallback", -- Use LSP formatting if no formatter is defined for this filetype
    },
  },

  -- 3. Custom Keybinding (Optional but recommended)
  keys = {
    {
      "<leader>mp",
      function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end,
      mode = "",
      desc = "[M]ake [P]retty (Format Buffer)",
    },
  },
}
