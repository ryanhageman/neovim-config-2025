local utils = require("ryan.utils.obsidian-utils")

return {
	"obsidian-nvim/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	opts = {
		legacy_commands = false,

		workspaces = {
			{
				name = "Excella",
				path = "/Users/ryan/Library/CloudStorage/Dropbox/Excella Notes",
			},
		},

		new_notes_location = "Fleeting Notes",

		daily_notes = {
			folder = "Daily Notes",
			template = "daily_notes.md",
			workdays_only = true,
		},

		templates = {
			folder = "Ξ Neovim Templates",
			substitutions = {
				date_title = utils.date_title,
			},
		},

		note_id_func = function(title)
			local name = ""

			if title ~= nil then
				name = title
			else
				name = tostring(os.time())
			end

			return name
		end,
	},
}
