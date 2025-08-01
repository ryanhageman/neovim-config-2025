return {
	"folke/trouble.nvim",
	opts = {},
	cmd = "Trouble",

  -- stylua: ignore
	keys = {
		{ "<leader>ctd", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)", },
		{ "<leader>ctD", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)", },
		{ "<leader>cts", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)", },
		{ "<leader>ctl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP Definitions / references / ... (Trouble)", },
		{ "<leader>ctL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)", },
		{ "<leader>ctq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)", },
	},
}
