local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local mappings = {

	-- ── Buffers ─────────────────────────────────────────────────────────
	{ "<leader>b", group = "Buffers", nowait = true, remap = false },

	-- ── Code ────────────────────────────────────────────────────────────
	{ "<leader>c", group = "Code (LSP)", nowait = true, remap = false },
	{ "<leader>ct", group = "Trouble", nowait = true, remap = false },

	-- ── Files ───────────────────────────────────────────────────────────
	{ "<leader>f", group = "File", nowait = true, remap = false },

	-- ── Git ─────────────────────────────────────────────────────────────
	{ "<leader>g", group = "Git", nowait = true, remap = false },

	-- ── Search ──────────────────────────────────────────────────────────
	{ "<leader>s", group = "Search", nowait = true, remap = false },
  
	-- ── User ────────────────────────────────────────────────────────────
	{ "<leader>u", group = "User", nowait = true, remap = false },

	-- ── Window ──────────────────────────────────────────────────────────
	{ "<leader>w", group = "Window", nowait = true, remap = false },
}

which_key.setup()
which_key.add(mappings)

