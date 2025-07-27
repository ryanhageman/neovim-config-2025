return {
  'stevearc/oil.nvim',
  opts = {},
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  lazy = false,
  keys = {
    vim.keymap.set("n", "<leader>e", "<cmd>Oil<CR>", { desc = "Explorer" }),
  },
}
