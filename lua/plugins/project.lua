return {
  "ahmedkhalf/project.nvim",
  event = "VeryLazy",
  opts = {
    detection_methods = { "pattern", "lsp" },
    patterns = { ".git", "Makefile", "package.json", ".nvim.lua", "Gemfile" },
    silent_chdir = true,
    manual_mode = false,
  },
  config = function(_, opts)
    require("project_nvim").setup(opts)
  end,
}

