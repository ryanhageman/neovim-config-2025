return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({ async = true })
			end,
			mode = { "n", "v" },
			desc = "Format file or range (in visual mode)",
		},
	},

	opts = {
		formatters_by_ft = {
			-- Ruby
			ruby = { "standardrb" },

			-- JavaScript/TypeScript
			javascript = { "prettier" },
			typescript = { "prettier" },
			javascriptreact = { "prettier" },
			typescriptreact = { "prettier" },
			json = { "prettier" },
			svelte = { "prettier" },

			-- CSS
			css = { "prettier" },
			scss = { "prettier" },

			-- Lua
			lua = { "stylua" },
		},

		-- Set default options
		default_format_opts = {
			lsp_format = "fallback",
		},

		-- Format on save (disabled by default, enable in project-specific config)
		-- format_on_save = { timeout_ms = 500 },
	},

	init = function()
		-- If you want the formatexpr, here is the place to set it
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
