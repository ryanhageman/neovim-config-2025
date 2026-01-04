local lsp_servers = require("ryan.utils.lsp-servers")

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "tokyonight",
				component_separators = "|",
				section_separators = { left = "", right = "" },
				globalstatus = true,
				disabled_filetypes = {},
        always_show_tabline = false
			},

			tabline = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { { "tabs", separator = { left = "", right = "" }, left_padding = 2 } },
			},

			winbar = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = { { "filename", separator = { left = "", right = "" } } },
				lualine_z = {},
			},

			inactive_winbar = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = { "filename" },
				lualine_z = {},
			},

			sections = {
				lualine_a = { { "mode", separator = { left = "" }, left_padding = 2 } },
				lualine_b = {
					{ "filetype", icon_only = true, separator = { right = "" } },
					{
						"filename",
						path = 4,
						file_status = true,
						symbols = {
							modified = "●",
						},
					},
				},
				lualine_c = { "location", "progress" },
				lualine_x = {
					{
						lsp_servers,
					},
					"diff",
					"diagnostics",
				},
				lualine_y = { { "datetime", style = "%a, %b %d - %I:%M %p" } },
				lualine_z = { { "branch", separator = { right = "" }, left_padding = 2 } },
			},

			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
