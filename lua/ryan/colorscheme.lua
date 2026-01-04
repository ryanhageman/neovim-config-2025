-- Color Settings
vim.opt.background = "dark"             -- Use dark background
vim.cmd.colorscheme("tokyonight-storm")

-- Terminal color handling
if vim.env.TERM_PROGRAM == "Apple_Terminal" then
  vim.opt.termguicolors = false
elseif vim.fn.has("termguicolors") == 1 then
  vim.opt.termguicolors = true
end

