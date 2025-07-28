return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup()

		vim.keymap.set("n", "<leader>ba", function()
			harpoon:list():add()
		end, { desc = "Harpoon buffer" })

		vim.keymap.set("n", "<leader>.", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Harpoon" })
	end,
}
