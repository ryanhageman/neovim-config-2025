-- ==========================================================================
-- Netrw Settings
-- ==========================================================================

-- Functions
local function toggle_netrw()
  if vim.bo.filetype == "netrw" then
    vim.cmd("Rexplore")
  else
    vim.cmd("Explore")
  end
end

-- Settings
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 0
vim.g.netrw_browse_split = 0
vim.g.netrw_winsize = 100

-- Keymaps
vim.keymap.set("n", "<leader>e", toggle_netrw, { desc = "Toggle file explorer" })

