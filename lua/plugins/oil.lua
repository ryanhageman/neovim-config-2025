return {
  'stevearc/oil.nvim',
  opts = {},
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  lazy = false,
  keys = {
    vim.keymap.set("n", "<leader>e", function()
      if vim.bo.filetype == "oil" then
        vim.cmd("bd")  -- Close the oil buffer
      else
        vim.cmd("Oil")  -- Open oil
      end
    end, { desc = "Explorer" })
  },
}
