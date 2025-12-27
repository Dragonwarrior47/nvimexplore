return {
  {
    "folke/tokyonight.nvim",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- load this before all the other start plugins
    config = function()
      require("tokyonight").setup({
        transparent = false,
      })

      -- MOVED OUTSIDE the setup table
      vim.cmd.colorscheme("tokyonight-night")
    end,
  },
}
