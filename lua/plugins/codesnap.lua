return {
	"mistricky/codesnap.nvim",
	keys = {
		{
			"<leader>csc",
			"<esc><cmd>CodeSnap<cr>",
			mode = { "x", "v" },
			desc = "Save selected code snapshot into clipboard",
		},
		{
			"<leader>css",
			"<esc><cmd>CodeSnapSave<cr>",
			mode = { "x", "v" },
			desc = "Save selected code snapshot on the Desktop",
		},
	},
	opts = {
		save_path = "~/Desktop",
		-- has_breadcrumbs = true,
		bg_theme = "sea",
		watermark = "",

		-- ── For Keynotes ────────────────────────────────────────────────────
		bg_padding = 0,
		has_breadcrumbs = false,
	},
}
