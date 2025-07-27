return {
	-- Mason: Install and manage language servers
	{
		"mason-org/mason.nvim",
		opts = {},
	},

	-- Bridge between Mason and lspconfig
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "ruby_lsp", "lua_ls" },
				automatic_installation = true,
			})
		end,
	},

	-- LSP configurations
	{
		"neovim/nvim-lspconfig",
		dependencies = { "mason-org/mason-lspconfig.nvim" },
		config = function()
			local lspconfig = require("lspconfig")

			-- Ruby LSP (without Rubocop integration)
			lspconfig.ruby_lsp.setup({})

			-- Lua LSP
			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" }, -- Recognize 'vim' global in Neovim configs
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true), -- Make LSP aware of Neovim runtime
						},
						telemetry = {
							enable = false, -- Disable telemetry
						},
					},
				},
			})

			-- LSP keymaps (only for actions NOT handled by Snacks)
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local opts = { buffer = ev.buf }

					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
				end,
			})
		end,
	},
}
