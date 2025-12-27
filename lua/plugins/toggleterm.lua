return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    local Terminal = require("toggleterm.terminal").Terminal
    require("toggleterm").setup({
      size = 20,
      open_mapping = [[<C-\>]],
      hide_numbers = true,
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      direction = "float",
      float_opts = {
        border = "curved",
        winblend = 3,
      },
      close_on_exit = true,
    })
    vim.keymap.set("n", "<C-\\>", "<cmd>ToggleTerm<CR>", { desc = "Toggle Floating Terminal" })
    vim.keymap.set("t", "<C-\\>", [[<C-\><C-n><cmd>ToggleTerm<CR>]], { desc = "Close Floating Terminal" })
  end,
}
