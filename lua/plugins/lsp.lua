return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			------------------------------------------------------------------
			-- shared on_attach
			------------------------------------------------------------------
			local on_attach = function(client, buf)
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false

				-- keymaps
				vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = buf, desc = "Hover" })
				vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { buffer = buf, desc = "Rename" })
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = buf, desc = "Action" })
				vim.keymap.set("n", "<leader>ck", vim.lsp.buf.signature_help, { buffer = buf, desc = "Signature Help" })
			end

			------------------------------------------------------------------
			-- Ruby LSP
			------------------------------------------------------------------
			vim.lsp.enable("ruby_lsp")
			vim.lsp.config("ruby_lsp", {
				on_attach = on_attach,
			})

			------------------------------------------------------------------
			-- Lua LSP
			------------------------------------------------------------------
			vim.lsp.enable("lua_ls")
			vim.lsp.config("lua_ls", {
				on_attach = on_attach,

				on_init = function(client)
					if client.workspace_folders then
						local path = client.workspace_folders[1].name
						if
							path ~= vim.fn.stdpath("config")
							and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
						then
							return
						end
					end

					client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
						runtime = {
							version = "LuaJIT",
							path = {
								"lua/?.lua",
								"lua/?/init.lua",
							},
						},
						workspace = {
							checkThirdParty = false,
							library = {
								vim.env.VIMRUNTIME,
							},
						},
					})
				end,

				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim", "Snacks" },
						},
					},
				},
			})

			------------------------------------------------------------------
			-- Svelte LSP
			------------------------------------------------------------------
			vim.lsp.enable("svelte")
			vim.lsp.config("svelte", {
				on_attach = on_attach,

				settings = {
					svelte = {
						plugin = {
							svelte = {
								enable = true,
							},
						},
					},
				},
			})
		end,
	},
}
