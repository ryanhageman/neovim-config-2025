-- ==========================================================================
-- Keymaps
-- ==========================================================================

local function buf_only()
  vim.cmd("silent! %bd|e#|bd#")
end

vim.keymap.set("n", "<leader>q", ":q<cr>", { desc = "Quit" })

-- Buffer navigation
vim.keymap.set("n", "<leader>bp", ":bp<cr>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bn", ":bn<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bd", ":bd<cr>", { desc = "Delete buffer" })
vim.keymap.set("n", "<leader><tab>", "<c-^>", { desc = "Swap with alternate buffer" })
vim.keymap.set("n", "<leader>bo", buf_only, { desc = "Close all buffers except current" })

-- Files
vim.keymap.set("n", "<leader>fs", ":write<cr>", { desc = "Save file" })
vim.keymap.set("n", "<leader>fS", ":wa<cr>", { desc = "Save all files" })
vim.keymap.set("n", "<leader>ff", ":e ", { desc = "Find file" })

-- Windows
vim.keymap.set("n", "<leader>ww", "<c-w>w", { desc = "Swap windows" })
vim.keymap.set("n", "<leader>wv", "<c-w>v", { desc = "Vertical split" })
vim.keymap.set("n", "<leader>ws", "<c-w>s", { desc = "Horizontal split" })
vim.keymap.set("n", "<leader>wd", "<c-w>c", { desc = "Delete window" })

-- Window navigation
vim.keymap.set("n", "<c-j>", "<c-w><c-j>", { desc = "Move to window below" })
vim.keymap.set("n", "<c-k>", "<c-w><c-k>", { desc = "Move to window above" })
vim.keymap.set("n", "<c-h>", "<c-w><c-h>", { desc = "Move to window left" })
vim.keymap.set("n", "<c-l>", "<c-w><c-l>", { desc = "Move to window right" })

-- Terminal
vim.keymap.set("n", "<leader>'", ":term<cr>", { desc = "Open terminal" })
vim.keymap.set("t", "<c-w>n", "<c-\\><c-n>", { desc = "Normal mode (terminal)" })

-- Terminal mode navigation
vim.keymap.set("t", "<c-j>", "<c-\\><c-n><c-w>j", { desc = "Move to window below" })
vim.keymap.set("t", "<c-k>", "<c-\\><c-n><c-w>k", { desc = "Move to window above" })
vim.keymap.set("t", "<c-h>", "<c-\\><c-n><c-w>h", { desc = "Move to window left" })
vim.keymap.set("t", "<c-l>", "<c-\\><c-n><c-w>l", { desc = "Move to window right" })

