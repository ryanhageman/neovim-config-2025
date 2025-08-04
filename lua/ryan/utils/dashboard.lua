local art = require("ryan.utils.dashboard-art")

local settings = {
	preset = {
		header = art.jolly_roger(),
		keys = {
      { icon = "🏄", key = "p", desc = "Projects", action = ":lua Snacks.picker.projects()" },
			{ icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
			{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.picker.files({ hidden = true })" },
			{
				icon = " ",
				key = "c",
				desc = "Config",
				action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
			},
			{ icon = " ", key = "s", desc = "Restore Session", section = "session" },
			{ icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
			{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
		},
	},
}

return settings

