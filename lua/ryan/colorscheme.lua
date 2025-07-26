local opt = vim.opt

-- Color Settings
opt.background = "dark"             -- Use dark background
vim.cmd.colorscheme("habamax")

-- Terminal color handling
if vim.env.TERM_PROGRAM == "Apple_Terminal" then
  opt.termguicolors = false
elseif vim.fn.has("termguicolors") == 1 then
  opt.termguicolors = true
end

