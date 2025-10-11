return {
  --{
  --"catppuccin/nvim",
  --config = function()
  --require("catppuccin").setup {
  --term_colors = true,
  --flavour = "mocha",
  --transparent_background = false
  --}
  --vim.cmd.colorscheme("catppuccin")
  --end
  --},
  {
    "folke/tokyonight.nvim",
    config = function()
      require("tokyonight").setup {
        vim.cmd.colorscheme("tokyonight-night")
      }
    end
  }
}
